import SwiftUI

struct QuizView: View {

    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        switch viewModel.phase {
        case .setup:
            QuizSetupView(viewModel: viewModel)
        case .playing:
            QuizPlayView(viewModel: viewModel)
        case .result:
            QuizResultView(viewModel: viewModel)
        }
    }
}
