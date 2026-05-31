import SwiftUI

struct QuizSetupView: View {

    @ObservedObject var viewModel: QuizViewModel

    private let questionCountOptions = [5, 10, 20]

    var body: some View {
        Form {
            modeSection
            filterSection
            countSection
            startSection
        }
        .navigationTitle("クイズ設定")
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - Sections

    private var modeSection: some View {
        Section("出題形式") {
            ForEach(QuizMode.allCases) { mode in
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(modeTitle(mode))
                            .font(.body)
                        Text(modeDescription(mode))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    if viewModel.selectedMode == mode {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.orange)
                            .fontWeight(.semibold)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture { viewModel.selectedMode = mode }
            }
        }
    }

    private var filterSection: some View {
        Section("出題範囲") {
            filterRow(.random)
            ForEach(ProverbCategory.allCases, id: \.self) { cat in
                filterRow(.category(cat))
            }
        }
    }

    private func filterRow(_ filter: QuizFilter) -> some View {
        HStack {
            if case .category(let cat) = filter {
                Image(systemName: cat.icon)
                    .foregroundStyle(cat.color)
                    .frame(width: 24)
            } else {
                Image(systemName: "shuffle")
                    .foregroundStyle(.orange)
                    .frame(width: 24)
            }
            Text(filter.label)
            Spacer()
            if viewModel.selectedFilter == filter {
                Image(systemName: "checkmark")
                    .foregroundStyle(.orange)
                    .fontWeight(.semibold)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture { viewModel.selectedFilter = filter }
    }

    private var countSection: some View {
        Section("問題数") {
            Picker("問題数", selection: $viewModel.questionCount) {
                ForEach(questionCountOptions, id: \.self) { n in
                    Text("\(n)問").tag(n)
                }
            }
            .pickerStyle(.segmented)
            .listRowBackground(Color.clear)
        }
    }

    private var startSection: some View {
        Section {
            Button {
                viewModel.startQuiz()
            } label: {
                HStack {
                    Spacer()
                    Label("クイズを始める", systemImage: "play.fill")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.vertical, 4)
            }
            .listRowBackground(Color.orange)
        }
    }

    // MARK: - Helpers

    private func modeTitle(_ mode: QuizMode) -> String {
        switch mode {
        case .meaningFromProverb: return "ことわざ → 意味"
        case .proverbFromMeaning: return "意味 → ことわざ"
        }
    }

    private func modeDescription(_ mode: QuizMode) -> String {
        switch mode {
        case .meaningFromProverb: return "ことわざを見て、正しい意味を選ぶ"
        case .proverbFromMeaning: return "意味を見て、正しいことわざを選ぶ"
        }
    }
}
