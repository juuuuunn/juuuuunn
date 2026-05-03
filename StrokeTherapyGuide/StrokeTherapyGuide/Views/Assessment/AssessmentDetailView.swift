import SwiftUI

struct AssessmentDetailView: View {
    let assessmentType: AssessmentType

    var body: some View {
        switch assessmentType {
        case .nihss, .bergBalance, .fuglMeyerUpper, .fuglMeyerLower:
            ScoreAssessmentView(assessmentType: assessmentType)
        case .tug:
            TUGAssessmentView()
        case .tenMeterWalk:
            TenMeterWalkView()
        case .fim:
            FIMInfoView()
        }
    }
}

struct ScoreAssessmentView: View {
    let assessmentType: AssessmentType
    @State private var scores: [UUID: Int] = [:]

    private var items: [AssessmentItem] { assessmentType.items }
    private var totalScore: Int { scores.values.reduce(0, +) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AssessmentInfoCard(type: assessmentType, total: totalScore)
                InterpretationCard(type: assessmentType, score: totalScore)

                VStack(spacing: 10) {
                    ForEach(items) { item in
                        AssessmentItemCard(
                            item: item,
                            selectedScore: scores[item.id],
                            onSelect: { score in
                                scores[item.id] = scores[item.id] == score ? nil : score
                            }
                        )
                    }
                }
                .padding(.horizontal)

                ResetButton { scores = [:] }
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(assessmentType.abbreviation)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct AssessmentInfoCard: View {
    let type: AssessmentType
    let total: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(type.purpose)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if type.maxScore > 0 {
                    Text("採点範囲: 0〜\(type.maxScore)点")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(total)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
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

private struct InterpretationCard: View {
    let type: AssessmentType
    let score: Int

    private var currentInterpretation: (range: ClosedRange<Int>, label: String, description: String)? {
        type.interpretation.first { $0.range.contains(score) }
    }

    var body: some View {
        if let interp = currentInterpretation {
            HStack(spacing: 12) {
                Image(systemName: "chart.bar.xaxis")
                    .foregroundColor(.blue)
                VStack(alignment: .leading, spacing: 2) {
                    Text(interp.label)
                        .font(.headline)
                    Text(interp.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(Color.blue.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
}

private struct AssessmentItemCard: View {
    let item: AssessmentItem
    let selectedScore: Int?
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
                        .background(selectedScore != nil ? Color.blue : Color.gray)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 3) {
                        Text(item.name)
                            .font(.subheadline.bold())
                            .foregroundColor(.primary)
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
                            .foregroundColor(.blue)
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

private struct ScoringButton: View {
    let criterion: ScoringCriterion
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 10) {
                Text("\(criterion.score)")
                    .font(.headline.bold())
                    .foregroundColor(isSelected ? .white : .blue)
                    .frame(width: 30, height: 30)
                    .background(isSelected ? Color.blue : Color.blue.opacity(0.1))
                    .clipShape(Circle())

                Text(criterion.description)
                    .font(.subheadline)
                    .foregroundColor(isSelected ? .primary : .secondary)
                    .multilineTextAlignment(.leading)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding(10)
            .background(isSelected ? Color.blue.opacity(0.07) : Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

private struct ResetButton: View {
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

struct TUGAssessmentView: View {
    @State private var elapsedSeconds: Double = 0
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var results: [Double] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TimerCard(elapsed: elapsedSeconds, isRunning: isRunning)

                HStack(spacing: 16) {
                    Button(action: startStop) {
                        Label(isRunning ? "ストップ" : "スタート",
                              systemImage: isRunning ? "stop.fill" : "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isRunning ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    Button(action: reset) {
                        Label("リセット", systemImage: "arrow.counterclockwise")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray4))
                            .foregroundColor(.primary)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal)

                if !isRunning && elapsedSeconds > 0 {
                    Button(action: { results.append(elapsedSeconds); elapsedSeconds = 0 }) {
                        Label("記録を保存", systemImage: "square.and.arrow.down.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                }

                TUGInterpretationCard(seconds: elapsedSeconds)

                if !results.isEmpty {
                    ResultsCard(results: results)
                }

                TUGProtocol()
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("TUG Test")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func startStop() {
        if isRunning {
            timer?.invalidate()
            timer = nil
            isRunning = false
        } else {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                elapsedSeconds += 0.01
            }
        }
    }

    private func reset() {
        timer?.invalidate()
        timer = nil
        isRunning = false
        elapsedSeconds = 0
    }
}

private struct TimerCard: View {
    let elapsed: Double
    let isRunning: Bool

    var body: some View {
        VStack(spacing: 4) {
            Text(String(format: "%05.2f", elapsed))
                .font(.system(size: 64, weight: .thin, design: .monospaced))
                .foregroundColor(isRunning ? .green : .primary)
            Text("秒")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 6, x: 0, y: 2)
        .padding(.horizontal)
    }
}

private struct TUGInterpretationCard: View {
    let seconds: Double

    private var interpretation: (label: String, detail: String, color: Color) {
        switch seconds {
        case 0..<1: return ("未計測", "計測してください", .gray)
        case 1..<10: return ("正常範囲", "転倒リスク低（地域在住高齢者）", .green)
        case 10..<12: return ("注意", "軽度の転倒リスク", .yellow)
        case 12..<20: return ("要注意", "中等度の転倒リスク・歩行補助具を要することが多い", .orange)
        default: return ("高リスク", "高い転倒リスク・ADL介助が必要なことが多い", .red)
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(interpretation.color)
                .frame(width: 14, height: 14)
            VStack(alignment: .leading, spacing: 2) {
                Text(interpretation.label)
                    .font(.headline)
                    .foregroundColor(interpretation.color)
                Text(interpretation.detail)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(interpretation.color.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct ResultsCard: View {
    let results: [Double]

    private var average: Double { results.reduce(0, +) / Double(results.count) }
    private var best: Double { results.min() ?? 0 }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("計測履歴")
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 6) {
                ForEach(Array(results.enumerated()), id: \.offset) { index, time in
                    HStack {
                        Text("試行 \(index + 1)")
                            .font(.subheadline)
                        Spacer()
                        Text(String(format: "%.2f秒", time))
                            .font(.subheadline.bold())
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                if results.count > 1 {
                    Divider()
                    HStack {
                        Text("平均")
                            .font(.subheadline)
                        Spacer()
                        Text(String(format: "%.2f秒", average))
                            .font(.subheadline.bold())
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 14)
                }
            }
            .padding(.horizontal)
        }
    }
}

private struct TUGProtocol: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("実施方法", systemImage: "info.circle.fill")
                .font(.headline)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                ForEach([
                    "患者は背もたれ付き椅子（座面高46cm）に深く腰掛ける",
                    "「行ってください」の合図で立ち上がり、3m先の目印まで歩く",
                    "折り返して椅子まで戻り、再び深く腰掛ける",
                    "普段使用している補助具（杖など）の使用を許可する",
                    "通常歩行速度で実施（最大速度は不要）",
                    "練習試行を1回行った後、本番を2〜3回計測し平均値を使用"
                ], id: \.self) { step in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                            .padding(.top, 7)
                            .foregroundColor(.blue)
                        Text(step)
                            .font(.subheadline)
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

struct TenMeterWalkView: View {
    @State private var elapsedSeconds: Double = 0
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var results: [Double] = []

    private var speed: Double {
        guard elapsedSeconds > 0 else { return 0 }
        return 10.0 / elapsedSeconds
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TimerCard(elapsed: elapsedSeconds, isRunning: isRunning)

                VStack(spacing: 6) {
                    Text(String(format: "%.3f m/s", speed))
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                    Text("歩行速度")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 16) {
                    Button(action: startStop) {
                        Label(isRunning ? "ストップ" : "スタート",
                              systemImage: isRunning ? "stop.fill" : "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isRunning ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    Button(action: reset) {
                        Label("リセット", systemImage: "arrow.counterclockwise")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray4))
                            .foregroundColor(.primary)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal)

                if !isRunning && elapsedSeconds > 0 {
                    Button(action: { results.append(elapsedSeconds); elapsedSeconds = 0 }) {
                        Label("記録を保存", systemImage: "square.and.arrow.down.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                }

                WalkSpeedInterpretationCard(speed: speed)
                TenMeterWalkProtocol()
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("10m歩行テスト")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func startStop() {
        if isRunning {
            timer?.invalidate()
            timer = nil
            isRunning = false
        } else {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                elapsedSeconds += 0.01
            }
        }
    }

    private func reset() {
        timer?.invalidate()
        timer = nil
        isRunning = false
        elapsedSeconds = 0
    }
}

private struct WalkSpeedInterpretationCard: View {
    let speed: Double

    private var interpretation: (label: String, detail: String, color: Color) {
        switch speed {
        case 0..<0.001: return ("未計測", "計測してください", .gray)
        case 0.001..<0.4: return ("重度障害", "屋内歩行のみ・介助が必要", .red)
        case 0.4..<0.6: return ("中等度障害", "限定的な地域歩行", .orange)
        case 0.6..<0.8: return ("軽度障害", "監視下での地域歩行", .yellow)
        case 0.8..<1.0: return ("ほぼ自立", "独立した地域歩行が可能", .green)
        default: return ("正常範囲", "完全な地域歩行・社会復帰レベル", .blue)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Circle()
                    .fill(interpretation.color)
                    .frame(width: 12, height: 12)
                Text(interpretation.label)
                    .font(.headline)
                    .foregroundColor(interpretation.color)
                Spacer()
            }
            Text(interpretation.detail)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Divider()

            Text("MCID（最小臨床的重要変化量）: 0.16 m/s")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(interpretation.color.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct TenMeterWalkProtocol: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("実施方法", systemImage: "info.circle.fill")
                .font(.headline)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                ForEach([
                    "14m のコースを準備（加速2m + 計測10m + 減速2m）",
                    "スタート地点から歩き始める",
                    "計測区間（2m地点）でタイマースタート",
                    "計測終了地点（12m地点）でタイマーストップ",
                    "通常歩行速度・最大歩行速度の両方を計測",
                    "補助具使用の有無を記録する",
                    "2〜3回計測し平均値を算出"
                ], id: \.self) { step in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                            .padding(.top, 7)
                            .foregroundColor(.blue)
                        Text(step)
                            .font(.subheadline)
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

struct FIMInfoView: View {
    private let domains: [(title: String, items: [String], color: Color)] = [
        ("セルフケア（6項目）", ["食事", "整容", "清拭", "更衣（上半身）", "更衣（下半身）", "トイレ動作"], .blue),
        ("排泄コントロール（2項目）", ["排尿管理", "排便管理"], .purple),
        ("移乗（3項目）", ["ベッド・椅子・車椅子", "トイレ", "浴槽・シャワー"], .green),
        ("移動（2項目）", ["歩行・車椅子", "階段"], .orange),
        ("コミュニケーション（2項目）", ["理解", "表出"], .teal),
        ("社会的認知（3項目）", ["社会的交流", "問題解決", "記憶"], .red)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                FIMScoringCard()

                VStack(alignment: .leading, spacing: 12) {
                    Label("評価項目（全18項目）", systemImage: "list.number")
                        .font(.headline)
                        .padding(.horizontal)

                    ForEach(domains, id: \.title) { domain in
                        FIMDomainCard(domain: domain)
                    }
                }

                FIMInterpretationCard()
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("FIM")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct FIMScoringCard: View {
    let levels = [
        (score: 7, label: "完全自立", description: "補助具不要・安全・適切な時間"),
        (score: 6, label: "修正自立", description: "補助具使用・安全・適切な時間"),
        (score: 5, label: "監視・準備", description: "身体介助不要だが監視が必要"),
        (score: 4, label: "最小介助", description: "自分で75%以上実施"),
        (score: 3, label: "中等度介助", description: "自分で50〜74%実施"),
        (score: 2, label: "最大介助", description: "自分で25〜49%実施"),
        (score: 1, label: "全介助", description: "自分で25%未満しか実施できない")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("採点基準（各項目1〜7点）", systemImage: "star.circle.fill")
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 0) {
                ForEach(levels, id: \.score) { level in
                    HStack(spacing: 12) {
                        Text("\(level.score)")
                            .font(.headline.bold())
                            .foregroundColor(.white)
                            .frame(width: 28, height: 28)
                            .background(scoreColor(level.score))
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 1) {
                            Text(level.label)
                                .font(.subheadline.bold())
                            Text(level.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)

                    if level.score > 1 {
                        Divider().padding(.leading, 54)
                    }
                }
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
        }
    }

    private func scoreColor(_ score: Int) -> Color {
        switch score {
        case 7: return .blue
        case 6: return .cyan
        case 5: return .green
        case 4: return .yellow
        case 3: return .orange
        case 2: return .red.opacity(0.7)
        default: return .red
        }
    }
}

private struct FIMDomainCard: View {
    let domain: (title: String, items: [String], color: Color)

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(domain.title)
                .font(.subheadline.bold())
                .foregroundColor(domain.color)

            ForEach(domain.items, id: \.self) { item in
                HStack(spacing: 8) {
                    Circle()
                        .fill(domain.color.opacity(0.5))
                        .frame(width: 6, height: 6)
                    Text(item)
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(domain.color.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

private struct FIMInterpretationCard: View {
    let ranges: [(label: String, range: String, description: String)] = [
        ("完全自立", "108〜126点", "全項目で自立"),
        ("修正自立〜軽度障害", "73〜107点", "一部で補助具使用または介助"),
        ("中等度障害", "37〜72点", "大部分の項目で何らかの介助"),
        ("重度障害", "18〜36点", "ほとんど全項目で介助")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("解釈基準（総合計: 18〜126点）", systemImage: "chart.bar.fill")
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 8) {
                ForEach(ranges, id: \.label) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.label)
                                .font(.subheadline.bold())
                            Text(item.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(item.range)
                            .font(.subheadline.bold())
                            .foregroundColor(.blue)
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

#Preview {
    NavigationStack {
        AssessmentDetailView(assessmentType: .bergBalance)
    }
}
