import SwiftUI

struct ProtocolDetailView: View {
    let protocol_: TherapyProtocol
    @State private var expandedIntervention: UUID?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeaderSection(protocol_: protocol_)
                PrecautionSection(precautions: protocol_.precautions)
                InterventionsSection(
                    interventions: protocol_.interventions,
                    expanded: $expandedIntervention
                )
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(protocol_.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct HeaderSection: View {
    let protocol_: TherapyProtocol

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                PhaseBadge(phase: protocol_.phase)
                EvidenceBadge(level: protocol_.evidenceLevel)
                Spacer()
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 6) {
                Label("目標", systemImage: "target")
                    .font(.subheadline.bold())
                    .foregroundColor(.blue)
                Text(protocol_.goal)
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
        }
    }
}

private struct PrecautionSection: View {
    let precautions: [String]
    @State private var isExpanded = true

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: { withAnimation { isExpanded.toggle() } }) {
                HStack {
                    Label("注意事項・禁忌", systemImage: "exclamationmark.triangle.fill")
                        .font(.headline)
                        .foregroundColor(.orange)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
            }
            .padding(.horizontal)

            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(precautions, id: \.self) { precaution in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundColor(.orange)
                                .font(.caption)
                                .padding(.top, 2)
                            Text(precaution)
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
                .background(Color.orange.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
            }
        }
    }
}

private struct InterventionsSection: View {
    let interventions: [Intervention]
    @Binding var expanded: UUID?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("介入内容", systemImage: "list.bullet.clipboard.fill")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.horizontal)

            VStack(spacing: 10) {
                ForEach(Array(interventions.enumerated()), id: \.element.id) { index, intervention in
                    InterventionCard(
                        intervention: intervention,
                        index: index + 1,
                        isExpanded: expanded == intervention.id,
                        onTap: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                expanded = expanded == intervention.id ? nil : intervention.id
                            }
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct InterventionCard: View {
    let intervention: Intervention
    let index: Int
    let isExpanded: Bool
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: onTap) {
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index)")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {
                        Text(intervention.name)
                            .font(.subheadline.bold())
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)

                        HStack(spacing: 12) {
                            Label(intervention.frequency, systemImage: "clock")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Label(intervention.duration, systemImage: "timer")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(14)
            }

            if isExpanded {
                Divider()
                    .padding(.horizontal)

                Text(intervention.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(14)
            }
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    NavigationStack {
        ProtocolDetailView(protocol_: TherapyProtocol.sampleData[0])
    }
}
