import SwiftUI

struct QuizPlayView: View {

    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                progressBar
                if let question = viewModel.currentQuestion {
                    ScrollView {
                        VStack(spacing: 20) {
                            questionCard(question)
                            choicesGrid(question)
                        }
                        .padding()
                    }

                    if viewModel.answers[question.id] != nil {
                        nextButton(question)
                    }
                }
            }
            .navigationTitle("Q\(viewModel.currentIndex + 1) / \(viewModel.questions.count)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("やめる") { viewModel.restart() }
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: - Components

    private var progressBar: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(.systemGray5))
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: geo.size.width * viewModel.progress)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.progress)
            }
        }
        .frame(height: 4)
    }

    private func questionCard(_ question: QuizQuestion) -> some View {
        VStack(spacing: 12) {
            Text(questionLabel(question))
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(question.questionText)
                .font(question.mode == .meaningFromProverb ? .title2 : .body)
                .fontWeight(question.mode == .meaningFromProverb ? .bold : .regular)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    private func choicesGrid(_ question: QuizQuestion) -> some View {
        VStack(spacing: 12) {
            ForEach(question.choices) { proverb in
                choiceButton(proverb, question: question)
            }
        }
    }

    private func choiceButton(_ proverb: Proverb, question: QuizQuestion) -> some View {
        let answered = viewModel.answers[question.id] != nil
        let isChosen = viewModel.answers[question.id] == proverb.id
        let isCorrect = proverb.id == question.correct.id

        let bgColor: Color = {
            guard answered else { return Color(.systemGray6) }
            if isCorrect { return Color.green.opacity(0.2) }
            if isChosen { return Color.red.opacity(0.2) }
            return Color(.systemGray6)
        }()

        let borderColor: Color = {
            guard answered else { return .clear }
            if isCorrect { return .green }
            if isChosen { return .red }
            return .clear
        }()

        return Button {
            if !answered { viewModel.answer(proverbID: proverb.id) }
        } label: {
            HStack(spacing: 12) {
                if answered {
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : (isChosen ? "xmark.circle.fill" : "circle"))
                        .foregroundStyle(isCorrect ? .green : (isChosen ? .red : .secondary))
                        .font(.title3)
                }
                Text(question.choiceText(for: proverb))
                    .font(.body)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(bgColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.2), value: answered)
    }

    private func nextButton(_ question: QuizQuestion) -> some View {
        Button {
            viewModel.next()
        } label: {
            Text(viewModel.isLastQuestion ? "結果を見る" : "次の問題")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .padding()
    }

    // MARK: - Helpers

    private func questionLabel(_ question: QuizQuestion) -> String {
        switch question.mode {
        case .meaningFromProverb: return "このことわざの意味は？"
        case .proverbFromMeaning: return "この意味のことわざは？"
        }
    }
}
