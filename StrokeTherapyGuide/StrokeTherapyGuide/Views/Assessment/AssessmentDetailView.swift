import SwiftUI

// MARK: - Router

struct AssessmentDetailView: View {
    let assessmentType: AssessmentType

    var body: some View {
        switch assessmentType {
        case .tug:          TimerAssessmentView(assessmentType: .tug)
        case .tenMeterWalk: TimerAssessmentView(assessmentType: .tenMeterWalk)
        case .sixMWT:       TimerAssessmentView(assessmentType: .sixMWT)
        case .nhpt:         TimerAssessmentView(assessmentType: .nhpt)
        case .bbt:          BBTView()
        case .brunnstrom:   BrunnstromView()
        case .vasNrs:       VASNRSView()
        case .moca:         MoCAInfoView()
        case .sis:          SISInfoView()
        case .mas:          MASView()
        case .mrs:          MRSView()
        case .tct:          TCTView()
        case .bit:          BITView()
        case .tmt:          TMTView()
        case .cat:          CATInfoView()
        case .digitalCancellation: DigitalCancellationView()
        case .stef:         STEFView()
        case .mal:          MALView()
        default:            ScoreAssessmentView(assessmentType: assessmentType)
        }
    }
}

// MARK: - Generic Score Assessment

struct ScoreAssessmentView: View {
    let assessmentType: AssessmentType
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var scores: [UUID: Int] = [:]

    private var items: [AssessmentItem] { assessmentType.items }
    private var totalScore: Int { scores.values.reduce(0, +) }

    var swiftColor: Color { colorFromName(assessmentType.domain.color.rawValue) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AssessmentSummaryCard(type: assessmentType, total: totalScore, color: swiftColor)
                InterpretationCard(type: assessmentType, score: totalScore, color: swiftColor)
                ClinicalBenchmarkCard(type: assessmentType)

                VStack(spacing: 10) {
                    ForEach(items) { item in
                        AssessmentItemCard(
                            item: item,
                            selectedScore: scores[item.id],
                            color: swiftColor,
                            onSelect: { score in
                                scores[item.id] = scores[item.id] == score ? nil : score
                            }
                        )
                    }
                }
                .padding(.horizontal)

                SaveRecordButton(color: swiftColor, isEnabled: !scores.isEmpty) {
                    recordsStore.add(AssessmentRecord(
                        assessmentType: assessmentType,
                        primaryValue: Double(totalScore),
                        displayLabel: "合計: \(totalScore)点"
                    ))
                }
                ResetButton(color: swiftColor) { scores = [:] }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(assessmentType.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct AssessmentSummaryCard: View {
    let type: AssessmentType
    let total: Int
    let color: Color

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(type.purpose)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if let max = type.maxScore {
                    Text("採点範囲: 0〜\(max)点")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(total)")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                Text("合計点")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.07), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct InterpretationCard: View {
    let type: AssessmentType
    let score: Int
    let color: Color

    private var match: (range: ClosedRange<Int>, label: String, description: String)? {
        type.interpretation.first { $0.range.contains(score) }
    }

    var body: some View {
        if let m = match {
            HStack(spacing: 12) {
                Image(systemName: "chart.bar.xaxis")
                    .foregroundColor(color)
                VStack(alignment: .leading, spacing: 2) {
                    Text(m.label)
                        .font(.headline)
                    Text(m.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("スコア \(m.range.lowerBound)〜\(m.range.upperBound)点の範囲")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(color.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
}

struct AssessmentItemCard: View {
    let item: AssessmentItem
    let selectedScore: Int?
    let color: Color
    let onSelect: (Int) -> Void
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: { withAnimation(.easeInOut(duration: 0.2)) { isExpanded.toggle() } }) {
                HStack(alignment: .top, spacing: 10) {
                    Text("\(item.number)")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .frame(width: 22, height: 22)
                        .background(selectedScore != nil ? color : Color.gray)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 3) {
                        Text(item.name)
                            .font(.subheadline.bold())
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        if !item.description.isEmpty {
                            Text(item.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                    Spacer()

                    if let score = selectedScore {
                        Text("\(score)点")
                            .font(.headline.bold())
                            .foregroundColor(color)
                    }

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(12)
            }

            if isExpanded {
                Divider().padding(.horizontal, 12)
                VStack(spacing: 6) {
                    ForEach(item.scoringCriteria) { criterion in
                        ScoringButton(
                            criterion: criterion,
                            isSelected: selectedScore == criterion.score,
                            color: color,
                            onTap: { onSelect(criterion.score) }
                        )
                    }
                }
                .padding(12)
            }
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
    }
}

struct ScoringButton: View {
    let criterion: ScoringCriterion
    let isSelected: Bool
    let color: Color
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 10) {
                Text("\(criterion.score)")
                    .font(.subheadline.bold())
                    .foregroundColor(isSelected ? .white : color)
                    .frame(width: 30, height: 30)
                    .background(isSelected ? color : color.opacity(0.1))
                    .clipShape(Circle())

                Text(criterion.description)
                    .font(.subheadline)
                    .foregroundColor(isSelected ? .primary : .secondary)
                    .multilineTextAlignment(.leading)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(color)
                }
            }
            .padding(10)
            .background(isSelected ? color.opacity(0.07) : Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct ResetButton: View {
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(role: .destructive, action: action) {
            Label("スコアをリセット", systemImage: "arrow.counterclockwise")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
        .padding(.horizontal)
    }
}

// MARK: - Save Record Button

struct SaveRecordButton: View {
    let color: Color
    let isEnabled: Bool
    let onSave: () -> Void
    @State private var saved = false

    var body: some View {
        Button(action: {
            guard isEnabled && !saved else { return }
            onSave()
            saved = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { saved = false }
        }) {
            Label(saved ? "保存しました" : "記録を保存",
                  systemImage: saved ? "checkmark.circle.fill" : "square.and.arrow.down")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(saved ? .green : color)
        .disabled(!isEnabled || saved)
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.3), value: saved)
    }
}

// MARK: - MAS View (per muscle group)

struct MASView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var scores: [UUID: Int] = [:]

    private let items = AssessmentType.mas.items
    private var totalScore: Int { scores.values.reduce(0, +) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                MASInfoCard()

                VStack(alignment: .leading, spacing: 10) {
                    Text("筋肉別評価")
                        .font(.headline)
                        .padding(.horizontal)

                    ForEach(items) { item in
                        AssessmentItemCard(
                            item: item,
                            selectedScore: scores[item.id],
                            color: .pink,
                            onSelect: { score in
                                scores[item.id] = scores[item.id] == score ? nil : score
                            }
                        )
                    }
                    .padding(.horizontal)
                }

                SaveRecordButton(color: .pink, isEnabled: !scores.isEmpty) {
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .mas,
                        primaryValue: Double(totalScore),
                        displayLabel: "合計: \(totalScore)点"
                    ))
                }
                ResetButton(color: .pink) { scores = [:] }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("Modified Ashworth Scale")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct MASInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("採点基準", systemImage: "info.circle.fill")
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 0) {
                ForEach([
                    (label: "0",   desc: "筋緊張の亢進なし"),
                    (label: "1",   desc: "軽度：可動域末端で引っかかり感"),
                    (label: "1+",  desc: "軽度：引っかかりの後に軽微な抵抗"),
                    (label: "2",   desc: "全可動域で抵抗あるが可動域制限なし"),
                    (label: "3",   desc: "可動域制限を伴う著明な筋緊張亢進"),
                    (label: "4",   desc: "強直（屈曲または伸展位で固定）")
                ], id: \.label) { item in
                    HStack(spacing: 12) {
                        Text(item.label)
                            .font(.headline.bold())
                            .frame(width: 28)
                            .foregroundColor(.pink)
                        Text(item.desc)
                            .font(.subheadline)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    Divider().padding(.leading, 54)
                }
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
        }
    }
}

// MARK: - Brunnstrom Stage View

struct BrunnstromView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var armStage: Int = 0
    @State private var handStage: Int = 0
    @State private var legStage: Int = 0

    private let stages: [(Int, String)] = [
        (0, "未評価"),
        (1, "Stage I — 弛緩性麻痺、随意運動なし"),
        (2, "Stage II — 連合反応出現、最小限の随意運動"),
        (3, "Stage III — 随意的な共同運動が出現"),
        (4, "Stage IV — 共同運動パターンから逸脱した運動が一部可能"),
        (5, "Stage V — 共同運動パターンに依存しない独立した運動が増加"),
        (6, "Stage VI — ほぼ正常。協調運動は正常または近正常")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                BrunnstromInfoCard()
                BrunnstromSelector(label: "上肢", selection: $armStage, stages: stages)
                BrunnstromSelector(label: "手", selection: $handStage, stages: stages)
                BrunnstromSelector(label: "下肢", selection: $legStage, stages: stages)
                BrunnstromResultCard(arm: armStage, hand: handStage, leg: legStage)
                SaveRecordButton(color: .orange, isEnabled: armStage > 0 || handStage > 0 || legStage > 0) {
                    let a = armStage > 0 ? "S\(armStage)" : "—"
                    let h = handStage > 0 ? "S\(handStage)" : "—"
                    let l = legStage > 0 ? "S\(legStage)" : "—"
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .brunnstrom,
                        primaryValue: Double(armStage * 100 + handStage * 10 + legStage),
                        displayLabel: "上肢:\(a) 手:\(h) 下肢:\(l)"
                    ))
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("Brunnstrom Stage")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct BrunnstromInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("評価の目的", systemImage: "info.circle.fill")
                .font(.headline)

            Text("脳卒中後の上肢・手・下肢それぞれの運動回復ステージを評価します。共同運動パターンから正常運動への回復過程を Stage I〜VI で分類します。")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.orange.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct BrunnstromSelector: View {
    let label: String
    @Binding var selection: Int
    let stages: [(Int, String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(label)
                    .font(.headline)
                Spacer()
                if selection > 0 {
                    Text("Stage \(selection)")
                        .font(.headline.bold())
                        .foregroundColor(.orange)
                }
            }
            .padding(.horizontal)

            VStack(spacing: 6) {
                ForEach(stages, id: \.0) { stage in
                    Button(action: { selection = stage.0 }) {
                        HStack(spacing: 12) {
                            Text(stage.0 == 0 ? "—" : "\(stage.0)")
                                .font(.headline.bold())
                                .foregroundColor(selection == stage.0 ? .white : .orange)
                                .frame(width: 28, height: 28)
                                .background(selection == stage.0 ? Color.orange : Color.orange.opacity(0.1))
                                .clipShape(Circle())

                            Text(stage.1)
                                .font(.subheadline)
                                .foregroundColor(selection == stage.0 ? .primary : .secondary)
                                .multilineTextAlignment(.leading)

                            Spacer()

                            if selection == stage.0 {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.orange)
                            }
                        }
                        .padding(10)
                        .background(selection == stage.0 ? Color.orange.opacity(0.08) : Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct BrunnstromResultCard: View {
    let arm: Int
    let hand: Int
    let leg: Int

    var body: some View {
        if arm > 0 || hand > 0 || leg > 0 {
            VStack(spacing: 10) {
                Text("評価結果")
                    .font(.headline)

                HStack(spacing: 0) {
                    ResultPill(label: "上肢", value: arm > 0 ? "Stage \(arm)" : "—")
                    Divider().frame(height: 36)
                    ResultPill(label: "手", value: hand > 0 ? "Stage \(hand)" : "—")
                    Divider().frame(height: 36)
                    ResultPill(label: "下肢", value: leg > 0 ? "Stage \(leg)" : "—")
                }
                .background(Color.orange.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .shadow(color: .black.opacity(0.07), radius: 5, x: 0, y: 2)
            .padding(.horizontal)
        }
    }
}

private struct ResultPill: View {
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 3) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline.bold())
                .foregroundColor(.orange)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
    }
}

// MARK: - Timer Assessment (TUG / 10m / 6MWT / NHPT)

struct TimerAssessmentView: View {
    let assessmentType: AssessmentType
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var elapsed: Double = 0
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var results: [Double] = []

    var swiftColor: Color { colorFromName(assessmentType.domain.color.rawValue) }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ClinicalBenchmarkCard(type: assessmentType)
                TimerDisplayCard(elapsed: elapsed, isRunning: isRunning, color: swiftColor)
                DerivedValueCard(type: assessmentType, elapsed: elapsed, color: swiftColor)
                TimerControlRow(
                    isRunning: isRunning,
                    elapsed: elapsed,
                    onStartStop: startStop,
                    onReset: reset,
                    onSave: {
                        if elapsed > 0 {
                            results.append(elapsed)
                            var label = String(format: "%.2f秒", elapsed)
                            if assessmentType == .tenMeterWalk { label += String(format: " (%.3fm/s)", 10.0 / elapsed) }
                            recordsStore.add(AssessmentRecord(
                                assessmentType: assessmentType,
                                primaryValue: elapsed,
                                displayLabel: label
                            ))
                            elapsed = 0
                        }
                    }
                )
                InterpretationBanner(type: assessmentType, elapsed: elapsed, color: swiftColor)
                if !results.isEmpty { SavedResultsCard(results: results, color: swiftColor) }
                ProtocolCard(type: assessmentType)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(assessmentType.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { timer?.invalidate() }
    }

    private func startStop() {
        if isRunning {
            timer?.invalidate(); timer = nil; isRunning = false
        } else {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in elapsed += 0.01 }
        }
    }

    private func reset() {
        timer?.invalidate(); timer = nil; isRunning = false; elapsed = 0
    }
}

private struct TimerDisplayCard: View {
    let elapsed: Double
    let isRunning: Bool
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(String(format: "%06.2f", elapsed))
                .font(.system(size: 60, weight: .thin, design: .monospaced))
                .foregroundColor(isRunning ? color : .primary)
            Text("秒")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(28)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 6, x: 0, y: 2)
        .padding(.horizontal)
    }
}

private struct DerivedValueCard: View {
    let type: AssessmentType
    let elapsed: Double
    let color: Color

    var body: some View {
        switch type {
        case .tenMeterWalk:
            let speed = elapsed > 0 ? 10.0 / elapsed : 0
            derivedRow(label: "歩行速度", value: String(format: "%.3f m/s", speed), color: color)
        case .sixMWT:
            let dist = elapsed > 0 ? (elapsed / 360.0) * 1.2 * 60 : 0
            derivedRow(label: "推定歩行距離（参考）", value: String(format: "%.0f m", dist), color: color)
        default:
            EmptyView()
        }
    }

    private func derivedRow(label: String, value: String, color: Color) -> some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.title2.bold())
                .foregroundColor(color)
        }
        .padding()
        .background(color.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct TimerControlRow: View {
    let isRunning: Bool
    let elapsed: Double
    let onStartStop: () -> Void
    let onReset: () -> Void
    let onSave: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 16) {
                Button(action: onStartStop) {
                    Label(isRunning ? "ストップ" : "スタート",
                          systemImage: isRunning ? "stop.fill" : "play.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Button(action: onReset) {
                    Label("リセット", systemImage: "arrow.counterclockwise")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray4))
                        .foregroundColor(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }

            if !isRunning && elapsed > 0 {
                Button(action: onSave) {
                    Label("記録を保存", systemImage: "square.and.arrow.down.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.horizontal)
    }
}

private struct InterpretationBanner: View {
    let type: AssessmentType
    let elapsed: Double
    let color: Color

    private var info: (label: String, detail: String, color: Color)? {
        switch type {
        case .tug:
            if elapsed < 0.1 { return nil }
            switch elapsed {
            case 0..<10: return ("正常〜低リスク", "転倒リスク低（地域在住高齢者）", .green)
            case 10..<12: return ("軽度注意", "軽度の転倒リスク", .yellow)
            case 12..<20: return ("要注意", "中等度の転倒リスク", .orange)
            default:     return ("高リスク", "高い転倒リスク・ADL介助が必要なことが多い", .red)
            }
        case .tenMeterWalk:
            let speed = elapsed > 0 ? 10.0 / elapsed : 0
            if speed < 0.001 { return nil }
            switch speed {
            case 0..<0.4:  return ("重度障害", "屋内歩行のみ・介助が必要", .red)
            case 0.4..<0.6: return ("中等度障害", "限定的な地域歩行", .orange)
            case 0.6..<0.8: return ("軽度障害", "監視下での地域歩行", .yellow)
            case 0.8..<1.0: return ("ほぼ自立", "独立した地域歩行が可能", .green)
            default:        return ("正常範囲", "完全な地域歩行・社会復帰レベル", .blue)
            }
        default:
            return nil
        }
    }

    var body: some View {
        if let i = info {
            HStack(spacing: 12) {
                Circle().fill(i.color).frame(width: 12, height: 12)
                VStack(alignment: .leading, spacing: 2) {
                    Text(i.label).font(.headline).foregroundColor(i.color)
                    Text(i.detail).font(.caption).foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(i.color.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
}

private struct SavedResultsCard: View {
    let results: [Double]
    let color: Color

    private var average: Double { results.reduce(0, +) / Double(results.count) }
    private var best: Double { results.min() ?? 0 }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("計測履歴").font(.headline).padding(.horizontal)

            VStack(spacing: 6) {
                ForEach(Array(results.enumerated()), id: \.offset) { i, t in
                    HStack {
                        Text("試行 \(i + 1)").font(.subheadline)
                        Spacer()
                        Text(String(format: "%.2f秒", t)).font(.subheadline.bold()).foregroundColor(color)
                    }
                    .padding(.horizontal, 14).padding(.vertical, 8)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                if results.count > 1 {
                    Divider()
                    HStack {
                        Text("平均").font(.subheadline)
                        Spacer()
                        Text(String(format: "%.2f秒", average)).font(.subheadline.bold()).foregroundColor(.green)
                    }
                    .padding(.horizontal, 14)
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct ProtocolCard: View {
    let type: AssessmentType

    private var steps: [String] {
        switch type {
        case .tug:
            return [
                "背もたれ付き椅子（座面高46cm）に深く腰掛ける",
                "「行ってください」の合図で立ち上がり、3m先の目印まで歩く",
                "折り返して椅子まで戻り、再び深く腰掛ける",
                "普段使用している補助具（杖等）の使用を許可する",
                "通常歩行速度で実施（最大速度は不要）",
                "練習1回の後、本番を2〜3回計測し平均値を使用"
            ]
        case .tenMeterWalk:
            return [
                "14m のコースを準備（加速2m＋計測10m＋減速2m）",
                "計測区間（2m地点）でタイマースタート",
                "計測終了地点（12m地点）でタイマーストップ",
                "通常歩行速度・最大歩行速度の両方を計測",
                "2〜3回計測し平均値を算出",
                "MCID（最小臨床的重要変化量）: 0.16 m/s"
            ]
        case .sixMWT:
            return [
                "30m の平坦な廊下を準備（折り返しコース可）",
                "「できるだけ速く・長く歩いてください」と説明",
                "歩行中は標準的な励ましのみ行う",
                "6分後に停止、歩行距離（m）を記録",
                "RPE（ボルグスケール）と SpO2 も計測する",
                "MCID: 約54m（脳卒中患者の場合）"
            ]
        case .nhpt:
            return [
                "ペグボードを固定し、9本のペグを側方の容器に準備",
                "「できるだけ速く9本全てのペグを穴に差し込んでください」",
                "全て差し込んだら、今度は全て取り出す",
                "ペグを落とした場合は拾って続ける",
                "利き手・非利き手の両方を計測（秒）",
                "2〜3回実施し最良値を記録"
            ]
        default:
            return []
        }
    }

    var body: some View {
        if !steps.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                Label("実施プロトコル", systemImage: "list.number").font(.headline).padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(steps.enumerated()), id: \.offset) { i, step in
                        HStack(alignment: .top, spacing: 10) {
                            Text("\(i+1)")
                                .font(.caption.bold()).foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .background(Color.blue).clipShape(Circle())
                                .padding(.top, 1)
                            Text(step).font(.subheadline)
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
}

// MARK: - BBT View

struct BBTView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var dominantCount: Int = 0
    @State private var nonDominantCount: Int = 0
    @State private var isRunning = false
    @State private var elapsed: Double = 0
    @State private var timer: Timer?
    @State private var activeHand: HandSide = .dominant

    enum HandSide { case dominant, nonDominant }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                BBTInfoCard()
                BBTTimerCard(elapsed: elapsed, isRunning: isRunning, activeHand: activeHand)
                BBTControlRow(
                    isRunning: isRunning,
                    onStart: { isRunning = true; timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in elapsed += 0.01 } },
                    onStop: { timer?.invalidate(); timer = nil; isRunning = false; elapsed = 0 }
                )
                BBTCounterRow(
                    dominantCount: $dominantCount,
                    nonDominantCount: $nonDominantCount
                )
                BBTInterpretationCard(dominant: dominantCount, nonDominant: nonDominantCount)
                SaveRecordButton(color: .blue, isEnabled: dominantCount > 0 || nonDominantCount > 0) {
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .bbt,
                        primaryValue: Double(dominantCount),
                        secondaryValue: Double(nonDominantCount),
                        displayLabel: "利き手:\(dominantCount)個 非利き手:\(nonDominantCount)個"
                    ))
                }
                Button("リセット") { dominantCount = 0; nonDominantCount = 0; elapsed = 0 }
                    .buttonStyle(.bordered)
                    .foregroundColor(.red)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("Box and Block Test")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { timer?.invalidate() }
    }
}

private struct BBTInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label("実施方法", systemImage: "info.circle.fill").font(.headline)
            Text("150個のブロック（2.5cm角）を箱から箱へ1分間で移動させる個数を計測。片手ずつ実施し、利き手・非利き手の巧緻性を評価します。")
                .font(.subheadline).foregroundColor(.secondary)
        }
        .padding()
        .background(Color.blue.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct BBTTimerCard: View {
    let elapsed: Double
    let isRunning: Bool
    let activeHand: BBTView.HandSide

    var body: some View {
        VStack(spacing: 4) {
            let remaining = max(0, 60.0 - elapsed)
            Text(String(format: "%04.1f", remaining))
                .font(.system(size: 56, weight: .thin, design: .monospaced))
                .foregroundColor(isRunning ? (remaining < 10 ? .red : .green) : .primary)
            Text("残り秒数")
                .font(.subheadline).foregroundColor(.secondary)
        }
        .padding(24).frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 6, x: 0, y: 2)
        .padding(.horizontal)
    }
}

private struct BBTControlRow: View {
    let isRunning: Bool
    let onStart: () -> Void
    let onStop: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            Button(action: isRunning ? onStop : onStart) {
                Label(isRunning ? "ストップ" : "1分計測スタート",
                      systemImage: isRunning ? "stop.fill" : "play.fill")
                    .frame(maxWidth: .infinity).padding()
                    .background(isRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(.horizontal)
    }
}

private struct BBTCounterRow: View {
    @Binding var dominantCount: Int
    @Binding var nonDominantCount: Int

    var body: some View {
        HStack(spacing: 16) {
            CounterCard(title: "利き手", count: $dominantCount, color: .blue)
            CounterCard(title: "非利き手", count: $nonDominantCount, color: .purple)
        }
        .padding(.horizontal)
    }
}

private struct CounterCard: View {
    let title: String
    @Binding var count: Int
    let color: Color

    var body: some View {
        VStack(spacing: 10) {
            Text(title).font(.subheadline.bold())
            Text("\(count)")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(color)
            HStack(spacing: 16) {
                Button(action: { if count > 0 { count -= 1 } }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2).foregroundColor(color.opacity(0.5))
                }
                Button(action: { count += 1 }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2).foregroundColor(color)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

private struct BBTInterpretationCard: View {
    let dominant: Int
    let nonDominant: Int

    var body: some View {
        if dominant > 0 || nonDominant > 0 {
            VStack(alignment: .leading, spacing: 8) {
                Text("参考値（健常者平均）").font(.subheadline.bold()).padding(.horizontal)
                VStack(spacing: 6) {
                    HStack {
                        Text("利き手").font(.subheadline)
                        Spacer()
                        Text("\(dominant)個").font(.subheadline.bold()).foregroundColor(.blue)
                        Text("(健常者平均: 65〜70個/分)").font(.caption).foregroundColor(.secondary)
                    }
                    HStack {
                        Text("非利き手").font(.subheadline)
                        Spacer()
                        Text("\(nonDominant)個").font(.subheadline.bold()).foregroundColor(.purple)
                        Text("(健常者平均: 60〜65個/分)").font(.caption).foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - VAS/NRS View

struct VASNRSView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var nrsScore: Double = 0
    @State private var selectedLocation = "患側上肢"
    @State private var selectedType = "安静時痛"

    private let locations = ["患側上肢", "患側下肢", "肩関節", "手関節", "股関節", "膝関節", "足関節", "体幹", "頭部", "その他"]
    private let painTypes = ["安静時痛", "運動時痛", "夜間痛", "神経障害性疼痛"]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                NRSCard(score: $nrsScore)
                PainLocationCard(location: $selectedLocation, locations: locations,
                                 painType: $selectedType, painTypes: painTypes)
                PainInterpretationCard(score: Int(nrsScore))
                CPSPInfoCard()
                SaveRecordButton(color: .yellow, isEnabled: nrsScore > 0) {
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .vasNrs,
                        primaryValue: nrsScore,
                        displayLabel: "NRS: \(Int(nrsScore)) (\(selectedLocation)・\(selectedType))"
                    ))
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("VAS / NRS")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct NRSCard: View {
    @Binding var score: Double

    var color: Color {
        switch score {
        case 0..<1:  return .green
        case 1..<4:  return .yellow
        case 4..<7:  return .orange
        default:     return .red
        }
    }

    var body: some View {
        VStack(spacing: 14) {
            Text("NRS（Numeric Rating Scale）")
                .font(.subheadline).foregroundColor(.secondary)

            Text(String(format: "%.0f", score))
                .font(.system(size: 72, weight: .bold, design: .rounded))
                .foregroundColor(color)

            Text(nrsLabel)
                .font(.headline).foregroundColor(color)

            Slider(value: $score, in: 0...10, step: 1)
                .accentColor(color)
                .padding(.horizontal)

            HStack {
                Text("0\n痛みなし").font(.caption).foregroundColor(.secondary).multilineTextAlignment(.center)
                Spacer()
                Text("5\n中等度").font(.caption).foregroundColor(.secondary).multilineTextAlignment(.center)
                Spacer()
                Text("10\n想像最大").font(.caption).foregroundColor(.secondary).multilineTextAlignment(.center)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }

    private var nrsLabel: String {
        switch score {
        case 0:     return "痛みなし"
        case 1..<4: return "軽度の疼痛"
        case 4..<7: return "中等度の疼痛"
        case 7..<10: return "重度の疼痛"
        default:    return "最大の疼痛"
        }
    }
}

private struct PainLocationCard: View {
    @Binding var location: String
    let locations: [String]
    @Binding var painType: String
    let painTypes: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("疼痛部位").font(.headline).padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(locations, id: \.self) { loc in
                        Button(action: { location = loc }) {
                            Text(loc).font(.caption.bold())
                                .padding(.horizontal, 10).padding(.vertical, 6)
                                .background(location == loc ? Color.yellow : Color(.systemGray5))
                                .foregroundColor(location == loc ? .black : .primary)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal)
            }

            Text("疼痛の種類").font(.headline).padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(painTypes, id: \.self) { pt in
                        Button(action: { painType = pt }) {
                            Text(pt).font(.caption.bold())
                                .padding(.horizontal, 10).padding(.vertical, 6)
                                .background(painType == pt ? Color.orange : Color(.systemGray5))
                                .foregroundColor(painType == pt ? .white : .primary)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

private struct PainInterpretationCard: View {
    let score: Int

    private var info: (label: String, desc: String, color: Color) {
        switch score {
        case 0:    return ("疼痛なし", "現在疼痛を認めない", .green)
        case 1...3: return ("軽度疼痛", "日常生活への支障は少ない", .yellow)
        case 4...6: return ("中等度疼痛", "日常生活・リハに支障をきたす", .orange)
        case 7...9: return ("重度疼痛", "著明な機能障害・即時対応を検討", .red)
        default:   return ("最大疼痛", "緊急の疼痛管理が必要", .red)
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            Circle().fill(info.color).frame(width: 14, height: 14)
            VStack(alignment: .leading, spacing: 2) {
                Text(info.label).font(.headline).foregroundColor(info.color)
                Text(info.desc).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(info.color.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct CPSPInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("脳卒中後疼痛（CPSP）について", systemImage: "exclamationmark.triangle.fill")
                .font(.subheadline.bold()).foregroundColor(.orange)
            Text("脳卒中後の中枢性疼痛（CPSP）は発症後2〜6週頃から出現することが多く、灼熱感・冷感・異痛症などが特徴です。肩手症候群（CRPS type I）との鑑別が重要です。")
                .font(.subheadline).foregroundColor(.secondary)
        }
        .padding()
        .background(Color.orange.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

// MARK: - Shared manual score picker (for info-only views that need score recording)

struct ManualScoreEntry: View {
    let label: String
    let range: ClosedRange<Int>
    @Binding var score: Int?
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label).font(.caption).foregroundColor(.secondary)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    let step = max(1, (range.upperBound - range.lowerBound) / 20)
                    ForEach(Array(stride(from: range.lowerBound, through: range.upperBound, by: step)), id: \.self) { v in
                        Button(action: { score = score == v ? nil : v }) {
                            Text("\(v)").font(.caption.bold())
                                .padding(.horizontal, 8).padding(.vertical, 6)
                                .background(score == v ? color : Color(.systemGray5))
                                .foregroundColor(score == v ? .white : .primary)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - MoCA Info View

struct MoCAInfoView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var manualScore: Int? = nil
    private let domains: [(name: String, max: Int, desc: String)] = [
        ("視空間・遂行機能", 5, "Trail Making B / 立方体模写 / 時計描画"),
        ("命名", 3, "ライオン・サイ・ラクダの命名"),
        ("記憶（即時）", 0, "5単語の即時再生（スコアなし）"),
        ("注意", 6, "数字の順唱逆唱・サステインド・計算"),
        ("言語", 3, "文章反復・語音流暢性"),
        ("抽象化", 2, "類似性の判断"),
        ("遅延再生", 5, "5単語の遅延再生"),
        ("見当識", 6, "日付・月・年・曜日・場所・都市")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                MoCAHeaderCard()

                VStack(alignment: .leading, spacing: 10) {
                    Text("評価領域（合計30点）").font(.headline).padding(.horizontal)
                    ForEach(domains, id: \.name) { d in
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(d.name).font(.subheadline.bold())
                                Text(d.desc).font(.caption).foregroundColor(.secondary)
                            }
                            Spacer()
                            if d.max > 0 {
                                Text("\(d.max)点").font(.subheadline.bold()).foregroundColor(.purple)
                            } else {
                                Text("採点なし").font(.caption).foregroundColor(.secondary)
                            }
                        }
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                    }
                }

                MoCAInterpretationCard()
                MoCANoteCard()
                ManualScoreEntry(label: "実施後スコアを入力（0〜30）",
                                 range: 0...30, score: $manualScore, color: .purple)
                SaveRecordButton(color: .purple, isEnabled: manualScore != nil) {
                    if let s = manualScore {
                        recordsStore.add(AssessmentRecord(
                            assessmentType: .moca,
                            primaryValue: Double(s),
                            displayLabel: "合計: \(s)点"
                        ))
                    }
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("MoCA")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct MoCAHeaderCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("評価の目的", systemImage: "lightbulb.fill").font(.headline).foregroundColor(.purple)
            Text("MoCA（Montreal Cognitive Assessment）は軽度認知障害（MCI）のスクリーニングに特化した評価ツールです。MMSEより感度が高く、脳卒中後の認知機能評価に推奨されています。")
                .font(.subheadline).foregroundColor(.secondary)
        }
        .padding()
        .background(Color.purple.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct MoCAInterpretationCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("解釈基準").font(.headline).padding(.horizontal)
            VStack(spacing: 8) {
                ForEach([
                    ("≥ 26点", "正常", Color.blue),
                    ("22〜25点", "軽度認知障害（MCI）疑い", Color.yellow),
                    ("18〜21点", "中等度認知機能低下", Color.orange),
                    ("< 18点", "重度認知機能低下", Color.red)
                ], id: \.0) { range, label, color in
                    HStack {
                        Text(range).font(.subheadline.bold()).foregroundColor(color).frame(width: 80, alignment: .leading)
                        Text(label).font(.subheadline)
                        Spacer()
                    }
                    .padding(10)
                    .background(color.opacity(0.07))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.horizontal)
            Text("教育歴12年未満の場合は1点加算").font(.caption).foregroundColor(.secondary).padding(.horizontal)
        }
    }
}

private struct MoCANoteCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label("使用上の注意", systemImage: "exclamationmark.triangle.fill")
                .font(.subheadline.bold).foregroundColor(.orange)
            Text("MoCAの実際の試験用紙はwww.mocatest.orgから正式に入手してください。著作権により、試験内容の無断複製・掲載は禁じられています。本アプリは構造と解釈基準の参照のみを提供します。")
                .font(.caption).foregroundColor(.secondary)
        }
        .padding()
        .background(Color.orange.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

// MARK: - SIS Info View

struct SISInfoView: View {
    private let domains: [(name: String, items: Int, desc: String)] = [
        ("筋力", 4, "患側上肢・下肢の筋力"),
        ("手の機能", 5, "患側の手・指の機能"),
        ("ADL/IADL", 10, "日常・手段的日常生活活動"),
        ("移動", 9, "室内外の移動・歩行"),
        ("コミュニケーション", 7, "言語・読み書き・理解"),
        ("情動", 9, "気分・感情・意欲"),
        ("記憶と思考", 7, "記憶・集中力・問題解決"),
        ("参加", 8, "社会参加・役割遂行")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SISHeaderCard()
                VStack(alignment: .leading, spacing: 10) {
                    Text("評価領域（全\(domains.map{$0.items}.reduce(0,+))項目）")
                        .font(.headline).padding(.horizontal)
                    ForEach(domains, id: \.name) { d in
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(d.name).font(.subheadline.bold())
                                Text(d.desc).font(.caption).foregroundColor(.secondary)
                            }
                            Spacer()
                            Text("\(d.items)項目").font(.caption.bold()).foregroundColor(.teal)
                        }
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                    }
                }
                SISScoringSummary()
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("SIS（脳卒中影響スケール）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct SISHeaderCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("評価の目的", systemImage: "heart.fill").font(.headline).foregroundColor(.teal)
            Text("Stroke Impact Scale（SIS）は脳卒中後の健康状態・QOL・機能的アウトカムを患者自身が評価するアウトカム尺度です。身体機能だけでなく認知・情動・社会参加も含む包括的評価ができます。")
                .font(.subheadline).foregroundColor(.secondary)
        }
        .padding()
        .background(Color.teal.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct SISScoringSummary: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("採点方法").font(.headline).padding(.horizontal)
            VStack(alignment: .leading, spacing: 6) {
                ForEach([
                    "各項目: 1〜5点のLikertスケールで回答",
                    "各領域スコア = (合計−最低値)/(最高値−最低値) × 100",
                    "スコアが高いほど良好な健康状態・QOL",
                    "また、全体的な回復度（0〜100%）も別途聴取"
                ], id: \.self) { item in
                    HStack(alignment: .top, spacing: 8) {
                        Circle().fill(Color.teal).frame(width: 6, height: 6).padding(.top, 7)
                        Text(item).font(.subheadline)
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

// MARK: - mRS View

struct MRSView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var selectedGrade: Int? = nil

    private let grades: [(grade: Int, label: String, detail: String)] = [
        (0, "症状なし",        "完全回復。神経学的症状・制限なし"),
        (1, "軽症",           "症状はあるが日常業務に明らかな障害なし"),
        (2, "軽度障害",        "以前の全活動はできないが、介助なしに身の回りのことはできる"),
        (3, "中等度障害",      "何らかの介助は必要だが、介助なしに歩行はできる"),
        (4, "中等度〜重度障害", "自力歩行不能。身体的要求に対して介助なしでは対応できない"),
        (5, "重度障害",        "常時介護。失禁あり。終日ベッド生活"),
        (6, "死亡",           "")
    ]

    private func gradeColor(_ g: Int) -> Color {
        switch g {
        case 0: return .green
        case 1: return .blue
        case 2: return .teal
        case 3: return .yellow
        case 4: return .orange
        case 5: return .red
        default: return .gray
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("modified Rankin Scale", systemImage: "info.circle.fill")
                        .font(.headline).foregroundColor(.red)
                    Text("脳卒中後の全体的な障害・依存度を0〜6で評価するグローバルアウトカム指標。臨床研究・治験で最も広く使用されます。")
                        .font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color.red.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                if let g = selectedGrade {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("選択中: mRS \(g)").font(.subheadline).foregroundColor(.secondary)
                            Text(grades[g].label).font(.headline)
                        }
                        Spacer()
                        Text("\(g)")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundColor(gradeColor(g))
                    }
                    .padding()
                    .background(gradeColor(g).opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .padding(.horizontal)
                }

                VStack(spacing: 8) {
                    ForEach(grades, id: \.grade) { item in
                        Button(action: { selectedGrade = selectedGrade == item.grade ? nil : item.grade }) {
                            HStack(spacing: 14) {
                                Text("\(item.grade)")
                                    .font(.title3.bold())
                                    .foregroundColor(selectedGrade == item.grade ? .white : gradeColor(item.grade))
                                    .frame(width: 40, height: 40)
                                    .background(selectedGrade == item.grade ? gradeColor(item.grade) : gradeColor(item.grade).opacity(0.12))
                                    .clipShape(Circle())
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(item.label).font(.subheadline.bold()).foregroundColor(.primary)
                                    if !item.detail.isEmpty {
                                        Text(item.detail).font(.caption).foregroundColor(.secondary).multilineTextAlignment(.leading)
                                    }
                                }
                                Spacer()
                                if selectedGrade == item.grade {
                                    Image(systemName: "checkmark.circle.fill").foregroundColor(gradeColor(item.grade))
                                }
                            }
                            .padding(12)
                            .background(selectedGrade == item.grade ? gradeColor(item.grade).opacity(0.07) : Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding(.horizontal)

                if let g = selectedGrade {
                    SaveRecordButton(color: gradeColor(g), isEnabled: true) {
                        recordsStore.add(AssessmentRecord(
                            assessmentType: .mrs,
                            primaryValue: Double(g),
                            displayLabel: "mRS \(g): \(grades[g].label)"
                        ))
                    }
                    Button("選択をリセット") { selectedGrade = nil }
                        .buttonStyle(.bordered).foregroundColor(.red)
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("mRS（modified Rankin Scale）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - TCT View

struct TCTView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var scores: [Int: Int] = [:]
    private let color = Color.indigo
    private var totalScore: Int { scores.values.reduce(0, +) }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("寝返り・起き上がり・坐位バランスの評価")
                            .font(.subheadline).foregroundColor(.secondary)
                        Text("採点: 各項目 0 / 12 / 25点（4項目 合計100点）")
                            .font(.caption).foregroundColor(.secondary)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("\(totalScore)")
                            .font(.system(size: 44, weight: .bold, design: .rounded))
                            .foregroundColor(color)
                        Text("合計点").font(.caption).foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: .black.opacity(0.07), radius: 5, x: 0, y: 2)
                .padding(.horizontal)

                InterpretationCard(type: .tct, score: totalScore, color: color)

                VStack(spacing: 10) {
                    ForEach(tctItemNames.indices, id: \.self) { i in
                        TCTItemCard(index: i, name: tctItemNames[i],
                                    selectedScore: scores[i], color: color) { score in
                            scores[i] = scores[i] == score ? nil : score
                        }
                    }
                }
                .padding(.horizontal)

                SaveRecordButton(color: color, isEnabled: !scores.isEmpty) {
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .tct,
                        primaryValue: Double(totalScore),
                        displayLabel: "合計: \(totalScore)点"
                    ))
                }
                ResetButton(color: color) { scores = [:] }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("TCT（体幹コントロールテスト）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct TCTItemCard: View {
    let index: Int
    let name: String
    let selectedScore: Int?
    let color: Color
    let onSelect: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("\(index + 1)")
                    .font(.caption.bold()).foregroundColor(.white)
                    .frame(width: 22, height: 22)
                    .background(selectedScore != nil ? color : Color.gray)
                    .clipShape(Circle())
                Text(name).font(.subheadline.bold())
                Spacer()
                if let s = selectedScore {
                    Text("\(s)点").font(.headline.bold()).foregroundColor(color)
                }
            }
            HStack(spacing: 8) {
                ForEach(tctScoreOptions.indices, id: \.self) { idx in
                    let score = tctScoreOptions[idx]
                    let labelPart = tctScoreLabels[idx].components(separatedBy: ": ").last ?? ""
                    Button(action: { onSelect(score) }) {
                        VStack(spacing: 4) {
                            Text("\(score)")
                                .font(.headline.bold())
                                .foregroundColor(selectedScore == score ? .white : color)
                                .frame(maxWidth: .infinity).padding(.vertical, 10)
                                .background(selectedScore == score ? color : color.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Text(labelPart)
                                .font(.caption2).foregroundColor(.secondary).multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
    }
}

// MARK: - BIT View

struct BITView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var conventionalScore: Int? = nil
    @State private var behavioralScore: Int? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("行動性無視検査（BIT）", systemImage: "info.circle.fill")
                        .font(.headline).foregroundColor(.purple)
                    Text("半側空間無視（USN）を紙面作業と日常行動の両面から評価する標準化検査。通常検査6種（合計147点、カットオフ129点）と行動検査9種（合計81点、カットオフ67点）からなります。")
                        .font(.subheadline).foregroundColor(.secondary)
                    Text("※ BITの実施には公式検査用紙が必要です。")
                        .font(.caption.bold()).foregroundColor(.orange)
                }
                .padding()
                .background(Color.purple.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 10) {
                    Label("デジタルテスト実施", systemImage: "display")
                        .font(.headline).padding(.horizontal)
                    VStack(spacing: 8) {
                        NavigationLink(destination: BITLineCancellationView()) {
                            BITDigitalTestRow(title: "線分抹消テスト", subtitle: "画面上の40本の線分をタップして抹消", icon: "line.diagonal")
                        }
                        NavigationLink(destination: BITStarCancellationView()) {
                            BITDigitalTestRow(title: "星印抹消テスト", subtitle: "54個の小さな★を探してタップ", icon: "star")
                        }
                        NavigationLink(destination: BITLineBisectionView()) {
                            BITDigitalTestRow(title: "線分二等分テスト", subtitle: "3本の線の中点をタップ", icon: "arrow.left.and.right")
                        }
                        NavigationLink(destination: BITCopyDrawView()) {
                            BITDigitalTestRow(title: "模写・描画テスト", subtitle: "図形を模写してセラピストが採点", icon: "pencil.and.scribble")
                        }
                    }.padding(.horizontal)
                }

                BITSubtestSection(
                    title: "通常検査（合計147点、カットオフ: 129点）",
                    items: [("線分二等分検査", 9), ("文字抹消検査", 40), ("星印抹消検査", 54),
                            ("図形・形抹消検査", 18), ("線分検出検査", 18), ("模写・描画検査", 6)],
                    range: 0...147,
                    score: $conventionalScore,
                    cutoff: 129
                )

                BITSubtestSection(
                    title: "行動検査（合計81点、カットオフ: 67点）",
                    items: [("写真の顔の判別", 9), ("電話番号の読み上げ", 9), ("メニューの読み上げ", 9),
                            ("記事の読み上げ", 9), ("時計の読み取り", 9), ("コインの整理", 9),
                            ("写し書き", 9), ("住所と文章の書き取り", 9), ("地図上の道案内", 9)],
                    range: 0...81,
                    score: $behavioralScore,
                    cutoff: 67
                )

                if conventionalScore != nil || behavioralScore != nil {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("判定").font(.headline).padding(.horizontal)
                        VStack(spacing: 6) {
                            if let s = conventionalScore {
                                BITJudgementRow(label: "通常検査", score: s, cutoff: 129)
                            }
                            if let s = behavioralScore {
                                BITJudgementRow(label: "行動検査", score: s, cutoff: 67)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                SaveRecordButton(color: .purple, isEnabled: conventionalScore != nil || behavioralScore != nil) {
                    let c = conventionalScore.map { "通常:\($0)" } ?? ""
                    let b = behavioralScore.map { "行動:\($0)" } ?? ""
                    let label = [c, b].filter { !$0.isEmpty }.joined(separator: " ")
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .bit,
                        primaryValue: Double(conventionalScore ?? 0),
                        secondaryValue: behavioralScore.map { Double($0) },
                        displayLabel: label
                    ))
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("BIT（行動性無視検査）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct BITSubtestSection: View {
    let title: String
    let items: [(String, Int)]
    let range: ClosedRange<Int>
    @Binding var score: Int?
    let cutoff: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title).font(.headline).padding(.horizontal)
            VStack(alignment: .leading, spacing: 4) {
                ForEach(items, id: \.0) { item in
                    HStack {
                        Circle().fill(Color.purple).frame(width: 6, height: 6)
                        Text(item.0).font(.subheadline)
                        Spacer()
                        Text("max \(item.1)点").font(.caption).foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 6) {
                Text("合計スコアを入力（0〜\(range.upperBound)）").font(.caption).foregroundColor(.secondary)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        let step = max(1, (range.upperBound) / 20)
                        ForEach(Array(stride(from: range.lowerBound, through: range.upperBound, by: step)), id: \.self) { v in
                            Button(action: { score = score == v ? nil : v }) {
                                Text("\(v)").font(.caption.bold())
                                    .padding(.horizontal, 8).padding(.vertical, 6)
                                    .background(score == v ? Color.purple : Color(.systemGray5))
                                    .foregroundColor(score == v ? .white : .primary)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct BITJudgementRow: View {
    let label: String
    let score: Int
    let cutoff: Int
    var isAbnormal: Bool { score < cutoff }

    var body: some View {
        HStack {
            Text("\(label): \(score)点").font(.subheadline)
            Spacer()
            Text(isAbnormal ? "カットオフ以下（USN疑い）" : "正常範囲")
                .font(.subheadline.bold())
                .foregroundColor(isAbnormal ? .red : .green)
        }
        .padding(10)
        .background((isAbnormal ? Color.red : Color.green).opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: - TMT View

struct TMTView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    @State private var elapsedA: Double = 0
    @State private var elapsedB: Double = 0
    @State private var isRunningA = false
    @State private var isRunningB = false
    @State private var timerA: Timer?
    @State private var timerB: Timer?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("実施方法", systemImage: "info.circle.fill")
                        .font(.headline).foregroundColor(.purple)
                    Text("紙面上の数字（Part A）または数字・文字（Part B）を順に線で結ぶ時間を計測。注意機能・処理速度・実行機能を評価します。")
                        .font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color.purple.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                TMTPartCard(part: "A", description: "数字 1〜25 を順に線で結ぶ",
                            elapsed: $elapsedA, isRunning: $isRunningA, timerRef: $timerA, color: .blue)
                TMTPartCard(part: "B", description: "数字と文字を交互に結ぶ（1-あ-2-い-3-う…）",
                            elapsed: $elapsedB, isRunning: $isRunningB, timerRef: $timerB, color: .purple)

                if elapsedA > 0.5 && elapsedB > 0.5 {
                    let ratio = elapsedB / elapsedA
                    VStack(alignment: .leading, spacing: 10) {
                        Text("B / A 比分析").font(.headline).padding(.horizontal)
                        HStack {
                            VStack(spacing: 4) {
                                Text("B / A 比").font(.caption).foregroundColor(.secondary)
                                Text(String(format: "%.2f", ratio))
                                    .font(.title2.bold()).foregroundColor(ratio > 3.0 ? .red : .green)
                            }
                            .frame(maxWidth: .infinity)
                            Divider().frame(height: 50)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(ratio > 3.0 ? "実行機能障害の疑い" : "B/A比 正常範囲")
                                    .font(.subheadline.bold()).foregroundColor(ratio > 3.0 ? .red : .green)
                                Text("B/A比 > 3.0 で実行機能障害を疑う")
                                    .font(.caption).foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("参考値（健常者中央値）").font(.headline).padding(.horizontal)
                    VStack(spacing: 6) {
                        ForEach([("Part A", "20〜40代: 約28秒", "60〜79歳: 約50秒"),
                                 ("Part B", "20〜40代: 約65秒", "60〜79歳: 約130秒")],
                                id: \.0) { row in
                            HStack(alignment: .top) {
                                Text(row.0).font(.subheadline.bold()).frame(width: 70, alignment: .leading)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(row.1).font(.caption).foregroundColor(.secondary)
                                    Text(row.2).font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(10)
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal)
                    Text("脳卒中患者は年齢・教育歴を考慮した標準化スコアで解釈すること。")
                        .font(.caption).foregroundColor(.secondary).padding(.horizontal)
                }
                SaveRecordButton(color: .purple, isEnabled: elapsedA > 0.5 || elapsedB > 0.5) {
                    var parts: [String] = []
                    if elapsedA > 0.5 { parts.append(String(format: "A: %.1f秒", elapsedA)) }
                    if elapsedB > 0.5 { parts.append(String(format: "B: %.1f秒", elapsedB)) }
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .tmt,
                        primaryValue: elapsedA,
                        secondaryValue: elapsedB > 0.5 ? elapsedB : nil,
                        displayLabel: parts.joined(separator: " / ")
                    ))
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("TMT（Trail Making Test）")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { timerA?.invalidate(); timerB?.invalidate() }
    }
}

private struct TMTPartCard: View {
    let part: String
    let description: String
    @Binding var elapsed: Double
    @Binding var isRunning: Bool
    @Binding var timerRef: Timer?
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Part \(part)").font(.headline).foregroundColor(color)
                Spacer()
                if elapsed > 0 {
                    Text(String(format: "%.1f 秒", elapsed)).font(.title3.bold()).foregroundColor(color)
                }
            }
            Text(description).font(.subheadline).foregroundColor(.secondary)
            Text(String(format: "%06.2f", elapsed))
                .font(.system(size: 44, weight: .thin, design: .monospaced))
                .foregroundColor(isRunning ? color : .primary)
                .frame(maxWidth: .infinity, alignment: .center)
            HStack(spacing: 12) {
                Button(action: {
                    if isRunning {
                        timerRef?.invalidate(); timerRef = nil; isRunning = false
                    } else {
                        isRunning = true
                        timerRef = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in elapsed += 0.01 }
                    }
                }) {
                    Label(isRunning ? "ストップ" : "スタート", systemImage: isRunning ? "stop.fill" : "play.fill")
                        .frame(maxWidth: .infinity).padding(.vertical, 10)
                        .background(isRunning ? Color.red : color)
                        .foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button(action: { timerRef?.invalidate(); timerRef = nil; isRunning = false; elapsed = 0 }) {
                    Label("リセット", systemImage: "arrow.counterclockwise")
                        .frame(maxWidth: .infinity).padding(.vertical, 10)
                        .background(Color(.systemGray4)).foregroundColor(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.07), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// MARK: - CAT Info View

struct CATInfoView: View {
    private let subtests: [(name: String, desc: String, fn: String)] = [
        ("数唱（Span）", "数字の順唱・逆唱", "注意の容量・ワーキングメモリ"),
        ("抹消・検出課題①（視覚）", "ランダム文字列から標的を抹消", "選択性注意（視覚）"),
        ("抹消・検出課題②（聴覚）", "音声で呈示された数列から標的を検出", "選択性注意（聴覚）"),
        ("SDMT（Symbol Digit Modalities Test）", "記号と数字の対応を速く書く", "処理速度・注意の持続"),
        ("PASAT（聴覚連続加算課題）", "逐次呈示された数字の連続加算", "持続性注意・処理速度・WM"),
        ("TMT-A（Trail Making Test A）", "数字を順に線で結ぶ", "処理速度・視覚探索"),
        ("持続性注意課題", "持続的な標的検出課題", "注意の持続・警戒"),
        ("分割性注意課題", "視覚・聴覚の二重課題", "分割性注意")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("標準注意検査法（CAT）", systemImage: "lightbulb.fill")
                        .font(.headline).foregroundColor(.purple)
                    Text("CAT（Clinical Assessment for Attention）は日本で標準化された注意機能の包括的検査です。8つのサブテストで選択性・持続性・分割性・転換性注意を多面的に評価します。")
                        .font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color.purple.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 10) {
                    Text("検査構成（8サブテスト）").font(.headline).padding(.horizontal)
                    ForEach(subtests, id: \.name) { t in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(t.name).font(.subheadline.bold())
                            Text(t.desc).font(.caption).foregroundColor(.secondary)
                            Text("評価機能: \(t.fn)").font(.caption).foregroundColor(.purple)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Label("実施上の注意", systemImage: "exclamationmark.triangle.fill")
                        .font(.subheadline.bold()).foregroundColor(.orange)
                    Text("CATの実施には公式の検査キット（新興医学出版社）が必要です。各サブテストは標準化された手順で実施し、年齢・教育歴による規準値と比較してください。SDMT・PASATは脳卒中後の認知機能評価に特に有用です。")
                        .font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color.orange.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("CAT（標準注意検査法）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Digital Cancellation View

struct CancellationSymbol: Identifiable {
    let id = UUID()
    let character: String
    let isTarget: Bool
    let normalizedX: Double
    let normalizedY: Double
    var isTapped: Bool = false
}

struct DigitalCancellationView: View {
    @EnvironmentObject var recordsStore: RecordsStore
    enum TestState { case ready, playing, finished }

    @State private var testState: TestState = .ready
    @State private var symbols: [CancellationSymbol] = []
    @State private var timeRemaining: Int = 90
    @State private var countdownTimer: Timer?

    private let distractors = ["●", "▲", "■", "◆"]
    private let totalSymbols = 63
    private let targetCount = 18
    private let columns = 9
    private let rows = 7

    var body: some View {
        Group {
            switch testState {
            case .ready:    cancellationReadyView
            case .playing:  cancellationPlayingView
            case .finished: cancellationFinishedView
            }
        }
        .navigationTitle("デジタル抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { countdownTimer?.invalidate() }
    }

    private var cancellationReadyView: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 12) {
                    Image(systemName: "star.fill").font(.system(size: 60)).foregroundColor(.purple)
                    Text("デジタル抹消テスト").font(.title2.bold())
                    Text("画面上の ★ を全て探してタップしてください。\n制限時間は90秒です。")
                        .font(.subheadline).foregroundColor(.secondary).multilineTextAlignment(.center)
                }
                .padding()
                VStack(alignment: .leading, spacing: 8) {
                    Label("実施方法", systemImage: "info.circle.fill").font(.headline).foregroundColor(.purple)
                    Text("• 画面に ★ と ●▲■◆ が表示されます\n• ★ をできるだけ速く全てタップしてください\n• 左側と右側それぞれの成績から半側空間無視をスクリーニングします")
                        .font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color.purple.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                Button(action: startCancellationTest) {
                    Label("テスト開始", systemImage: "play.fill")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
    }

    private var cancellationPlayingView: some View {
        VStack(spacing: 0) {
            HStack {
                Label("残り \(timeRemaining)秒", systemImage: "clock")
                    .font(.headline).foregroundColor(timeRemaining <= 15 ? .red : .primary)
                Spacer()
                let tapped = symbols.filter { $0.isTarget && $0.isTapped }.count
                let total = symbols.filter { $0.isTarget }.count
                Text("★ \(tapped) / \(total)").font(.headline).foregroundColor(.purple)
            }
            .padding()
            .background(Color(.systemBackground))
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

            GeometryReader { geo in
                ZStack {
                    Color(.systemGray6)
                    ForEach($symbols) { $sym in
                        Button(action: {
                            if sym.isTarget && !sym.isTapped { sym.isTapped = true }
                        }) {
                            Text(sym.isTapped ? "✓" : sym.character)
                                .font(.system(size: 22, weight: sym.isTarget ? .bold : .regular))
                                .foregroundColor(
                                    sym.isTapped ? .green :
                                    sym.isTarget ? .purple : .gray
                                )
                                .frame(width: 36, height: 36)
                        }
                        .disabled(!sym.isTarget || sym.isTapped)
                        .position(x: sym.normalizedX * geo.size.width,
                                  y: sym.normalizedY * geo.size.height)
                    }
                }
            }
        }
    }

    private var cancellationFinishedView: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 60)).foregroundColor(.green)
                    Text("テスト終了").font(.title2.bold())
                }
                .padding()
                CancellationResultCard(symbols: symbols)
                SaveRecordButton(color: .purple, isEnabled: true) {
                    let tapped = symbols.filter { $0.isTarget && $0.isTapped }.count
                    let total = symbols.filter { $0.isTarget }.count
                    let leftMissed = symbols.filter { $0.isTarget && !$0.isTapped && $0.normalizedX < 0.5 }.count
                    let rightMissed = symbols.filter { $0.isTarget && !$0.isTapped && $0.normalizedX >= 0.5 }.count
                    var label = "発見:\(tapped)/\(total)"
                    if leftMissed > rightMissed + 1 { label += " 左無視疑い" }
                    else if rightMissed > leftMissed + 1 { label += " 右無視疑い" }
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .digitalCancellation,
                        primaryValue: Double(tapped),
                        secondaryValue: Double(total),
                        displayLabel: label
                    ))
                }
                Button(action: resetCancellationTest) {
                    Label("もう一度", systemImage: "arrow.counterclockwise")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
    }

    private func startCancellationTest() {
        var result: [CancellationSymbol] = []
        let colSpacing = 1.0 / Double(columns)
        let rowSpacing = 1.0 / Double(rows)
        var isTarget = Array(repeating: false, count: totalSymbols)
        Array(0..<totalSymbols).shuffled().prefix(targetCount).forEach { isTarget[$0] = true }
        for idx in 0..<totalSymbols {
            let col = idx % columns
            let row = idx / columns
            let baseX = (Double(col) + 0.5) * colSpacing
            let baseY = (Double(row) + 0.5) * rowSpacing
            let jX = Double.random(in: -colSpacing * 0.22...colSpacing * 0.22)
            let jY = Double.random(in: -rowSpacing * 0.22...rowSpacing * 0.22)
            let ch = isTarget[idx] ? "★" : distractors[Int.random(in: 0..<distractors.count)]
            result.append(CancellationSymbol(
                character: ch, isTarget: isTarget[idx],
                normalizedX: min(max(baseX + jX, 0.05), 0.95),
                normalizedY: min(max(baseY + jY, 0.05), 0.95)
            ))
        }
        symbols = result
        timeRemaining = 90
        testState = .playing
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                countdownTimer?.invalidate(); countdownTimer = nil
                testState = .finished
            }
        }
    }

    private func resetCancellationTest() {
        countdownTimer?.invalidate(); countdownTimer = nil
        symbols = []; timeRemaining = 90; testState = .ready
    }
}

private struct CancellationResultCard: View {
    let symbols: [CancellationSymbol]

    private var targets:       [CancellationSymbol] { symbols.filter { $0.isTarget } }
    private var tapped:        [CancellationSymbol] { targets.filter { $0.isTapped } }
    private var missed:        [CancellationSymbol] { targets.filter { !$0.isTapped } }
    private var leftMissed:    Int { missed.filter { $0.normalizedX < 0.5 }.count }
    private var rightMissed:   Int { missed.filter { $0.normalizedX >= 0.5 }.count }
    private var leftHit:       Int { tapped.filter { $0.normalizedX < 0.5 }.count }
    private var rightHit:      Int { tapped.filter { $0.normalizedX >= 0.5 }.count }
    private var neglectSide: String? {
        let diff = leftMissed - rightMissed
        if diff >= 2 { return "左側" }
        if -diff >= 2 { return "右側" }
        return nil
    }

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 20) {
                VStack(spacing: 4) {
                    Text("発見").font(.caption).foregroundColor(.secondary)
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("\(tapped.count)").font(.system(size: 36, weight: .bold, design: .rounded)).foregroundColor(.green)
                        Text("/ \(targets.count)個").font(.caption).foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                VStack(spacing: 4) {
                    Text("見落とし").font(.caption).foregroundColor(.secondary)
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("\(missed.count)").font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(missed.isEmpty ? .green : .red)
                        Text("個").font(.caption).foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(spacing: 8) {
                Text("左右別 見落とし分析").font(.headline)
                HStack(spacing: 12) {
                    CancellationSideCard(side: "左側", hit: leftHit, missed: leftMissed,
                                         isHighlighted: leftMissed > rightMissed + 1)
                    CancellationSideCard(side: "右側", hit: rightHit, missed: rightMissed,
                                         isHighlighted: rightMissed > leftMissed + 1)
                }
                if let side = neglectSide {
                    HStack(spacing: 8) {
                        Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange)
                        Text("\(side)の見落としが多く、半側空間無視の可能性があります")
                            .font(.subheadline).foregroundColor(.orange)
                    }
                    .padding()
                    .background(Color.orange.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                        Text("左右の見落とし差は少なく、空間的な無視所見は認めません")
                            .font(.subheadline).foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.green.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal)
    }
}

private struct CancellationSideCard: View {
    let side: String
    let hit: Int
    let missed: Int
    let isHighlighted: Bool

    var body: some View {
        VStack(spacing: 6) {
            Text(side).font(.subheadline.bold()).foregroundColor(isHighlighted ? .red : .primary)
            Text("発見: \(hit)個").font(.caption).foregroundColor(.green)
            Text("見落とし: \(missed)個").font(.caption).foregroundColor(missed > 0 ? .red : .secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(isHighlighted ? Color.red.opacity(0.08) : Color(.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - Clinical Benchmark Card

struct ClinicalBenchmarkCard: View {
    let type: AssessmentType

    var body: some View {
        let bmarks = type.benchmarks
        if !bmarks.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Label("臨床基準値（MCID / MDC）", systemImage: "chart.line.uptrend.xyaxis")
                    .font(.headline)
                    .padding(.horizontal)
                VStack(spacing: 6) {
                    ForEach(bmarks) { b in
                        HStack(alignment: .top) {
                            Text(b.label)
                                .font(.caption.bold())
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Color.teal)
                                .clipShape(Capsule())
                                .fixedSize()
                            VStack(alignment: .leading, spacing: 1) {
                                Text(b.value)
                                    .font(.subheadline.bold())
                                if !b.note.isEmpty {
                                    Text(b.note)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            Spacer()
                        }
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - BIT Digital Test Row

private struct BITDigitalTestRow: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.purple)
                .frame(width: 36, height: 36)
                .background(Color.purple.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline.bold()).foregroundColor(.primary)
                Text(subtitle).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - BIT Line Cancellation View

struct BITLineCancellationView: View {
    @EnvironmentObject var recordsStore: RecordsStore

    struct CancelLine: Identifiable {
        let id = UUID()
        let x: CGFloat; let y: CGFloat
        let angleDeg: Double
        var cancelled = false
        let region: Int  // 0=left, 1=center, 2=right
    }

    @State private var lines: [CancelLine] = []
    @State private var testStarted = false
    @State private var testFinished = false
    private let totalLines = 40
    private let hitRadius: CGFloat = 22

    var body: some View {
        if !testStarted {
            bitLineCancellationIntro
        } else if testFinished {
            bitLineCancellationResults
        } else {
            bitLineCancellationCanvas
        }
    }

    private var bitLineCancellationIntro: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "line.diagonal").font(.system(size: 60)).foregroundColor(.purple)
                Text("線分抹消テスト").font(.title2.bold())
                VStack(alignment: .leading, spacing: 8) {
                    Text("画面上に40本の線分がランダムに配置されます。").font(.subheadline)
                    Text("見つけた線分を全てタップして抹消してください。").font(.subheadline)
                    Text("左・中央・右の3領域で見落とし数を自動集計します。").font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                Button(action: startTest) {
                    Label("テスト開始", systemImage: "play.fill")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("線分抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var bitLineCancellationCanvas: some View {
        VStack(spacing: 0) {
            HStack {
                let cancelled = lines.filter { $0.cancelled }.count
                Text("抹消: \(cancelled) / \(totalLines)")
                    .font(.subheadline.bold())
                Spacer()
                Button(action: { testFinished = true }) {
                    Text("終了").font(.subheadline.bold())
                        .padding(.horizontal, 16).padding(.vertical, 6)
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

            GeometryReader { geo in
                ZStack {
                    Color(.systemGray6)
                    ForEach($lines) { $line in
                        lineShape(for: line, geo: geo)
                            .onTapGesture { line.cancelled = true }
                    }
                }
            }
        }
        .navigationTitle("線分抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func lineShape(for line: CancelLine, geo: GeometryProxy) -> some View {
        let px = line.x * geo.size.width
        let py = line.y * geo.size.height
        ZStack {
            Rectangle()
                .fill(line.cancelled ? Color.green : Color.black)
                .frame(width: 32, height: 3)
                .rotationEffect(.degrees(line.angleDeg))
                .opacity(line.cancelled ? 0.4 : 1.0)
            if line.cancelled {
                Image(systemName: "checkmark").font(.caption2).foregroundColor(.green)
            }
        }
        .frame(width: hitRadius * 2, height: hitRadius * 2)
        .contentShape(Rectangle())
        .position(x: px, y: py)
    }

    private var bitLineCancellationResults: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 50)).foregroundColor(.green)
                Text("テスト完了").font(.title2.bold())

                let leftMissed = lines.filter { $0.region == 0 && !$0.cancelled }.count
                let centerMissed = lines.filter { $0.region == 1 && !$0.cancelled }.count
                let rightMissed = lines.filter { $0.region == 2 && !$0.cancelled }.count
                let leftHit = lines.filter { $0.region == 0 && $0.cancelled }.count
                let centerHit = lines.filter { $0.region == 1 && $0.cancelled }.count
                let rightHit = lines.filter { $0.region == 2 && $0.cancelled }.count
                let totalCancelled = lines.filter { $0.cancelled }.count

                HStack(spacing: 8) {
                    CancellationSideCard(side: "左", hit: leftHit, missed: leftMissed, isHighlighted: leftMissed > rightMissed + 1)
                    CancellationSideCard(side: "中央", hit: centerHit, missed: centerMissed, isHighlighted: false)
                    CancellationSideCard(side: "右", hit: rightHit, missed: rightMissed, isHighlighted: rightMissed > leftMissed + 1)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 6) {
                    let neglectSide = leftMissed > rightMissed + 2 ? "左側空間無視の疑い" :
                                      rightMissed > leftMissed + 2 ? "右側空間無視の疑い" : "左右差なし（正常範囲）"
                    HStack {
                        Image(systemName: leftMissed != rightMissed ? "exclamationmark.triangle" : "checkmark.circle")
                            .foregroundColor(leftMissed != rightMissed ? .orange : .green)
                        Text(neglectSide).font(.subheadline.bold())
                    }
                    Text("抹消数: \(totalCancelled)/\(totalLines)本").font(.caption).foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                SaveRecordButton(color: .purple, isEnabled: true) {
                    let leftMissed = lines.filter { $0.region == 0 && !$0.cancelled }.count
                    let rightMissed = lines.filter { $0.region == 2 && !$0.cancelled }.count
                    let totalCancelled = lines.filter { $0.cancelled }.count
                    var label = "抹消:\(totalCancelled)/\(totalLines)"
                    if leftMissed > rightMissed + 2 { label += " 左無視疑い" }
                    else if rightMissed > leftMissed + 2 { label += " 右無視疑い" }
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .bit,
                        primaryValue: Double(totalCancelled),
                        secondaryValue: Double(totalLines),
                        displayLabel: "線分抹消: " + label
                    ))
                }
                Button(action: { testFinished = false; testStarted = false }) {
                    Label("もう一度", systemImage: "arrow.counterclockwise")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("線分抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func startTest() {
        lines = (0..<totalLines).map { i in
            let region = i < 13 ? 0 : i < 27 ? 1 : 2
            return CancelLine(
                x: CGFloat.random(in: 0.06...0.94),
                y: CGFloat.random(in: 0.04...0.96),
                angleDeg: Double.random(in: -75...75),
                region: region
            )
        }.shuffled()
        testStarted = true
        testFinished = false
    }
}

// MARK: - BIT Star Cancellation View

struct BITStarCancellationView: View {
    @EnvironmentObject var recordsStore: RecordsStore

    struct StarSymbol: Identifiable {
        let id = UUID()
        let x: CGFloat; let y: CGFloat
        let isTarget: Bool
        let character: String
        var tapped = false
        let region: Int  // 0=left, 1=center, 2=right
    }

    @State private var symbols: [StarSymbol] = []
    @State private var testStarted = false
    @State private var testFinished = false
    private let targetCount = 54
    private let distractorCount = 75

    var body: some View {
        if !testStarted {
            starCancellationIntro
        } else if testFinished {
            starCancellationResults
        } else {
            starCancellationCanvas
        }
    }

    private var starCancellationIntro: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("★").font(.system(size: 60))
                Text("星印抹消テスト").font(.title2.bold())
                VStack(alignment: .leading, spacing: 8) {
                    Text("画面上に小さな★（ターゲット54個）と記号・文字（妨害刺激）が混在して表示されます。").font(.subheadline)
                    Text("★だけを全てタップしてください。").font(.subheadline)
                    Text("左右の見落とし分布でUSNを評価します。").font(.subheadline).foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                Button(action: startStarTest) {
                    Label("テスト開始", systemImage: "play.fill")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("星印抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var starCancellationCanvas: some View {
        VStack(spacing: 0) {
            HStack {
                let tapped = symbols.filter { $0.isTarget && $0.tapped }.count
                Text("発見: \(tapped) / \(targetCount)")
                    .font(.subheadline.bold())
                Spacer()
                Button(action: { testFinished = true }) {
                    Text("終了").font(.subheadline.bold())
                        .padding(.horizontal, 16).padding(.vertical, 6)
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

            GeometryReader { geo in
                ZStack {
                    Color(.systemGray6)
                    ForEach($symbols) { $sym in
                        Button(action: {
                            if sym.isTarget && !sym.tapped { sym.tapped = true }
                        }) {
                            Text(sym.tapped ? "✓" : sym.character)
                                .font(.system(size: sym.isTarget ? 20 : 16))
                                .foregroundColor(sym.tapped ? .green : sym.isTarget ? .black : .gray)
                        }
                        .disabled(!sym.isTarget || sym.tapped)
                        .position(x: sym.x * geo.size.width, y: sym.y * geo.size.height)
                    }
                }
            }
        }
        .navigationTitle("星印抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var starCancellationResults: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 50)).foregroundColor(.green)
                Text("テスト完了").font(.title2.bold())

                let leftMissed = symbols.filter { $0.isTarget && !$0.tapped && $0.region == 0 }.count
                let rightMissed = symbols.filter { $0.isTarget && !$0.tapped && $0.region == 2 }.count
                let leftHit = symbols.filter { $0.isTarget && $0.tapped && $0.region == 0 }.count
                let centerHit = symbols.filter { $0.isTarget && $0.tapped && $0.region == 1 }.count
                let centerMissed = symbols.filter { $0.isTarget && !$0.tapped && $0.region == 1 }.count
                let rightHit = symbols.filter { $0.isTarget && $0.tapped && $0.region == 2 }.count
                let totalFound = symbols.filter { $0.isTarget && $0.tapped }.count

                HStack(spacing: 8) {
                    CancellationSideCard(side: "左", hit: leftHit, missed: leftMissed, isHighlighted: leftMissed > rightMissed + 1)
                    CancellationSideCard(side: "中央", hit: centerHit, missed: centerMissed, isHighlighted: false)
                    CancellationSideCard(side: "右", hit: rightHit, missed: rightMissed, isHighlighted: rightMissed > leftMissed + 1)
                }
                .padding(.horizontal)

                let neglectSide = leftMissed > rightMissed + 4 ? "左側空間無視の疑い" :
                                  rightMissed > leftMissed + 4 ? "右側空間無視の疑い" : "有意な左右差なし"
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Image(systemName: abs(leftMissed - rightMissed) > 4 ? "exclamationmark.triangle" : "checkmark.circle")
                            .foregroundColor(abs(leftMissed - rightMissed) > 4 ? .orange : .green)
                        Text(neglectSide).font(.subheadline.bold())
                    }
                    Text("発見数: \(totalFound)/\(targetCount)個").font(.caption).foregroundColor(.secondary)
                    Text("カットオフ: 44個未満で星印抹消テスト異常").font(.caption).foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                SaveRecordButton(color: .purple, isEnabled: true) {
                    let leftMissed = symbols.filter { $0.isTarget && !$0.tapped && $0.region == 0 }.count
                    let rightMissed = symbols.filter { $0.isTarget && !$0.tapped && $0.region == 2 }.count
                    let totalFound = symbols.filter { $0.isTarget && $0.tapped }.count
                    var label = "★発見:\(totalFound)/\(targetCount)"
                    if leftMissed > rightMissed + 4 { label += " 左無視疑い" }
                    else if rightMissed > leftMissed + 4 { label += " 右無視疑い" }
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .bit,
                        primaryValue: Double(totalFound),
                        secondaryValue: Double(targetCount),
                        displayLabel: "星印抹消: " + label
                    ))
                }
                Button(action: { testFinished = false; testStarted = false }) {
                    Label("もう一度", systemImage: "arrow.counterclockwise")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("星印抹消テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func startStarTest() {
        let distractors = ["△","◇","☆","○","□","◁","▷","♦","♣","♠"]
        var result: [StarSymbol] = []
        let total = targetCount + distractorCount
        for i in 0..<total {
            let isTarget = i < targetCount
            let region = i < (total / 3) ? 0 : i < (2 * total / 3) ? 1 : 2
            let ch = isTarget ? "★" : distractors[Int.random(in: 0..<distractors.count)]
            result.append(StarSymbol(
                x: CGFloat.random(in: 0.04...0.96),
                y: CGFloat.random(in: 0.04...0.96),
                isTarget: isTarget,
                character: ch,
                region: region
            ))
        }
        symbols = result.shuffled()
        testStarted = true
        testFinished = false
    }
}

// MARK: - BIT Line Bisection View

struct BITLineBisectionView: View {
    @EnvironmentObject var recordsStore: RecordsStore

    struct BisectionLine: Identifiable {
        let id = UUID()
        let startX: CGFloat
        let endX: CGFloat
        let y: CGFloat
        var tapX: CGFloat? = nil
        var deviation: CGFloat? {
            guard let tx = tapX else { return nil }
            let mid = (startX + endX) / 2.0
            return tx - mid
        }
    }

    @State private var lines: [BisectionLine] = [
        BisectionLine(startX: 0.1, endX: 0.9, y: 0.25),
        BisectionLine(startX: 0.15, endX: 0.85, y: 0.5),
        BisectionLine(startX: 0.08, endX: 0.92, y: 0.75),
    ]
    @State private var testDone = false

    private var allTapped: Bool { lines.allSatisfy { $0.tapX != nil } }

    var body: some View {
        VStack(spacing: 0) {
            if !testDone {
                VStack(spacing: 8) {
                    Text("各線分の中点と思う場所をタップしてください")
                        .font(.subheadline).foregroundColor(.secondary)
                    Text("残り: \(lines.filter { $0.tapX == nil }.count) / \(lines.count)")
                        .font(.caption).foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            }

            GeometryReader { geo in
                ZStack {
                    Color(.systemGray6)
                    Canvas { ctx, size in
                        for line in lines {
                            let sx = line.startX * size.width
                            let ex = line.endX * size.width
                            let ly = line.y * size.height
                            var path = Path()
                            path.move(to: CGPoint(x: sx, y: ly))
                            path.addLine(to: CGPoint(x: ex, y: ly))
                            ctx.stroke(path, with: .color(.black), lineWidth: 3)
                            let midX = (sx + ex) / 2
                            var midMark = Path()
                            midMark.move(to: CGPoint(x: midX, y: ly - 10))
                            midMark.addLine(to: CGPoint(x: midX, y: ly + 10))
                            ctx.stroke(midMark, with: .color(.blue.opacity(0.35)), lineWidth: 1)
                            if let tx = line.tapX {
                                let tapX = tx * size.width
                                var dot = Path()
                                dot.addEllipse(in: CGRect(x: tapX - 7, y: ly - 7, width: 14, height: 14))
                                ctx.fill(dot, with: .color(.red))
                            }
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture { loc in
                        let nx = loc.x / geo.size.width
                        let ny = loc.y / geo.size.height
                        var bestIdx: Int? = nil
                        var bestDist: CGFloat = 0.12
                        for i in lines.indices where lines[i].tapX == nil {
                            let dist = abs(ny - lines[i].y)
                            if dist < bestDist { bestDist = dist; bestIdx = i }
                        }
                        if let idx = bestIdx { lines[idx].tapX = nx }
                    }
                }
            }

            if allTapped && !testDone {
                Button(action: { testDone = true }) {
                    Label("結果を見る", systemImage: "chart.bar")
                        .font(.headline).frame(maxWidth: .infinity).padding()
                        .background(Color.purple).foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding()
            }

            if testDone {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(lines) { line in
                            if let dev = line.deviation {
                                let devPct = dev * 100
                                let devCm = dev * 24
                                HStack {
                                    Text("線分 \(lines.firstIndex(where: { $0.id == line.id })! + 1)")
                                        .font(.subheadline.bold())
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 2) {
                                        Text(String(format: "%+.1f%%", devPct))
                                            .font(.subheadline.bold())
                                            .foregroundColor(abs(devPct) > 5 ? .red : .green)
                                        Text(String(format: "約%+.1fcm（24cm線）", devCm))
                                            .font(.caption).foregroundColor(.secondary)
                                    }
                                }
                                .padding(10)
                                .background(Color(.secondarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        let avgDev = lines.compactMap { $0.deviation }.reduce(0, +) / CGFloat(lines.count)
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("平均偏位").font(.subheadline.bold())
                                Spacer()
                                Text(String(format: "%+.1f%%", avgDev * 100))
                                    .font(.headline.bold())
                                    .foregroundColor(abs(avgDev) > 0.05 ? .red : .green)
                            }
                            let interpretation = avgDev < -0.05 ? "左偏位（右半球障害・左無視疑い）" :
                                                 avgDev > 0.05 ? "右偏位（左半球障害・右無視疑い）" : "正常範囲（±5%以内）"
                            Text(interpretation).font(.subheadline).foregroundColor(.secondary)
                            Text("カットオフ: ±6.1mm（約2.5%）を超えると異常").font(.caption).foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                        SaveRecordButton(color: .purple, isEnabled: true) {
                            let avgDev = lines.compactMap { $0.deviation }.reduce(0, +) / CGFloat(lines.count)
                            let devPct = avgDev * 100
                            let label = String(format: "線分二等分: 平均偏位%+.1f%%", devPct)
                            recordsStore.add(AssessmentRecord(
                                assessmentType: .bit,
                                primaryValue: Double(avgDev * 100),
                                displayLabel: label
                            ))
                        }
                        Button(action: {
                            lines = [
                                BisectionLine(startX: 0.1, endX: 0.9, y: 0.25),
                                BisectionLine(startX: 0.15, endX: 0.85, y: 0.5),
                                BisectionLine(startX: 0.08, endX: 0.92, y: 0.75),
                            ]
                            testDone = false
                        }) {
                            Label("もう一度", systemImage: "arrow.counterclockwise")
                                .font(.headline).frame(maxWidth: .infinity).padding()
                                .background(Color.purple).foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("線分二等分テスト")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - BIT Copy Draw View

struct BITCopyDrawView: View {
    @EnvironmentObject var recordsStore: RecordsStore

    struct DrawnStroke: Identifiable {
        let id = UUID()
        var points: [CGPoint]
    }

    @State private var strokes: [DrawnStroke] = []
    @State private var currentStroke: DrawnStroke?
    @State private var selectedFigure = 0
    @State private var therapistScore: Int? = nil
    private let figures = ["星（4点）", "立方体（4点）", "花（4点）", "自由模写"]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("図形を選択").font(.headline).padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(figures.indices, id: \.self) { i in
                                Button(action: { selectedFigure = i; strokes = [] }) {
                                    Text(figures[i]).font(.caption.bold())
                                        .padding(.horizontal, 12).padding(.vertical, 6)
                                        .background(selectedFigure == i ? Color.purple : Color(.systemGray5))
                                        .foregroundColor(selectedFigure == i ? .white : .primary)
                                        .clipShape(Capsule())
                                }
                            }
                        }.padding(.horizontal)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("描画エリア").font(.subheadline.bold()).padding(.leading)
                        Spacer()
                        Button(action: { if !strokes.isEmpty { strokes.removeLast() } }) {
                            Label("消す", systemImage: "arrow.uturn.backward").font(.caption)
                        }.padding(.trailing)
                        Button(action: { strokes = [] }) {
                            Label("全消去", systemImage: "trash").font(.caption).foregroundColor(.red)
                        }.padding(.trailing)
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.4)))
                            .frame(height: 300)

                        Canvas { ctx, size in
                            for stroke in strokes {
                                var path = Path()
                                guard let first = stroke.points.first else { continue }
                                path.move(to: first)
                                stroke.points.dropFirst().forEach { path.addLine(to: $0) }
                                ctx.stroke(path, with: .color(.black), lineWidth: 2.5)
                            }
                            if let cur = currentStroke {
                                var path = Path()
                                guard let first = cur.points.first else { return }
                                path.move(to: first)
                                cur.points.dropFirst().forEach { path.addLine(to: $0) }
                                ctx.stroke(path, with: .color(.black), lineWidth: 2.5)
                            }
                        }
                        .frame(height: 300)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { val in
                                    if currentStroke == nil {
                                        currentStroke = DrawnStroke(points: [val.location])
                                    } else {
                                        currentStroke?.points.append(val.location)
                                    }
                                }
                                .onEnded { _ in
                                    if let stroke = currentStroke { strokes.append(stroke) }
                                    currentStroke = nil
                                }
                        )
                    }
                    .padding(.horizontal)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("セラピスト採点（0〜4点）").font(.headline).padding(.horizontal)
                    HStack(spacing: 12) {
                        ForEach(0...4, id: \.self) { score in
                            Button(action: { therapistScore = therapistScore == score ? nil : score }) {
                                Text("\(score)点")
                                    .font(.subheadline.bold())
                                    .frame(maxWidth: .infinity).padding(.vertical, 10)
                                    .background(therapistScore == score ? Color.purple : Color(.systemGray5))
                                    .foregroundColor(therapistScore == score ? .white : .primary)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }.padding(.horizontal)
                    Text("採点基準: 0=描けない、1=ほぼ不可、2=不完全、3=ほぼ正確、4=正確").font(.caption).foregroundColor(.secondary).padding(.horizontal)
                }

                SaveRecordButton(color: .purple, isEnabled: therapistScore != nil) {
                    let score = therapistScore ?? 0
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .bit,
                        primaryValue: Double(score),
                        displayLabel: "模写・描画(\(figures[selectedFigure])): \(score)点"
                    ))
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("模写・描画テスト")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Radar Chart View

struct RadarChartView: View {
    let values: [Double]
    let maxValue: Double
    let labels: [String]
    let color: Color

    private let axes: Int
    init(values: [Double], maxValue: Double, labels: [String], color: Color = .blue) {
        self.values = values
        self.maxValue = maxValue
        self.labels = labels
        self.color = color
        self.axes = values.count
    }

    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
            let radius = size * 0.38
            let labelRadius = size * 0.50

            ZStack {
                ForEach([0.25, 0.5, 0.75, 1.0], id: \.self) { fraction in
                    radarPolygon(fraction: fraction, center: center, radius: radius)
                        .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                }

                ForEach(0..<axes, id: \.self) { i in
                    let angle = axisAngle(i)
                    Path { p in
                        p.move(to: center)
                        p.addLine(to: pointOnCircle(center: center, radius: radius, angle: angle))
                    }
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }

                radarDataPath(center: center, radius: radius)
                    .fill(color.opacity(0.25))
                radarDataPath(center: center, radius: radius)
                    .stroke(color, lineWidth: 2)

                ForEach(0..<axes, id: \.self) { i in
                    let angle = axisAngle(i)
                    let pt = pointOnCircle(center: center, radius: labelRadius, angle: angle)
                    Text(i < labels.count ? labels[i] : "")
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .frame(width: 52)
                        .position(pt)
                }
            }
        }
    }

    private func axisAngle(_ i: Int) -> Double {
        Double(i) * 2 * .pi / Double(axes) - .pi / 2
    }

    private func pointOnCircle(center: CGPoint, radius: CGFloat, angle: Double) -> CGPoint {
        CGPoint(x: center.x + radius * CGFloat(cos(angle)),
                y: center.y + radius * CGFloat(sin(angle)))
    }

    private func radarPolygon(fraction: Double, center: CGPoint, radius: CGFloat) -> Path {
        Path { p in
            let r = radius * fraction
            for i in 0..<axes {
                let pt = pointOnCircle(center: center, radius: r, angle: axisAngle(i))
                i == 0 ? p.move(to: pt) : p.addLine(to: pt)
            }
            p.closeSubpath()
        }
    }

    private func radarDataPath(center: CGPoint, radius: CGFloat) -> Path {
        Path { p in
            for i in 0..<axes {
                let fraction = maxValue > 0 ? min(values[i] / maxValue, 1.0) : 0
                let pt = pointOnCircle(center: center, radius: radius * fraction, angle: axisAngle(i))
                i == 0 ? p.move(to: pt) : p.addLine(to: pt)
            }
            p.closeSubpath()
        }
    }
}

// MARK: - STEF View

struct STEFView: View {
    @EnvironmentObject var recordsStore: RecordsStore

    private let itemNames = ["大球", "中球", "小球", "把持", "側方つまみ", "2点つまみ", "精密つまみ", "大型物体", "碁石", "カード"]
    private let itemFullNames = [
        "大球（直径6.5cm）", "中球（直径3cm）", "小球（直径1.5cm）",
        "把持（円筒形把握）", "側方つまみ（鍵つまみ）", "2点つまみ（指頭つまみ）",
        "精密つまみ（三指）", "大型物体移動", "碁石（薄型ディスク）", "カードめくり"
    ]
    private let scoreOptions = [10, 8, 6, 4, 2, 0]
    private let timeLabels = ["≤15秒", "16-20秒", "21-30秒", "31-60秒", "61-120秒", "不能/>120秒"]

    @State private var scores: [Int?] = Array(repeating: nil, count: 10)

    private var totalScore: Int { scores.compactMap { $0 }.reduce(0, +) }
    private var allEntered: Bool { scores.allSatisfy { $0 != nil } }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("STEF（簡易上肢機能検査）", systemImage: "info.circle.fill")
                        .font(.headline).foregroundColor(.orange)
                    Text("10種の物体操作課題の所要時間を点数（0/2/4/6/8/10点）に変換し合計100点で評価します。各課題の点数分布をレーダーチャートで視覚化できます。")
                        .font(.subheadline).foregroundColor(.secondary)
                    ClinicalBenchmarkCard(type: .stef)
                }
                .padding()
                .background(Color.orange.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                if allEntered {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("合計スコア").font(.headline)
                            Spacer()
                            Text("\(totalScore) / 100点")
                                .font(.title2.bold()).foregroundColor(.orange)
                        }
                        .padding(.horizontal)

                        let interpretation = totalScore <= 49 ? "重度障害" :
                                             totalScore <= 74 ? "中等度障害" :
                                             totalScore <= 89 ? "軽度障害" : "正常〜軽度"
                        Text("判定: \(interpretation)").font(.subheadline).foregroundColor(.secondary).padding(.horizontal)

                        RadarChartView(
                            values: scores.map { Double($0 ?? 0) },
                            maxValue: 10,
                            labels: itemNames,
                            color: .orange
                        )
                        .frame(height: 260)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                    }
                }

                VStack(spacing: 12) {
                    ForEach(0..<10, id: \.self) { i in
                        STEFItemCard(
                            index: i,
                            name: itemFullNames[i],
                            scoreOptions: scoreOptions,
                            timeLabels: timeLabels,
                            score: $scores[i]
                        )
                    }
                }
                .padding(.horizontal)

                SaveRecordButton(color: .orange, isEnabled: scores.contains(where: { $0 != nil })) {
                    let entered = scores.compactMap { $0 }
                    let total = entered.reduce(0, +)
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .stef,
                        primaryValue: Double(total),
                        displayLabel: "STEF合計: \(total)点（\(entered.count)/10項目）"
                    ))
                }
                ResetButton(color: .orange) { scores = Array(repeating: nil, count: 10) }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("STEF（簡易上肢機能検査）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct STEFItemCard: View {
    let index: Int
    let name: String
    let scoreOptions: [Int]
    let timeLabels: [String]
    @Binding var score: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(index + 1)").font(.caption.bold()).foregroundColor(.white)
                    .frame(width: 22, height: 22)
                    .background(score != nil ? Color.orange : Color.gray)
                    .clipShape(Circle())
                Text(name).font(.subheadline.bold())
                Spacer()
                if let s = score {
                    Text("\(s)点").font(.headline.bold()).foregroundColor(.orange)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(Array(zip(scoreOptions, timeLabels)), id: \.0) { pts, time in
                        Button(action: { score = score == pts ? nil : pts }) {
                            VStack(spacing: 2) {
                                Text("\(pts)点").font(.caption.bold())
                                Text(time).font(.system(size: 9))
                            }
                            .padding(.horizontal, 10).padding(.vertical, 6)
                            .background(score == pts ? Color.orange : Color(.systemGray5))
                            .foregroundColor(score == pts ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
            }
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - MAL View

struct MALView: View {
    @EnvironmentObject var recordsStore: RecordsStore

    private let malItems = [
        "ドアを開ける（ドアノブを回す）", "キャビネットやドアを開ける（引く動作）",
        "洗面台を使う", "スプーンで食べる", "フォークで食べる", "食器を運ぶ",
        "ひざの上で物を安定させる", "ボタンをとめる", "コップや缶で飲む",
        "歯ブラシを使う", "本や新聞を読む（持つ動作）", "電話を使う",
        "テーブルを拭く", "タイプまたはキーボードを使う"
    ]

    @State private var aouScores: [Double] = Array(repeating: 0, count: 14)
    @State private var qomScores: [Double] = Array(repeating: 0, count: 14)
    @State private var anyEdited = false

    private var avgAOU: Double { aouScores.reduce(0, +) / Double(aouScores.count) }
    private var avgQOM: Double { qomScores.reduce(0, +) / Double(qomScores.count) }

    private let aouLabels = ["0: 全く使わない", "1: まれに使う", "2: 半分程度使う", "3: 以前より少し少ない", "4: 以前とほぼ同じ", "5: 以前と同じ"]
    private let qomLabels = ["0: 動かない", "1: 非常に困難", "2: 困難だがある程度可能", "3: 少し困難", "4: ほぼ正常", "5: 正常と同じ"]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("MAL（Motor Activity Log）", systemImage: "info.circle.fill")
                        .font(.headline).foregroundColor(.teal)
                    Text("14項目の上肢動作について、使用量（AOU）と動作の質（QOM）をそれぞれ0〜5点で評価します。患者・家族への問診形式で実施します。")
                        .font(.subheadline).foregroundColor(.secondary)
                    ClinicalBenchmarkCard(type: .mal)
                }
                .padding()
                .background(Color.teal.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                if anyEdited {
                    VStack(spacing: 8) {
                        HStack(spacing: 16) {
                            VStack(spacing: 4) {
                                Text("AOU平均").font(.caption).foregroundColor(.secondary)
                                Text(String(format: "%.2f", avgAOU))
                                    .font(.title2.bold()).foregroundColor(.teal)
                                Text("/ 5.0").font(.caption).foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            Divider().frame(height: 60)
                            VStack(spacing: 4) {
                                Text("QOM平均").font(.caption).foregroundColor(.secondary)
                                Text(String(format: "%.2f", avgQOM))
                                    .font(.title2.bold()).foregroundColor(.blue)
                                Text("/ 5.0").font(.caption).foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)

                        Text("MCID: AOU・QOM ともに 1.0点の改善が臨床的に意味のある変化")
                            .font(.caption).foregroundColor(.secondary).padding(.horizontal)
                    }
                }

                VStack(spacing: 12) {
                    ForEach(malItems.indices, id: \.self) { i in
                        MALItemCard(
                            index: i,
                            name: malItems[i],
                            aouLabels: aouLabels,
                            qomLabels: qomLabels,
                            aou: $aouScores[i],
                            qom: $qomScores[i],
                            onEdit: { anyEdited = true }
                        )
                    }
                }
                .padding(.horizontal)

                SaveRecordButton(color: .teal, isEnabled: anyEdited) {
                    recordsStore.add(AssessmentRecord(
                        assessmentType: .mal,
                        primaryValue: avgAOU,
                        secondaryValue: avgQOM,
                        displayLabel: String(format: "AOU: %.2f / QOM: %.2f", avgAOU, avgQOM)
                    ))
                }
                ResetButton(color: .teal) {
                    aouScores = Array(repeating: 0, count: 14)
                    qomScores = Array(repeating: 0, count: 14)
                    anyEdited = false
                }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("MAL（Motor Activity Log）")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct MALItemCard: View {
    let index: Int
    let name: String
    let aouLabels: [String]
    let qomLabels: [String]
    @Binding var aou: Double
    @Binding var qom: Double
    let onEdit: () -> Void
    @State private var isExpanded = true

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button(action: { withAnimation { isExpanded.toggle() } }) {
                HStack {
                    Text("\(index + 1)").font(.caption.bold()).foregroundColor(.white)
                        .frame(width: 22, height: 22)
                        .background(Color.teal)
                        .clipShape(Circle())
                    Text(name).font(.subheadline.bold()).foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 1) {
                        Text("AOU: \(String(format: "%.0f", aou))").font(.caption).foregroundColor(.teal)
                        Text("QOM: \(String(format: "%.0f", qom))").font(.caption).foregroundColor(.blue)
                    }
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption).foregroundColor(.secondary)
                }
            }

            if isExpanded {
                Divider()
                VStack(alignment: .leading, spacing: 6) {
                    Text("AOU（使用量）: \(aouLabels[Int(aou)])").font(.caption).foregroundColor(.secondary)
                    Slider(value: $aou, in: 0...5, step: 1)
                        .tint(.teal)
                        .onChange(of: aou) { _ in onEdit() }
                    Text("QOM（動作の質）: \(qomLabels[Int(qom)])").font(.caption).foregroundColor(.secondary)
                    Slider(value: $qom, in: 0...5, step: 1)
                        .tint(.blue)
                        .onChange(of: qom) { _ in onEdit() }
                }
            }
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        AssessmentDetailView(assessmentType: .brunnstrom)
    }
}
