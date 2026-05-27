import SwiftUI

struct ProverbDetailView: View {

    let proverb: Proverb

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerCard
                categoryBadge
                meaningCard
                exampleCard
                Spacer(minLength: 32)
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
        }
        .navigationTitle(proverb.text)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(
                    item: "【ことわざ】\(proverb.text)\n意味：\(proverb.meaning)",
                    subject: Text("ことわざ"),
                    message: Text(proverb.meaning)
                ) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }

    // MARK: - Subviews

    private var headerCard: some View {
        VStack(spacing: 14) {
            Text(proverb.text)
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)

            Text(proverb.reading)
                .font(.system(size: 14))
                .foregroundStyle(.white.opacity(0.85))
        }
        .padding(28)
        .background(
            LinearGradient(
                colors: [proverb.category.color, proverb.category.color.opacity(0.7)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: proverb.category.color.opacity(0.3), radius: 10, x: 0, y: 5)
    }

    private var categoryBadge: some View {
        HStack(spacing: 6) {
            Image(systemName: proverb.category.icon)
            Text(proverb.category.rawValue)
                .font(.subheadline.weight(.medium))
        }
        .foregroundStyle(proverb.category.color)
        .padding(.horizontal, 14)
        .padding(.vertical, 6)
        .background(proverb.category.color.opacity(0.12))
        .clipShape(Capsule())
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var meaningCard: some View {
        infoCard(title: "意味", icon: "text.quote", iconColor: .blue) {
            Text(proverb.meaning)
                .font(.body)
                .foregroundStyle(.primary)
                .lineSpacing(6)
        }
    }

    private var exampleCard: some View {
        infoCard(title: "例文", icon: "bubble.left.fill", iconColor: .green) {
            Text(proverb.example)
                .font(.body)
                .foregroundStyle(.primary)
                .lineSpacing(6)
                .italic()
        }
    }

    private func infoCard<Content: View>(title: String,
                                         icon: String,
                                         iconColor: Color,
                                         @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(iconColor)
            content()
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    NavigationStack {
        ProverbDetailView(proverb: allProverbs[0])
    }
}
