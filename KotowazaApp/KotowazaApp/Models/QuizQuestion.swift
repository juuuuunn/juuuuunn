import Foundation

enum QuizMode: String, CaseIterable, Identifiable {
    case meaningFromProverb = "ことわざ→意味"
    case proverbFromMeaning = "意味→ことわざ"

    var id: String { rawValue }
}

enum QuizFilter: Equatable {
    case random
    case category(ProverbCategory)

    var label: String {
        switch self {
        case .random: return "ランダム"
        case .category(let c): return c.rawValue
        }
    }
}

struct QuizQuestion: Identifiable {
    let id: UUID = UUID()
    let mode: QuizMode
    let correct: Proverb
    let choices: [Proverb]

    var questionText: String {
        switch mode {
        case .meaningFromProverb: return correct.text
        case .proverbFromMeaning: return correct.meaning
        }
    }

    func choiceText(for proverb: Proverb) -> String {
        switch mode {
        case .meaningFromProverb: return proverb.meaning
        case .proverbFromMeaning: return proverb.text
        }
    }
}

struct QuizResult {
    let questions: [QuizQuestion]
    let answers: [UUID: Int]    // questionId -> chosen Proverb.id

    var totalCount: Int { questions.count }

    var correctCount: Int {
        questions.filter { q in answers[q.id] == q.correct.id }.count
    }

    var accuracy: Double {
        totalCount == 0 ? 0 : Double(correctCount) / Double(totalCount)
    }

    func isCorrect(_ question: QuizQuestion) -> Bool {
        answers[question.id] == question.correct.id
    }

    func chosenProverb(for question: QuizQuestion) -> Proverb? {
        guard let chosenID = answers[question.id] else { return nil }
        return question.choices.first { $0.id == chosenID }
    }
}
