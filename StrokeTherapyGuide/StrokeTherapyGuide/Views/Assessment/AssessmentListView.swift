import SwiftUI

struct AssessmentListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("神経学的評価") {
                    AssessmentRow(type: .nihss)
                }

                Section("運動機能評価") {
                    AssessmentRow(type: .fuglMeyerUpper)
                    AssessmentRow(type: .fuglMeyerLower)
                }

                Section("バランス・移動評価") {
                    AssessmentRow(type: .bergBalance)
                    AssessmentRow(type: .tug)
                    AssessmentRow(type: .tenMeterWalk)
                }

                Section("ADL評価") {
                    AssessmentRow(type: .fim)
                }
            }
            .navigationTitle("評価ツール")
        }
    }
}

private struct AssessmentRow: View {
    let type: AssessmentType

    var body: some View {
        NavigationLink(destination: AssessmentDetailView(assessmentType: type)) {
            HStack(spacing: 14) {
                Image(systemName: type.iconName)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 3) {
                    Text(type.abbreviation)
                        .font(.headline)

                    Text(type.purpose)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)

                    if type.maxScore > 0 {
                        Text("最高得点: \(type.maxScore)点")
                            .font(.caption2.bold())
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    AssessmentListView()
}
