import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var viewModel: ProverbViewModel
    @State private var showDetail = false

    private var dateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy年M月d日（E）"
        return formatter.string(from: Date())
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    dateHeader
                    proverbCard
                    categoryBadge
                    meaningSection
                    exampleSection
                    Spacer(minLength: 32)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
            }
            .navigationTitle("今日のことわざ")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
        }
    }

    // MARK: - Subviews

    private var dateHeader: some View {
        Text(dateString)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var proverbCard: some View {
        VStack(spacing: 16) {
            Text(viewModel.todaysProverb.text)
                .font(.system(size: 30, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)

            Text(viewModel.todaysProverb.reading)
                .font(.system(size: 14, design: .default))
                .foregroundStyle(.white.opacity(0.85))
        }
        .padding(28)
        .background(
            LinearGradient(
                colors: [
                    viewModel.todaysProverb.category.color,
                    viewModel.todaysProverb.category.color.opacity(0.75)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: viewModel.todaysProverb.category.color.opacity(0.35),
                radius: 12, x: 0, y: 6)
    }

    private var categoryBadge: some View {
        HStack(spacing: 6) {
            Image(systemName: viewModel.todaysProverb.category.icon)
            Text(viewModel.todaysProverb.category.rawValue)
                .font(.subheadline.weight(.medium))
        }
        .foregroundStyle(viewModel.todaysProverb.category.color)
        .padding(.horizontal, 14)
        .padding(.vertical, 6)
        .background(viewModel.todaysProverb.category.color.opacity(0.12))
        .clipShape(Capsule())
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var meaningSection: some View {
        cardSection(title: "意味", icon: "text.quote") {
            Text(viewModel.todaysProverb.meaning)
                .font(.body)
                .foregroundStyle(.primary)
                .lineSpacing(5)
        }
    }

    private var exampleSection: some View {
        cardSection(title: "例文", icon: "bubble.left.fill") {
            Text(viewModel.todaysProverb.example)
                .font(.body)
                .foregroundStyle(.primary)
                .lineSpacing(5)
        }
    }

    private func cardSection<Content: View>(title: String,
                                            icon: String,
                                            @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            content()
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    HomeView()
        .environmentObject(ProverbViewModel())
}
