import SwiftUI

struct ProtocolListView: View {
    var filter: TherapyPhase? = nil
    @State private var selectedPhase: TherapyPhase?

    private var protocols: [TherapyProtocol] {
        let all = TherapyProtocol.sampleData
        let phase = selectedPhase ?? filter
        guard let phase else { return all }
        return all.filter { $0.phase == phase }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if filter == nil {
                    PhaseFilterBar(selected: $selectedPhase)
                        .padding(.vertical, 8)
                }

                List(protocols) { protocol_ in
                    NavigationLink(destination: ProtocolDetailView(protocol_: protocol_)) {
                        ProtocolRow(protocol_: protocol_)
                    }
                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                }
                .listStyle(.plain)
            }
            .navigationTitle("治療プロトコル")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct PhaseFilterBar: View {
    @Binding var selected: TherapyPhase?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterChip(label: "すべて", isSelected: selected == nil) {
                    selected = nil
                }
                ForEach(TherapyPhase.allCases) { phase in
                    FilterChip(label: phase.rawValue, isSelected: selected == phase) {
                        selected = selected == phase ? nil : phase
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct FilterChip: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.subheadline)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(isSelected ? Color.blue : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}

private struct ProtocolRow: View {
    let protocol_: TherapyProtocol

    var phaseColor: Color {
        switch protocol_.phase {
        case .acute: return .red
        case .subacute: return .orange
        case .chronic: return .green
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                PhaseBadge(phase: protocol_.phase)
                Spacer()
                EvidenceBadge(level: protocol_.evidenceLevel)
            }

            Text(protocol_.title)
                .font(.headline)
                .foregroundColor(.primary)

            Text(protocol_.goal)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            HStack(spacing: 4) {
                Image(systemName: "list.bullet.clipboard")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(protocol_.interventions.count)つの介入")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct PhaseBadge: View {
    let phase: TherapyPhase

    var color: Color {
        switch phase {
        case .acute: return .red
        case .subacute: return .orange
        case .chronic: return .green
        }
    }

    var body: some View {
        Text(phase.rawValue)
            .font(.caption.bold())
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(color.opacity(0.15))
            .foregroundColor(color)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(color.opacity(0.3), lineWidth: 1))
    }
}

struct EvidenceBadge: View {
    let level: EvidenceLevel

    var color: Color {
        switch level {
        case .levelA: return .blue
        case .levelB: return .green
        case .levelC: return .orange
        case .levelD: return .gray
        }
    }

    var body: some View {
        Text(level.rawValue)
            .font(.caption2.bold())
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(color.opacity(0.12))
            .foregroundColor(color)
            .clipShape(Capsule())
    }
}

#Preview {
    ProtocolListView()
}
