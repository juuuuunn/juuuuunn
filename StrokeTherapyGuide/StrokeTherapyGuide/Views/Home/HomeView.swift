import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HeaderBannerView()
                    PhaseQuickAccessSection()
                    QuickToolsSection()
                    GuidelineReferenceSection()
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("脳卒中理学療法ガイド")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

private struct HeaderBannerView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [Color.blue.opacity(0.8), Color.cyan.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            VStack(alignment: .leading, spacing: 6) {
                Text("脳卒中標準理学療法")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Text("理学療法士のための臨床支援ツール")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                Text("脳卒中治療ガイドライン 2021（改訂2023）準拠")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

private struct PhaseQuickAccessSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "病期別プロトコル", systemImage: "calendar.badge.clock")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(TherapyPhase.allCases) { phase in
                        NavigationLink(destination: ProtocolListView(filter: phase)) {
                            PhaseCard(phase: phase)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

private struct PhaseCard: View {
    let phase: TherapyPhase

    var color: Color {
        switch phase {
        case .acute: return .red
        case .subacute: return .orange
        case .chronic: return .green
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: phase.iconName)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(color.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(phase.rawValue)
                .font(.headline)
                .foregroundColor(.primary)

            Text(phase.durationDescription)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .frame(width: 130)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 2)
    }
}

private struct QuickToolsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "評価ツール（クイックアクセス）", systemImage: "checkmark.seal.fill")

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach([AssessmentType.nihss, .bergBalance, .fuglMeyerUpper, .tug], id: \.self) { type in
                    NavigationLink(destination: AssessmentDetailView(assessmentType: type)) {
                        AssessmentQuickCard(type: type)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct AssessmentQuickCard: View {
    let type: AssessmentType

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.iconName)
                .font(.title3)
                .foregroundColor(.blue)
                .frame(width: 36, height: 36)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(type.abbreviation)
                    .font(.subheadline.bold())
                    .foregroundColor(.primary)
                    .lineLimit(1)
                if type.maxScore > 0 {
                    Text("最大 \(type.maxScore)点")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
        .padding(10)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

private struct GuidelineReferenceSection: View {
    let guidelines = [
        GuidelineItem(title: "脳卒中治療ガイドライン 2021（改訂2023）", publisher: "日本脳卒中学会", color: .blue),
        GuidelineItem(title: "脳卒中理学療法診療ガイドライン", publisher: "日本理学療法士協会", color: .purple),
        GuidelineItem(title: "AHA/ASA 脳卒中リハビリテーションガイドライン", publisher: "American Heart Association", color: .red)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "参照ガイドライン", systemImage: "book.fill")

            VStack(spacing: 8) {
                ForEach(guidelines) { item in
                    GuidelineRow(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct GuidelineItem: Identifiable {
    let id = UUID()
    let title: String
    let publisher: String
    let color: Color
}

private struct GuidelineRow: View {
    let item: GuidelineItem

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 3)
                .fill(item.color)
                .frame(width: 4, height: 44)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.subheadline.bold())
                    .foregroundColor(.primary)
                Text(item.publisher)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

struct SectionHeader: View {
    let title: String
    let systemImage: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: systemImage)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
