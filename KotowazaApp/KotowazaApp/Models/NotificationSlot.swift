import Foundation

struct NotificationSlot: Codable, Identifiable {
    var id: Int
    var enabled: Bool
    var hour: Int
    var minute: Int
    var category: ProverbCategory?

    static let defaults: [NotificationSlot] = [
        NotificationSlot(id: 0, enabled: false, hour: 8,  minute: 0, category: nil),
        NotificationSlot(id: 1, enabled: false, hour: 12, minute: 0, category: nil),
        NotificationSlot(id: 2, enabled: false, hour: 20, minute: 0, category: nil),
    ]

    var timeAsDate: Date {
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components) ?? Date()
    }

    var categoryLabel: String {
        category?.rawValue ?? "すべて"
    }
}
