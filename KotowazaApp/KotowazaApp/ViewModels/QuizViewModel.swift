import Foundation
import Combine

final class QuizViewModel: ObservableObject {

    // Setup
    @Published var selectedMode: QuizMode = .meaningFromProverb
    @Published var selectedFilter: QuizFilter = .random
    @Published var questionCount: Int = 10

    // Session
    @Published var questions: [QuizQuestion] = []
    @Published var currentIndex: Int = 0
    @Published var answers: [UUID: Int] = [:]
    @Published var phase: Phase = .setup

    enum Phase {
        case setup, playing, result
    }

    var currentQuestion: QuizQuestion? {
        guard currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }

    var progress: Double {
        questions.isEmpty ? 0 : Double(currentIndex) / Double(questions.count)
    }

    var result: QuizResult {
        QuizResult(questions: questions, answers: answers)
    }

    var isLastQuestion: Bool {
        currentIndex == questions.count - 1
    }

    // MARK: - Actions

    func startQuiz() {
        let pool = filteredPool()
        questions = generateQuestions(from: pool)
        currentIndex = 0
        answers = [:]
        phase = .playing
    }

    func answer(proverbID: Int) {
        guard let q = currentQuestion, answers[q.id] == nil else { return }
        answers[q.id] = proverbID
    }

    func next() {
        if isLastQuestion {
            phase = .result
        } else {
            currentIndex += 1
        }
    }

    func restart() {
        phase = .setup
    }

    // MARK: - Private

    private func filteredPool() -> [Proverb] {
        switch selectedFilter {
        case .random:
            return allProverbs
        case .category(let cat):
            let filtered = allProverbs.filter { $0.category == cat }
            return filtered.isEmpty ? allProverbs : filtered
        }
    }

    private func generateQuestions(from pool: [Proverb]) -> [QuizQuestion] {
        let count = min(questionCount, pool.count)
        let shuffled = pool.shuffled()
        let correctProverbs = Array(shuffled.prefix(count))

        return correctProverbs.map { correct in
            let wrongChoices = pool
                .filter { $0.id != correct.id }
                .shuffled()
                .prefix(3)
            let choices = ([correct] + wrongChoices).shuffled()
            return QuizQuestion(mode: selectedMode, correct: correct, choices: choices)
        }
    }
}
