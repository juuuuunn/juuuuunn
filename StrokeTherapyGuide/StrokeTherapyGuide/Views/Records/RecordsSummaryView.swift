import SwiftUI

// MARK: - Records Summary

struct RecordsSummaryView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var selectedDomain: StrokeDomain? = nil
    @State private var showClearConfirm = false

    private var filtered: [AssessmentRecord] {
        guard let d = selectedDomain else { return recordsStore.records }
        return recordsStore.records.filter { $0.assessmentType.domain == d }
    }

    private var grouped: [(dateKey: String, records: [AssessmentRecord])] {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "ja_JP")
        fmt.dateFormat = "yyyy年M月d日（E）"
        let dict = Dictionary(grouping: filtered) { fmt.string(from: $0.date) }
        return dict.sorted { $0.key > $1.key }.map { (dateKey: $0.key, records: $0.value) }
    }

    var body: some View {
        NavigationStack {
            Group {
                if recordsStore.records.isEmpty {
                    EmptyRecordsView()
                } else {
                    VStack(spacing: 0) {
                        DomainFilterBar(selected: $selectedDomain)
                        if filtered.isEmpty {
                            ContentUnavailableView("該当する記録がありません",
                                systemImage: "tray",
                                description: Text("フィルターを変更してください"))
                                .frame(maxHeight: .infinity)
                        } else {
                            RecordsList(grouped: grouped)
                        }
                    }
                }
            }
            .navigationTitle("評価記録")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if !recordsStore.records.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(role: .destructive) { showClearConfirm = true } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .confirmationDialog("全ての記録を削除しますか？", isPresented: $showClearConfirm, titleVisibility: .visible) {
                Button("全件削除", role: .destructive) { recordsStore.clearAll() }
                Button("キャンセル", role: .cancel) {}
            }
        }
    }
}

// MARK: - Domain Filter

private struct DomainFilterBar: View {
    @Binding var selected: StrokeDomain?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterChip(label: "すべて", color: .blue, isSelected: selected == nil) {
                    selected = nil
                }
                ForEach(StrokeDomain.allCases) { d in
                    FilterChip(label: d.rawValue,
                               color: colorFromName(d.color.rawValue),
                               isSelected: selected == d) {
                        selected = selected == d ? nil : d
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .background(Color(.systemBackground))
        .overlay(alignment: .bottom) { Divider() }
    }
}

private struct FilterChip: View {
    let label: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.caption.bold())
                .padding(.horizontal, 10).padding(.vertical, 6)
                .background(isSelected ? color : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}

// MARK: - Records List

private struct RecordsList: View {
    @EnvironmentObject var recordsStore: RecordsStore
    let grouped: [(dateKey: String, records: [AssessmentRecord])]

    var body: some View {
        List {
            ForEach(grouped, id: \.dateKey) { group in
                Section(group.dateKey) {
                    ForEach(group.records) { record in
                        RecordRow(record: record)
                    }
                    .onDelete { offsets in
                        recordsStore.delete(atOffsets: offsets, in: group.records)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

// MARK: - Record Row

private struct RecordRow: View {
    let record: AssessmentRecord
    private var color: Color { colorFromName(record.assessmentType.domain.color.rawValue) }

    private var timeText: String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "ja_JP")
        fmt.dateFormat = "HH:mm"
        return fmt.string(from: record.date)
    }

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.15))
                    .frame(width: 44, height: 44)
                Image(systemName: record.assessmentType.iconName)
                    .font(.body)
                    .foregroundColor(color)
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(record.assessmentType.rawValue)
                    .font(.subheadline.bold())
                    .foregroundColor(.primary)
                Text(record.displayLabel)
                    .font(.subheadline)
                    .foregroundColor(color)
                Text(record.assessmentType.domain.rawValue)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text(timeText)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Empty State

private struct EmptyRecordsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "clipboard")
                .font(.system(size: 64))
                .foregroundColor(.secondary.opacity(0.5))
            Text("まだ記録がありません")
                .font(.title3.bold())
                .foregroundColor(.secondary)
            Text("各評価ページで採点後、「記録を保存」\nボタンをタップすると記録されます。")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    RecordsSummaryView()
        .environmentObject(RecordsStore())
}
