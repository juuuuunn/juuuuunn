import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HeaderBannerView()
                    DomainGridSection()
                    QuickTimerSection()
                }
                .padding(.bottom, 24)
            }
            .navigationTitle("脳卒中標準評価ツール")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Header

private struct HeaderBannerView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [.blue.opacity(0.85), .cyan.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            VStack(alignment: .leading, spacing: 6) {
                Text("脳卒中標準評価ツール")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Text("理学療法士のための臨床支援ツール")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                Text("脳卒中治療ガイドライン 2021（改訂2023）準拠 ｜ 全\(AssessmentType.allCases.count)評価ツール収録")
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

// MARK: - Domain Grid

private struct DomainGridSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "障害領域から評価を選ぶ", systemImage: "square.grid.3x3.fill")

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(StrokeDomain.allCases) { domain in
                    NavigationLink(destination: AssessmentListView(domain: domain)) {
                        DomainCard(domain: domain)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct DomainCard: View {
    let domain: StrokeDomain

    var swiftColor: Color { colorFromName(domain.color.rawValue) }

    var count: Int {
        AssessmentType.allCases.filter { $0.domain == domain }.count
    }

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: domain.iconName)
                .font(.title3)
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(swiftColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 2) {
                Text(domain.rawValue)
                    .font(.caption.bold())
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                Text("\(count)ツール")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(10)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.07), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Quick Timer Section

private struct QuickTimerSection: View {
    let timerTools: [AssessmentType] = [.tug, .tenMeterWalk, .sixMWT, .nhpt]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "タイマー計測ツール", systemImage: "stopwatch.fill")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(timerTools) { type in
                        NavigationLink(destination: AssessmentDetailView(assessmentType: type)) {
                            TimerToolCard(type: type)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

private struct TimerToolCard: View {
    let type: AssessmentType
    var swiftColor: Color { colorFromName(type.domain.color.rawValue) }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "stopwatch.fill")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(swiftColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(type.rawValue)
                .font(.subheadline.bold())
                .foregroundColor(.primary)

            Text(type.purpose)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .frame(width: 150)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.07), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Shared helpers

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

func colorFromName(_ name: String) -> Color {
    switch name {
    case "red":    return .red
    case "orange": return .orange
    case "pink":   return .pink
    case "green":  return .green
    case "indigo": return .indigo
    case "blue":   return .blue
    case "teal":   return .teal
    case "purple": return .purple
    case "yellow": return .yellow
    case "mint":   return .mint
    case "cyan":   return .cyan
    default:       return .blue
    }
}

#Preview {
    HomeView()
}
