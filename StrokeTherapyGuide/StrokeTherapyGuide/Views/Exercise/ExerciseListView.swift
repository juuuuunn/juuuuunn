import SwiftUI

struct ExerciseListView: View {
    @State private var selectedCategory: ExerciseCategory?
    @State private var selectedPhase: TherapyPhase?
    @State private var searchText = ""

    private var filtered: [Exercise] {
        Exercise.sampleData.filter { exercise in
            let categoryMatch = selectedCategory == nil || exercise.category == selectedCategory
            let phaseMatch = selectedPhase == nil || exercise.phase.contains(selectedPhase!)
            let searchMatch = searchText.isEmpty ||
                exercise.name.localizedStandardContains(searchText) ||
                exercise.category.rawValue.localizedStandardContains(searchText)
            return categoryMatch && phaseMatch && searchMatch
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CategoryFilterBar(selected: $selectedCategory)
                    .padding(.vertical, 8)

                PhaseSegmentControl(selected: $selectedPhase)
                    .padding(.horizontal)
                    .padding(.bottom, 8)

                List(filtered) { exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                        ExerciseRow(exercise: exercise)
                    }
                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                }
                .listStyle(.plain)
            }
            .navigationTitle("運動メニュー")
            .searchable(text: $searchText, prompt: "運動名・カテゴリで検索")
        }
    }
}

private struct CategoryFilterBar: View {
    @Binding var selected: ExerciseCategory?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                CategoryChip(label: "すべて", icon: "square.grid.2x2.fill", isSelected: selected == nil) {
                    selected = nil
                }
                ForEach(ExerciseCategory.allCases) { category in
                    CategoryChip(
                        label: category.rawValue,
                        icon: category.iconName,
                        isSelected: selected == category
                    ) {
                        selected = selected == category ? nil : category
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct CategoryChip: View {
    let label: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.caption)
                Text(label)
                    .font(.caption.bold())
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(isSelected ? Color.blue : Color(.systemGray5))
            .foregroundColor(isSelected ? .white : .primary)
            .clipShape(Capsule())
        }
    }
}

private struct PhaseSegmentControl: View {
    @Binding var selected: TherapyPhase?

    var body: some View {
        HStack(spacing: 0) {
            PhaseSegment(label: "全期", isSelected: selected == nil) {
                selected = nil
            }
            ForEach(TherapyPhase.allCases) { phase in
                PhaseSegment(label: phase.rawValue, isSelected: selected == phase) {
                    selected = selected == phase ? nil : phase
                }
            }
        }
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

private struct PhaseSegment: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.caption.bold())
                .padding(.vertical, 7)
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.white : Color.clear)
                .foregroundColor(isSelected ? .primary : .secondary)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .padding(2)
        }
    }
}

private struct ExerciseRow: View {
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

    var difficultyColor: Color {
        switch exercise.difficulty {
        case .easy: return .green
        case .moderate: return .orange
        case .hard: return .red
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: exercise.category.iconName)
                        .font(.caption)
                    Text(exercise.category.rawValue)
                        .font(.caption)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(categoryColor.opacity(0.12))
                .foregroundColor(categoryColor)
                .clipShape(Capsule())

                Spacer()

                Text(exercise.difficulty.rawValue)
                    .font(.caption2.bold())
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(difficultyColor.opacity(0.12))
                    .foregroundColor(difficultyColor)
                    .clipShape(Capsule())
            }

            Text(exercise.name)
                .font(.headline)

            Text(exercise.purpose)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            HStack(spacing: 12) {
                Label(exercise.sets, systemImage: "repeat")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Label(exercise.repetitions, systemImage: "number.circle")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ExerciseListView()
}
