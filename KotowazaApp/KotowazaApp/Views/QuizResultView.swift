import SwiftUI

struct QuizResultView: View {

    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    scoreCard
                    reviewList
                }
                .padding()
            }
            .navigationTitle("結果")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.restart()
                    } label: {
                        Label("もう一度", systemImage: "arrow.counterclockwise")
                    }
                    .tint(.orange)
                }
            }
        }
    }

    // MARK: - Score Card

    private var scoreCard: some View {
        let result = viewModel.result

        return VStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 12)
                Circle()
                    .trim(from: 0, to: result.accuracy)
                    .stroke(scoreColor(result.accuracy), style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 0.8), value: result.accuracy)

                VStack(spacing: 4) {
                    Text("\(result.correctCount)")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundStyle(scoreColor(result.accuracy))
                    Text("/ \(result.totalCount)問")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(width: 160, height: 160)

            Text(scoreMessage(result.accuracy))
                .font(.title3)
                .fontWeight(.semibold)

            HStack(spacing: 32) {
                statLabel(title: "正解率", value: String(format: "%.0f%%", result.accuracy * 100))
                statLabel(title: "正解", value: "\(result.correctCount)問")
                statLabel(title: "不正解", value: "\(result.totalCount - result.correctCount)問")
            }
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func statLabel(title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headline)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Review List

    private var reviewList: some View {
        let result = viewModel.result

        return VStack(alignment: .leading, spacing: 12) {
            Text("問題の振り返り")
                .font(.headline)
                .padding(.horizontal, 4)

            ForEach(Array(result.questions.enumerated()), id: \.element.id) { index, question in
                reviewRow(question: question, index: index + 1, result: result)
            }
        }
    }

    private func reviewRow(question: QuizQuestion, index: Int, result: QuizResult) -> some View {
        let correct = result.isCorrect(question)
        let chosen = result.chosenProverb(for: question)

        return VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundStyle(correct ? .green : .red)
                    .font(.title3)
                    .padding(.top, 2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Q\(index). \(question.questionText)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(2)

                    Text("正解：\(question.correct.text)")
                        .font(.caption)
                        .foregroundStyle(.green)

                    if !correct, let chosen {
                        Text("あなた：\(question.choiceText(for: chosen))")
                            .font(.caption)
                            .foregroundStyle(.red)
                            .lineLimit(2)
                    }
                }
            }
        }
        .padding()
        .background(correct ? Color.green.opacity(0.08) : Color.red.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    // MARK: - Helpers

    private func scoreColor(_ accuracy: Double) -> Color {
        if accuracy >= 0.8 { return .green }
        if accuracy >= 0.5 { return .orange }
        return .red
    }

    private func scoreMessage(_ accuracy: Double) -> String {
        switch accuracy {
        case 1.0:        return "パーフェクト！"
        case 0.8..<1.0:  return "すばらしい！"
        case 0.6..<0.8:  return "なかなか良い！"
        case 0.4..<0.6:  return "もう少し！"
        default:         return "もっと練習しよう"
        }
    }
}
