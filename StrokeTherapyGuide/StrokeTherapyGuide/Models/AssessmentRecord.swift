import Foundation

// MARK: - AssessmentRecord

struct AssessmentRecord: Identifiable, Codable {
    var id: UUID = UUID()
    var assessmentType: AssessmentType
    var date: Date = Date()
    var primaryValue: Double          // score (int) or time (seconds)
    var secondaryValue: Double?       // optional second value (e.g. TMT Part B, non-dominant hand)
    var displayLabel: String          // human-readable summary shown in the records list
}

// MARK: - RecordsStore

class RecordsStore: ObservableObject {
    @Published var records: [AssessmentRecord] = []

    private let storageKey = "strokeGuideRecords_v1"

    init() { load() }

    func add(_ record: AssessmentRecord) {
        records.insert(record, at: 0)
        persist()
    }

    func deleteRecord(by id: UUID) {
        records.removeAll { $0.id == id }
        persist()
    }

    func delete(atOffsets offsets: IndexSet, in group: [AssessmentRecord]) {
        let ids = offsets.map { group[$0].id }
        ids.forEach { deleteRecord(by: $0) }
    }

    func clearAll() {
        records.removeAll()
        UserDefaults.standard.removeObject(forKey: storageKey)
    }

    private func persist() {
        guard let data = try? JSONEncoder().encode(records) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([AssessmentRecord].self, from: data)
        else { return }
        records = decoded
    }
}
