import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise

    var categoryColor: Color {
        switch exercise.category {
        case .rom: return .blue
        case .strengthening: return .red
        case .balance: return .purple
        case .gait: return .green
        case .upperLimb: return .orange
        case .adl: return .teal
        case .respiratory: return .cyan
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ExerciseHeaderCard(exercise: exercise, color: categoryColor)
                TargetMusclesSection(muscles: exercise.targetMuscles)
                ProcedureSection(steps: exercise.procedure)
                PrecautionSection(items: exercise.precautions)
                if let tip = exercise.tip {
                    TipSection(tip: tip)
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ExerciseHeaderCard: View {
    let exercise: Exercise
    let color: Color

    var difficultyColor: Color {
        switch exercise.difficulty {
        case .easy: return .green
        case .moderate: return .orange
        case .hard: return .red
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: exercise.category.iconName)
                    Text(exercise.category.rawValue)
                }
                .font(.subheadline.bold())
                .foregroundColor(color)

                Spacer()

                Label(exercise.difficulty.rawValue, systemImage: "chart.bar.fill")
                    .font(.caption.bold())
                    .foregroundColor(difficultyColor)
            }

            Text(exercise.purpose)
                .font(.body)
                .foregroundColor(.primary)

            HStack(spacing: 0) {
                InfoPill(icon: "repeat", label: "セット数", value: exercise.sets)
                Divider().frame(height: 32)
                InfoPill(icon: "number.circle.fill", label: "回数", value: exercise.repetitions)
            }
            .background(color.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 10))

            HStack(spacing: 6) {
                Text("適応病期:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                ForEach(exercise.phase) { phase in
                    PhaseBadge(phase: phase)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 6, x: 0, y: 2)
        .padding(.horizontal)
    }
}

private struct InfoPill: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing: 1) {
                Text(label)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.caption.bold())
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
    }
}

private struct TargetMusclesSection: View {
    let muscles: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("対象筋肉", systemImage: "figure.strengthtraining.traditional")
                .font(.headline)
                .padding(.horizontal)

            FlowLayout(items: muscles) { muscle in
                Text(muscle)
                    .font(.subheadline)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
        }
    }
}

private struct ProcedureSection: View {
    let steps: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("実施手順", systemImage: "list.number")
                .font(.headline)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .frame(width: 22, height: 22)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding(.top, 1)

                        Text(step)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
}

private struct PrecautionSection: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("注意事項", systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundColor(.orange)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.orange)
                            .font(.caption)
                            .padding(.top, 2)
                        Text(item)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
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

private struct TipSection: View {
    let tip: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("臨床のポイント", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundColor(.yellow)
                .padding(.horizontal)

            HStack(alignment: .top, spacing: 10) {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .padding(.top, 1)
                Text(tip)
                    .font(.subheadline)
            }
            .padding()
            .background(Color.yellow.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
}

struct FlowLayout<Item: Hashable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content

    @State private var totalHeight = CGFloat.zero

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \.self) { item in
                content(item)
                    .padding(.trailing, 4)
                    .padding(.bottom, 4)
                    .alignmentGuide(.leading) { d in
                        if abs(width - d.width) > geometry.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == items.last {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == items.last {
                            height = 0
                        }
                        return result
                    }
            }
        }
        .background(
            GeometryReader { geo in
                Color.clear.onAppear {
                    totalHeight = geo.size.height
                }
            }
        )
    }
}

#Preview {
    NavigationStack {
        ExerciseDetailView(exercise: Exercise.sampleData[0])
    }
}
