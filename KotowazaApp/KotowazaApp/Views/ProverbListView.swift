import SwiftUI

struct ProverbListView: View {

    @EnvironmentObject private var viewModel: ProverbViewModel
    @State private var searchText = ""
    @State private var selectedCategory: ProverbCategory? = nil

    private var filteredProverbs: [Proverb] {
        var source = allProverbs
        if let cat = selectedCategory {
            source = source.filter { $0.category == cat }
        }
        if !searchText.isEmpty {
            source = source.filter {
                $0.text.contains(searchText) ||
                $0.reading.contains(searchText) ||
                $0.meaning.contains(searchText)
            }
        }
        return source
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                categoryScrollView
                    .padding(.vertical, 10)
                    .background(Color(.systemGroupedBackground))

                List(filteredProverbs) { proverb in
                    NavigationLink(destination: ProverbDetailView(proverb: proverb)) {
                        ProverbRowView(proverb: proverb)
                    }
                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                }
                .listStyle(.insetGrouped)
                .searchable(text: $searchText, prompt: "ことわざを検索")
            }
            .navigationTitle("ことわざ一覧")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
        }
    }

    private var categoryScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                categoryChip(label: "すべて", category: nil)
                ForEach(ProverbCategory.allCases, id: \.self) { category in
                    categoryChip(label: category.rawValue, category: category)
                }
            }
            .padding(.horizontal, 16)
        }
    }

    private func categoryChip(label: String, category: ProverbCategory?) -> some View {
        let isSelected = selectedCategory == category
        let color: Color = category?.color ?? .gray

        return Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedCategory = category
            }
        } label: {
            HStack(spacing: 4) {
                if let icon = category?.icon {
                    Image(systemName: icon)
                        .font(.caption)
                }
                Text(label)
                    .font(.subheadline.weight(isSelected ? .semibold : .regular))
            }
            .foregroundStyle(isSelected ? .white : color)
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            .background(isSelected ? color : color.opacity(0.12))
            .clipShape(Capsule())
        }
    }
}

struct ProverbRowView: View {

    let proverb: Proverb

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(proverb.category.color.opacity(0.15))
                    .frame(width: 40, height: 40)
                Image(systemName: proverb.category.icon)
                    .font(.system(size: 18))
                    .foregroundStyle(proverb.category.color)
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(proverb.text)
                    .font(.body.weight(.medium))
                    .foregroundStyle(.primary)
                Text(proverb.reading)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ProverbListView()
        .environmentObject(ProverbViewModel())
}
