import Foundation
import SwiftUI

enum ProverbCategory: String, CaseIterable, Codable, Hashable {
    case effort = "努力・根気"
    case wisdom = "知恵・学び"
    case relationships = "人間関係"
    case nature = "自然・時間"
    case action = "行動・判断"
    case luck = "運・運命"
    case emotion = "感情・心"

    var icon: String {
        switch self {
        case .effort:        return "flame.fill"
        case .wisdom:        return "lightbulb.fill"
        case .relationships: return "person.2.fill"
        case .nature:        return "leaf.fill"
        case .action:        return "arrow.forward.circle.fill"
        case .luck:          return "star.fill"
        case .emotion:       return "heart.fill"
        }
    }

    var color: Color {
        switch self {
        case .effort:        return Color(red: 0.95, green: 0.40, blue: 0.27)
        case .wisdom:        return Color(red: 0.98, green: 0.75, blue: 0.18)
        case .relationships: return Color(red: 0.29, green: 0.65, blue: 0.92)
        case .nature:        return Color(red: 0.33, green: 0.72, blue: 0.44)
        case .action:        return Color(red: 0.60, green: 0.36, blue: 0.92)
        case .luck:          return Color(red: 0.98, green: 0.55, blue: 0.20)
        case .emotion:       return Color(red: 0.93, green: 0.35, blue: 0.55)
        }
    }
}

struct Proverb: Identifiable, Codable, Hashable {
    let id: Int
    let text: String
    let reading: String
    let meaning: String
    let example: String
    let category: ProverbCategory
}
