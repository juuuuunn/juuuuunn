import SwiftUI

struct AssessmentListView: View {
    var domain: StrokeDomain? = nil
    @State private var searchText = ""

    private var grouped: [(domain: StrokeDomain, items: [AssessmentType])] {
        let filtered = AssessmentType.allCases.filter { type in
            let domainMatch = domain == nil || type.domain == domain
            let searchMatch = searchText.isEmpty ||
                type.rawValue.localizedStandardContains(searchText) ||
                type.purpose.localizedStandardContains(searchText) ||
                type.domain.rawValue.localizedStandardContains(searchText)
            return domainMatch && searchMatch
        }

        if let domain {
            return [(domain: domain, items: filtered)]
        }

        return StrokeDomain.allCases.compactMap { d in
            let items = filtered.filter { $0.domain == d }
            return items.isEmpty ? nil : (domain: d, items: items)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(grouped, id: \.domain) { group in
                    Section {
                        ForEach(group.items) { type in
                            NavigationLink(destination: AssessmentDetailView(assessmentType: type)) {
                                AssessmentRow(type: type)
                            }
                            .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                        }
                    } header: {
                        DomainSectionHeader(domain: group.domain)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(domain?.rawValue ?? "評価ツール")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "評価ツール名・目的で検索")
        }
    }
}

private struct DomainSectionHeader: View {
    let domain: StrokeDomain
    var swiftColor: Color { colorFromName(domain.color.rawValue) }

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: domain.iconName)
                .foregroundColor(swiftColor)
            Text(domain.rawValue)
                .font(.subheadline.bold())
                .foregroundColor(swiftColor)
        }
    }
}

private struct AssessmentRow: View {
    let type: AssessmentType
    var swiftColor: Color { colorFromName(type.domain.color.rawValue) }

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(swiftColor.opacity(0.12))
                    .frame(width: 42, height: 42)
                Image(systemName: type.iconName)
                    .font(.body)
                    .foregroundColor(swiftColor)
            }

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(type.rawValue)
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)

                    if type.hasTimer {
                        Image(systemName: "stopwatch")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }

                Text(type.purpose)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                if let max = type.maxScore {
                    Text("最高 \(max)点")
                        .font(.caption2.bold())
                        .foregroundColor(swiftColor)
                }
            }
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    AssessmentListView()
}
