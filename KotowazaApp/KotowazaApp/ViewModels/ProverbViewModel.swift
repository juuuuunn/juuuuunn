import Foundation
import Combine
import UserNotifications

final class ProverbViewModel: ObservableObject {

    @Published var todaysProverb: Proverb
    @Published var selectedCategory: ProverbCategory? = nil
    @Published var notificationSlots: [NotificationSlot] = NotificationSlot.defaults
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

    var notificationEnabled: Bool {
        notificationSlots.contains(where: \.enabled)
    }

    func requestNotificationPermission(slotId: Int) {
        notificationService.requestAuthorization { [weak self] granted in
            guard let self else { return }
            if granted {
                self.notificationSlots[slotId].enabled = true
                self.notificationService.scheduleNotifications(slots: self.notificationSlots)
            }
            self.saveSettings()
            self.refreshAuthorizationStatus()
        }
    }

    func updateSlot(_ slot: NotificationSlot) {
        guard slot.id < notificationSlots.count else { return }
        notificationSlots[slot.id] = slot
        saveSettings()
        if notificationEnabled {
            notificationService.scheduleNotifications(slots: notificationSlots)
        } else {
            notificationService.cancelAllNotifications()
        }
    }

    func toggleSlot(id: Int, enabled: Bool) {
        guard id < notificationSlots.count else { return }
        notificationSlots[id].enabled = enabled
        saveSettings()
        if notificationEnabled {
            notificationService.scheduleNotifications(slots: notificationSlots)
        } else {
            notificationService.cancelAllNotifications()
        }
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
        if let data = try? JSONEncoder().encode(notificationSlots) {
            UserDefaults.standard.set(data, forKey: "notificationSlots")
        }
    }

    private func loadSettings() {
        let defaults = UserDefaults.standard

        if let data = defaults.data(forKey: "notificationSlots"),
           let slots = try? JSONDecoder().decode([NotificationSlot].self, from: data) {
            notificationSlots = slots
            return
        }

        // Migrate from old single-slot keys
        if defaults.object(forKey: "notificationEnabled") != nil {
            let wasEnabled = defaults.bool(forKey: "notificationEnabled")
            let hour = defaults.object(forKey: "notificationHour") as? Int ?? 8
            let minute = defaults.object(forKey: "notificationMinute") as? Int ?? 0
            notificationSlots[0].enabled = wasEnabled
            notificationSlots[0].hour = hour
            notificationSlots[0].minute = minute
            defaults.removeObject(forKey: "notificationEnabled")
            defaults.removeObject(forKey: "notificationHour")
            defaults.removeObject(forKey: "notificationMinute")
            saveSettings()
        }
    }
}
