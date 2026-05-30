import Foundation
import UserNotifications

final class NotificationService {

    static let shared = NotificationService()

    private init() {}

    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async { completion(granted) }
        }
    }

    func checkAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async { completion(settings.authorizationStatus) }
        }
    }

    // 最大3スロット × 21日分 = 63件（iOSの上限64件以内）
    func scheduleNotifications(slots: [NotificationSlot]) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        let enabledSlots = slots.filter(\.enabled)
        let daysPerSlot = enabledSlots.isEmpty ? 0 : min(21, 63 / max(enabledSlots.count, 1))

        for slot in enabledSlots {
            for dayOffset in 0..<daysPerSlot {
                let proverb = proverbForDayOffset(dayOffset, category: slot.category)
                scheduleNotification(for: proverb, slot: slot, dayOffset: dayOffset)
            }
        }
    }

    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

    // MARK: - Private

    private func proverbForDayOffset(_ offset: Int, category: ProverbCategory?) -> Proverb {
        let pool: [Proverb]
        if let category {
            let filtered = allProverbs.filter { $0.category == category }
            pool = filtered.isEmpty ? allProverbs : filtered
        } else {
            pool = allProverbs
        }

        let today = Calendar.current.startOfDay(for: Date())
        guard let targetDate = Calendar.current.date(byAdding: .day, value: offset, to: today) else {
            return pool[offset % pool.count]
        }
        let daysSinceEpoch = Int(targetDate.timeIntervalSince1970) / 86400
        let index = ((daysSinceEpoch % pool.count) + pool.count) % pool.count
        return pool[index]
    }

    private func scheduleNotification(for proverb: Proverb, slot: NotificationSlot, dayOffset: Int) {
        let content = UNMutableNotificationContent()
        content.title = slot.category.map { "今日の\($0.rawValue)" } ?? "今日のことわざ"
        content.body = "「\(proverb.text)」\n\(proverb.meaning.prefix(40))…"
        content.sound = .default

        var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        dateComponents.day = (dateComponents.day ?? 0) + dayOffset
        dateComponents.hour = slot.hour
        dateComponents.minute = slot.minute
        dateComponents.second = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(
            identifier: "kotowaza_slot\(slot.id)_day_\(dayOffset)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}
