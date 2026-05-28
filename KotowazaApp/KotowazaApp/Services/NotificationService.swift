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

    // 毎日指定時刻に通知をスケジュールする（起動時に呼ぶ）
    func scheduleDailyNotifications(hour: Int, minute: Int) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        // 今日を基準に 64 日分スケジュール（iOSの上限は64件）
        for dayOffset in 0..<64 {
            let proverb = proverbForDayOffset(dayOffset)
            scheduleNotification(for: proverb, hour: hour, minute: minute, dayOffset: dayOffset)
        }
    }

    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

    // MARK: - Private

    private func proverbForDayOffset(_ offset: Int) -> Proverb {
        // 固定シード: 起動日ごとにことわざが変わるが再起動しても同じことわざ
        let today = Calendar.current.startOfDay(for: Date())
        guard let targetDate = Calendar.current.date(byAdding: .day, value: offset, to: today) else {
            return allProverbs[offset % allProverbs.count]
        }
        let daysSinceEpoch = Int(targetDate.timeIntervalSince1970) / 86400
        let index = ((daysSinceEpoch % allProverbs.count) + allProverbs.count) % allProverbs.count
        return allProverbs[index]
    }

    private func scheduleNotification(for proverb: Proverb,
                                      hour: Int,
                                      minute: Int,
                                      dayOffset: Int) {
        let content = UNMutableNotificationContent()
        content.title = "今日のことわざ"
        content.body = "「\(proverb.text)」\n\(proverb.meaning.prefix(40))…"
        content.sound = .default

        var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        dateComponents.day = (dateComponents.day ?? 0) + dayOffset
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(
            identifier: "kotowaza_day_\(dayOffset)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}
