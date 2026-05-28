import Foundation
import Combine
import UserNotifications

final class ProverbViewModel: ObservableObject {

    @Published var todaysProverb: Proverb
    @Published var selectedCategory: ProverbCategory? = nil
    @Published var notificationEnabled: Bool = false
    @Published var notificationHour: Int = 8
    @Published var notificationMinute: Int = 0
    @Published var authorizationStatus: UNAuthorizationStatus = .notDetermined

    private let notificationService = NotificationService.shared

    init() {
        todaysProverb = Self.proverb(for: Date())
        loadSettings()
        refreshAuthorizationStatus()
    }

    var filteredProverbs: [Proverb] {
        guard let category = selectedCategory else { return allProverbs }
        return allProverbs.filter { $0.category == category }
    }

    var proverbsByCategory: [ProverbCategory: [Proverb]] {
        Dictionary(grouping: allProverbs, by: \.category)
    }

    // MARK: - Notification

    func requestNotificationPermission() {
        notificationService.requestAuthorization { [weak self] granted in
            guard let self else { return }
            self.notificationEnabled = granted
            if granted {
                self.notificationService.scheduleDailyNotifications(
                    hour: self.notificationHour,
                    minute: self.notificationMinute
                )
            }
            self.saveSettings()
            self.refreshAuthorizationStatus()
        }
    }

    func updateNotificationTime(hour: Int, minute: Int) {
        notificationHour = hour
        notificationMinute = minute
        saveSettings()
        if notificationEnabled {
            notificationService.scheduleDailyNotifications(hour: hour, minute: minute)
        }
    }

    func toggleNotification(enabled: Bool) {
        notificationEnabled = enabled
        if enabled {
            notificationService.scheduleDailyNotifications(
                hour: notificationHour,
                minute: notificationMinute
            )
        } else {
            notificationService.cancelAllNotifications()
        }
        saveSettings()
    }

    func refreshAuthorizationStatus() {
        notificationService.checkAuthorizationStatus { [weak self] status in
            self?.authorizationStatus = status
        }
    }

    // MARK: - Private

    private static func proverb(for date: Date) -> Proverb {
        let daysSinceEpoch = Int(Calendar.current.startOfDay(for: date).timeIntervalSince1970) / 86400
        let index = ((daysSinceEpoch % allProverbs.count) + allProverbs.count) % allProverbs.count
        return allProverbs[index]
    }

    private func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(notificationEnabled, forKey: "notificationEnabled")
        defaults.set(notificationHour, forKey: "notificationHour")
        defaults.set(notificationMinute, forKey: "notificationMinute")
    }

    private func loadSettings() {
        let defaults = UserDefaults.standard
        notificationEnabled = defaults.bool(forKey: "notificationEnabled")
        notificationHour = defaults.object(forKey: "notificationHour") as? Int ?? 8
        notificationMinute = defaults.object(forKey: "notificationMinute") as? Int ?? 0
    }
}
