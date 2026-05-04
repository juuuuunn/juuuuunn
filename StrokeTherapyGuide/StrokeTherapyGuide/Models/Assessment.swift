import Foundation

// MARK: - Domain

enum StrokeDomain: String, CaseIterable, Identifiable {
    case neurological = "神経学的評価"
    case motor        = "運動機能・麻痺"
    case spasticity   = "痙縮・筋緊張"
    case balanceGait  = "バランス・歩行"
    case trunk        = "体幹機能"
    case upperLimb    = "上肢機能・巧緻性"
    case adl          = "ADL・日常生活"
    case cognition    = "高次脳機能・認知・注意"
    case pain         = "疼痛"
    case nutrition    = "栄養評価"
    case qol          = "QOL・社会参加"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .neurological: return "brain.head.profile"
        case .motor:        return "figure.arms.open"
        case .spasticity:   return "arrow.trianglehead.2.clockwise.rotate.90"
        case .balanceGait:  return "figure.walk"
        case .trunk:        return "figure.core.training"
        case .upperLimb:    return "hand.raised.fill"
        case .adl:          return "house.fill"
        case .cognition:    return "lightbulb.fill"
        case .pain:         return "waveform.path.ecg"
        case .nutrition:    return "fork.knife"
        case .qol:          return "heart.fill"
        }
    }

    var color: DomainColor {
        switch self {
        case .neurological: return .red
        case .motor:        return .orange
        case .spasticity:   return .pink
        case .balanceGait:  return .green
        case .trunk:        return .indigo
        case .upperLimb:    return .blue
        case .adl:          return .teal
        case .cognition:    return .purple
        case .pain:         return .yellow
        case .nutrition:    return .mint
        case .qol:          return .cyan
        }
    }
}

enum DomainColor: String {
    case red, orange, pink, green, indigo, blue, teal, purple, yellow, mint, cyan
}

// MARK: - AssessmentType

enum AssessmentType: String, CaseIterable, Identifiable, Codable {
    // 神経学的評価
    case nihss          = "NIHSS"
    case jcs            = "JCS（Japan Coma Scale）"
    case gcs            = "GCS（Glasgow Coma Scale）"
    case mrs            = "mRS（modified Rankin Scale）"

    // 運動機能・麻痺
    case brunnstrom     = "Brunnstrom Stage"
    case fuglMeyerUpper = "Fugl-Meyer（上肢）"
    case fuglMeyerLower = "Fugl-Meyer（下肢）"
    case fuglMeyerSensory = "Fugl-Meyer（感覚）"
    case sias           = "SIAS（脳卒中機能評価セット）"

    // 痙縮・筋緊張
    case mas            = "Modified Ashworth Scale"

    // バランス・歩行
    case bergBalance    = "Berg Balance Scale"
    case fuglMeyerBalance = "Fugl-Meyer（バランス）"
    case tug            = "TUG Test"
    case tenMeterWalk   = "10m歩行テスト"
    case sixMWT         = "6分間歩行テスト"
    case fac            = "FAC（歩行自立度）"

    // 体幹機能
    case tct            = "TCT（体幹コントロールテスト）"
    case tis            = "TIS（体幹障害スケール）"
    case fact           = "FACT（体幹機能評価）"

    // 上肢機能・巧緻性
    case nhpt           = "9穴ペグテスト（NHPT）"
    case bbt            = "Box and Block Test（BBT）"

    // ADL
    case fim            = "FIM"
    case barthelIndex   = "Barthel Index"

    // 高次脳機能・認知・注意
    case mmse           = "MMSE"
    case moca           = "MoCA"
    case cbs            = "CBS（半側空間無視 日常行動）"
    case bit            = "BIT（行動性無視検査）"
    case tmt            = "TMT（Trail Making Test）"
    case cat            = "CAT（標準注意検査法）"
    case digitalCancellation = "デジタル抹消テスト"

    // 疼痛
    case vasNrs         = "VAS / NRS"

    // 栄養評価
    case mnasf          = "MNA®-SF（簡易栄養状態評価）"

    // QOL
    case sis            = "SIS（脳卒中影響スケール）"

    var id: String { rawValue }

    var domain: StrokeDomain {
        switch self {
        case .nihss, .jcs, .gcs, .mrs:                    return .neurological
        case .brunnstrom, .fuglMeyerUpper, .fuglMeyerLower,
             .fuglMeyerSensory, .sias:                     return .motor
        case .mas:                                         return .spasticity
        case .bergBalance, .fuglMeyerBalance, .tug,
             .tenMeterWalk, .sixMWT, .fac:                 return .balanceGait
        case .tct, .tis, .fact:                            return .trunk
        case .nhpt, .bbt:                                  return .upperLimb
        case .fim, .barthelIndex:                          return .adl
        case .mmse, .moca, .cbs, .bit, .tmt,
             .cat, .digitalCancellation:                   return .cognition
        case .vasNrs:                                      return .pain
        case .mnasf:                                       return .nutrition
        case .sis:                                         return .qol
        }
    }

    var purpose: String {
        switch self {
        case .nihss:             return "脳卒中神経学的重症度の定量的評価"
        case .jcs:               return "意識障害レベルの評価（国内標準）"
        case .gcs:               return "意識障害レベルの評価（国際標準）"
        case .mrs:               return "脳卒中後の全体的な障害・依存度の評価"
        case .brunnstrom:        return "上肢・手・下肢の運動回復ステージ評価"
        case .fuglMeyerUpper:    return "上肢運動機能・感覚・協調性の定量評価"
        case .fuglMeyerLower:    return "下肢運動機能・感覚・協調性の定量評価"
        case .fuglMeyerSensory:  return "上下肢の感覚障害（触覚・固有感覚）の評価"
        case .sias:              return "脳卒中患者の機能障害を包括的に評価する多項目スケール"
        case .mas:               return "痙縮（筋緊張亢進）の重症度評価"
        case .bergBalance:       return "立位・動的バランス能力の評価"
        case .fuglMeyerBalance:  return "坐位・立位バランス機能の定量評価"
        case .tug:               return "移動能力・転倒リスクの評価"
        case .tenMeterWalk:      return "歩行速度（m/s）の計測"
        case .sixMWT:            return "歩行持久力・有酸素能力の評価"
        case .fac:               return "歩行自立度の簡便な分類"
        case .tct:               return "寝返り・坐位バランスの体幹コントロール能力評価"
        case .tis:               return "坐位での静的・動的バランスと協調性の評価"
        case .fact:              return "坐位・移乗・立位における体幹制御機能の評価"
        case .nhpt:              return "手指巧緻性・上肢協調性の評価"
        case .bbt:               return "上肢把持機能・移動速度の評価"
        case .fim:               return "ADL自立度・介護量の包括的評価"
        case .barthelIndex:      return "ADL自立度の評価（10項目）"
        case .mmse:              return "認知機能スクリーニング（30点）"
        case .moca:              return "軽度認知障害（MCI）のスクリーニング"
        case .cbs:               return "半側空間無視の日常生活への影響評価"
        case .bit:               return "半側空間無視の系統的行動評価（紙面・行動）"
        case .tmt:               return "注意・実行機能・処理速度の評価"
        case .cat:               return "注意機能の多面的な標準化検査"
        case .digitalCancellation: return "画面上の標的を抹消する半側空間無視スクリーニング"
        case .vasNrs:            return "疼痛強度の主観的評価"
        case .mnasf:             return "高齢者・脳卒中患者の低栄養リスクスクリーニング"
        case .sis:               return "脳卒中後のQOLと機能的アウトカムの評価"
        }
    }

    var maxScore: Int? {
        switch self {
        case .nihss:             return 42
        case .jcs:               return nil
        case .gcs:               return 15
        case .mrs:               return 6
        case .brunnstrom:        return nil
        case .fuglMeyerUpper:    return 66
        case .fuglMeyerLower:    return 34
        case .fuglMeyerSensory:  return 24
        case .sias:              return nil
        case .mas:               return nil
        case .bergBalance:       return 56
        case .fuglMeyerBalance:  return 14
        case .tug:               return nil
        case .tenMeterWalk:      return nil
        case .sixMWT:            return nil
        case .fac:               return 5
        case .tct:               return 100
        case .tis:               return 23
        case .fact:              return 34
        case .nhpt:              return nil
        case .bbt:               return nil
        case .fim:               return 126
        case .barthelIndex:      return 100
        case .mmse:              return 30
        case .moca:              return 30
        case .cbs:               return 30
        case .bit:               return nil
        case .tmt:               return nil
        case .cat:               return nil
        case .digitalCancellation: return nil
        case .vasNrs:            return 10
        case .mnasf:             return 14
        case .sis:               return nil
        }
    }

    var iconName: String { domain.iconName }

    var hasScoringUI: Bool {
        switch self {
        case .nihss, .gcs, .jcs, .brunnstrom, .fuglMeyerUpper, .fuglMeyerLower,
             .fuglMeyerSensory, .mas, .bergBalance, .fuglMeyerBalance,
             .barthelIndex, .fim, .mmse, .cbs, .fac, .sias,
             .fact, .tis, .mnasf:
            return true
        default:
            return false
        }
    }

    var hasTimer: Bool {
        switch self {
        case .tug, .tenMeterWalk, .sixMWT, .nhpt, .tmt: return true
        default: return false
        }
    }
}

// MARK: - AssessmentItem / ScoringCriterion

struct AssessmentItem: Identifiable, Codable {
    let id: UUID
    let number: Int
    let name: String
    let description: String
    let scoringCriteria: [ScoringCriterion]
    var selectedScore: Int?

    init(id: UUID = UUID(), number: Int, name: String, description: String = "",
         scoringCriteria: [ScoringCriterion], selectedScore: Int? = nil) {
        self.id = id; self.number = number; self.name = name
        self.description = description; self.scoringCriteria = scoringCriteria
        self.selectedScore = selectedScore
    }
}

struct ScoringCriterion: Identifiable, Codable {
    let id: UUID
    let score: Int
    let description: String

    init(id: UUID = UUID(), score: Int, description: String) {
        self.id = id; self.score = score; self.description = description
    }
}

// MARK: - Items per AssessmentType

extension AssessmentType {
    var items: [AssessmentItem] {
        switch self {
        case .nihss:             return nihssItems
        case .gcs:               return gcsItems
        case .jcs:               return jcsItems
        case .bergBalance:       return bergBalanceItems
        case .fuglMeyerBalance:  return fuglMeyerBalanceItems
        case .fuglMeyerUpper:    return fuglMeyerUpperItems
        case .fuglMeyerLower:    return fuglMeyerLowerItems
        case .fuglMeyerSensory:  return fuglMeyerSensoryItems
        case .mas:               return masItems
        case .sias:              return siasItems
        case .fact:              return factItems
        case .tis:               return tisItems
        case .barthelIndex:      return barthelItems
        case .fim:               return []   // FIMInfoView uses custom UI
        case .mmse:              return mmseItems
        case .cbs:               return cbsItems
        case .fac:               return facItems
        case .mnasf:             return mnaSFItems
        default:                 return []
        }
    }

    // swiftlint:disable cyclomatic_complexity
    var interpretation: [(range: ClosedRange<Int>, label: String, description: String)] {
        switch self {
        case .nihss:
            return [(0...0,"正常","神経学的欠損なし"),(1...4,"軽症","軽度の神経学的欠損"),
                    (5...15,"中等症","中等度の神経学的欠損"),(16...20,"重症","重度の神経学的欠損"),
                    (21...42,"最重症","非常に重度の神経学的欠損")]
        case .gcs:
            return [(15...15,"意識清明","正常"),(13...14,"軽症","軽度意識障害"),
                    (9...12,"中等症","中等度意識障害"),(3...8,"重症","重度意識障害・昏睡")]
        case .mrs:
            return [(0...0,"症状なし","完全回復"),(1...1,"軽症","日常業務に障害なし"),
                    (2...2,"軽度障害","介助なし生活自立"),(3...3,"中等度障害","何らかの介助が必要だが自力歩行"),
                    (4...4,"中等度〜重度","自力歩行不能"),(5...5,"重度障害","常時介護・失禁・寝たきり"),
                    (6...6,"死亡","")]
        case .bergBalance:
            return [(0...20,"高転倒リスク","車椅子依存レベル"),(21...40,"中等度転倒リスク","介助歩行レベル"),
                    (41...56,"低転倒リスク","独立歩行可能レベル")]
        case .fuglMeyerBalance:
            return [(0...6,"重度障害","立位保持困難"),(7...10,"中等度障害","介助下立位"),
                    (11...14,"軽度〜正常","自立した立位・バランス")]
        case .fuglMeyerUpper:
            return [(0...19,"重症","弛緩性麻痺〜最小限の随意運動"),(20...35,"著明な障害","一部の随意運動あり"),
                    (36...55,"中等度障害","協調性に問題あり"),(56...66,"軽度〜正常","ほぼ正常な協調運動")]
        case .fuglMeyerLower:
            return [(0...9,"重症","弛緩性麻痺"),(10...19,"著明な障害","最小限の随意運動"),
                    (20...28,"中等度障害","協調性に問題あり"),(29...34,"軽度〜正常","ほぼ正常な協調運動")]
        case .fuglMeyerSensory:
            return [(0...8,"重度感覚障害","感覚ほぼ消失"),(9...16,"中等度感覚障害","感覚鈍麻"),
                    (17...24,"軽度〜正常","感覚ほぼ正常")]
        case .barthelIndex:
            return [(0...20,"完全依存","全介助"),(21...60,"重度依存","大部分介助"),
                    (61...90,"中等度依存","部分介助"),(91...99,"軽度依存","最小限介助"),
                    (100...100,"完全自立","介助不要")]
        case .tct:
            return [(0...24,"重度障害","体幹コントロールほぼ不能"),(25...49,"重度〜中等度","大部分で介助が必要"),
                    (50...74,"中等度障害","一部介助が必要"),(75...99,"軽度障害","概ね自立"),
                    (100...100,"正常","体幹コントロール正常")]
        case .tis:
            return [(0...6,"重度障害","坐位バランスほぼ不能"),(7...13,"中等度障害","著明な体幹障害"),
                    (14...19,"軽度〜中等度","体幹機能の一部障害"),(20...23,"正常〜軽度","ほぼ正常な体幹機能")]
        case .fact:
            return [(0...11,"重度障害","体幹制御ほぼ不能"),(12...22,"中等度障害","著明な体幹機能障害"),
                    (23...29,"軽度障害","体幹機能の一部障害"),(30...34,"正常〜軽度","ほぼ正常な体幹制御")]
        case .mmse:
            return [(0...17,"重度認知障害","日常生活に著しい支障"),(18...23,"中等度認知障害","介助・監視が必要"),
                    (24...26,"軽度認知障害","精査・経過観察が必要"),(27...30,"正常範囲","認知機能正常")]
        case .moca:
            return [(0...17,"重度","高度な認知機能低下"),(18...21,"中等度","中等度認知機能低下"),
                    (22...25,"軽度","軽度認知障害（MCI）疑い"),(26...30,"正常","認知機能正常（≥26点）")]
        case .cbs:
            return [(0...0,"無視なし","日常生活での無視を認めない"),(1...10,"軽度","軽度の半側空間無視"),
                    (11...20,"中等度","中等度の半側空間無視"),(21...30,"重度","重度の半側空間無視")]
        case .fim:
            return [(18...36,"完全介助","ほとんど全項目で介助"),(37...72,"中等度障害","大部分の項目で介助"),
                    (73...107,"軽度障害","一部で補助具または介助"),(108...126,"完全自立","全項目で自立")]
        case .mnasf:
            return [(0...7,"低栄養","栄養的介入が必要"),(8...11,"低栄養リスク","栄養状態の詳細評価を要する"),
                    (12...14,"正常","低栄養リスクなし")]
        default:
            return []
        }
    }
}

// MARK: - NIHSS

private let nihssItems: [AssessmentItem] = [
    .init(number: 1,  name: "意識レベル", description: "刺激に対する反応", scoringCriteria: [
        .init(score: 0, description: "完全覚醒"),
        .init(score: 1, description: "軽度の刺激で覚醒"),
        .init(score: 2, description: "繰り返し刺激で覚醒"),
        .init(score: 3, description: "反射のみ、または無反応")]),
    .init(number: 2,  name: "意識レベル（質問）", description: "月と年齢を答えさせる", scoringCriteria: [
        .init(score: 0, description: "両問とも正解"),
        .init(score: 1, description: "1問のみ正解"),
        .init(score: 2, description: "両問とも不正解")]),
    .init(number: 3,  name: "意識レベル（従命）", description: "開閉眼・手の開閉を命令", scoringCriteria: [
        .init(score: 0, description: "両命令とも従う"),
        .init(score: 1, description: "1命令のみ従う"),
        .init(score: 2, description: "どちらも従えない")]),
    .init(number: 4,  name: "眼球運動", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "部分的麻痺"),
        .init(score: 2, description: "完全麻痺または共同偏視")]),
    .init(number: 5,  name: "視野", scoringCriteria: [
        .init(score: 0, description: "視野欠損なし"),
        .init(score: 1, description: "部分的半盲"),
        .init(score: 2, description: "完全半盲"),
        .init(score: 3, description: "両側性盲または皮質盲")]),
    .init(number: 6,  name: "顔面麻痺", scoringCriteria: [
        .init(score: 0, description: "正常な対称的運動"),
        .init(score: 1, description: "軽度の麻痺"),
        .init(score: 2, description: "部分的麻痺（下顔面）"),
        .init(score: 3, description: "完全麻痺")]),
    .init(number: 7,  name: "上肢の運動（右）", description: "90°挙上10秒保持", scoringCriteria: nihssLimb()),
    .init(number: 8,  name: "上肢の運動（左）", description: "90°挙上10秒保持", scoringCriteria: nihssLimb()),
    .init(number: 9,  name: "下肢の運動（右）", description: "30°挙上5秒保持", scoringCriteria: nihssLimb()),
    .init(number: 10, name: "下肢の運動（左）", description: "30°挙上5秒保持", scoringCriteria: nihssLimb()),
    .init(number: 11, name: "運動失調", description: "指鼻指試験・踵膝試験", scoringCriteria: [
        .init(score: 0, description: "なし"),
        .init(score: 1, description: "一側肢に失調"),
        .init(score: 2, description: "両側に失調")]),
    .init(number: 12, name: "感覚", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "軽度〜中等度の感覚低下"),
        .init(score: 2, description: "重度〜完全な感覚消失")]),
    .init(number: 13, name: "言語（失語）", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "軽度〜中等度の失語"),
        .init(score: 2, description: "重度の失語"),
        .init(score: 3, description: "無言または全失語")]),
    .init(number: 14, name: "構音障害", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "軽度〜中等度"),
        .init(score: 2, description: "重度または無言")]),
    .init(number: 15, name: "消去・無視", scoringCriteria: [
        .init(score: 0, description: "異常なし"),
        .init(score: 1, description: "一側の消去"),
        .init(score: 2, description: "重度の半側無視")])
]

private func nihssLimb() -> [ScoringCriterion] {
    [.init(score: 0, description: "保持可能"),
     .init(score: 1, description: "10秒以内に下降・落下しない"),
     .init(score: 2, description: "重力に抗するが保持不可"),
     .init(score: 3, description: "重力に抗せず下降"),
     .init(score: 4, description: "全く動かない")]
}

// MARK: - GCS

private let gcsItems: [AssessmentItem] = [
    .init(number: 1, name: "開眼（E）", description: "Eye Opening", scoringCriteria: [
        .init(score: 4, description: "自然に開眼"),
        .init(score: 3, description: "呼びかけで開眼"),
        .init(score: 2, description: "痛み刺激で開眼"),
        .init(score: 1, description: "開眼しない")]),
    .init(number: 2, name: "言語反応（V）", description: "Verbal Response", scoringCriteria: [
        .init(score: 5, description: "見当識あり（正確な会話）"),
        .init(score: 4, description: "混乱した会話"),
        .init(score: 3, description: "不適切な言葉"),
        .init(score: 2, description: "理解不明な音声"),
        .init(score: 1, description: "なし")]),
    .init(number: 3, name: "運動反応（M）", description: "Motor Response", scoringCriteria: [
        .init(score: 6, description: "命令に従う"),
        .init(score: 5, description: "痛みの場所を認識（逃避）"),
        .init(score: 4, description: "痛みから逃げる（屈曲逃避）"),
        .init(score: 3, description: "異常屈曲（除皮質硬直）"),
        .init(score: 2, description: "異常伸展（除脳硬直）"),
        .init(score: 1, description: "なし")])
]

// MARK: - JCS

private let jcsItems: [AssessmentItem] = [
    .init(number: 1, name: "JCSスコア", description: "刺激なしで覚醒しているか確認してから評価", scoringCriteria: [
        .init(score: 0,   description: "【0】清明"),
        .init(score: 1,   description: "【I-1】だいたい清明、少し変"),
        .init(score: 2,   description: "【I-2】見当識障害あり"),
        .init(score: 3,   description: "【I-3】自分の名前・生年月日が言えない"),
        .init(score: 10,  description: "【II-10】普通の呼びかけで容易に開眼"),
        .init(score: 20,  description: "【II-20】大きな声・体を揺さぶると開眼"),
        .init(score: 30,  description: "【II-30】痛み刺激と呼びかけを繰り返すと辛うじて開眼"),
        .init(score: 100, description: "【III-100】痛み刺激で払いのける動作"),
        .init(score: 200, description: "【III-200】痛み刺激で少し手足を動かす・顔をしかめる"),
        .init(score: 300, description: "【III-300】痛み刺激に全く反応しない")])
]

// MARK: - MAS

private let masItems: [AssessmentItem] = [
    .init(number: 1,  name: "肩関節内外旋",   scoringCriteria: masScale()),
    .init(number: 2,  name: "肘関節屈曲",     scoringCriteria: masScale()),
    .init(number: 3,  name: "肘関節伸展",     scoringCriteria: masScale()),
    .init(number: 4,  name: "前腕回内",       scoringCriteria: masScale()),
    .init(number: 5,  name: "前腕回外",       scoringCriteria: masScale()),
    .init(number: 6,  name: "手関節背屈",     scoringCriteria: masScale()),
    .init(number: 7,  name: "手指屈曲",       scoringCriteria: masScale()),
    .init(number: 8,  name: "股関節内転筋",   scoringCriteria: masScale()),
    .init(number: 9,  name: "膝関節伸展",     scoringCriteria: masScale()),
    .init(number: 10, name: "足関節底屈（痙縮）", scoringCriteria: masScale())
]

private func masScale() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 筋緊張の亢進なし"),
     .init(score: 1, description: "1: 軽度亢進（引っかかり感）"),
     .init(score: 2, description: "1+: 軽度亢進（引っかかりの後に軽微な抵抗）"),
     .init(score: 3, description: "2: 全可動域で抵抗あるが可動域制限なし"),
     .init(score: 4, description: "3: 可動域制限を伴う著明な筋緊張亢進"),
     .init(score: 5, description: "4: 強直（屈曲または伸展位で固定）")]
}

// MARK: - Berg Balance Scale

private let bergBalanceItems: [AssessmentItem] = [
    .init(number: 1,  name: "坐位から立位",      scoringCriteria: berg4to0(["手を使わずに安全に立ち上がれる","手を使って自力で立てる","数回試みた後に手を使って立てる","立つための最小限の介助が必要","立つために中等度〜最大限の介助が必要"])),
    .init(number: 2,  name: "立位保持（2分）",    scoringCriteria: berg4to0(["2分間安全に立っていられる","監視下で2分間立っていられる","30秒間立っていられる","数回の試みで30秒間立っていられる","介助なしに30秒間立っていられない"])),
    .init(number: 3,  name: "坐位保持（背もたれなし2分）", scoringCriteria: berg4to0(["2分間安全に坐っていられる","監視下で2分間坐っていられる","30秒間坐っていられる","10秒間坐っていられる","支持なしに10秒間坐っていられない"])),
    .init(number: 4,  name: "立位から坐位",       scoringCriteria: berg4to0(["手をほとんど使わずに安全に坐れる","手を使って坐降を制御する","下肢後面をチェアに接触させて制御","自力で坐れるがコントロールができない","坐るために介助が必要"])),
    .init(number: 5,  name: "移乗動作",           scoringCriteria: berg4to0(["手をほとんど使わずに安全に移乗","手を使って安全に移乗","言語指示または監視が必要","1人の介助者が必要","2人の介助者または監視が必要"])),
    .init(number: 6,  name: "閉眼立位（10秒）",   scoringCriteria: berg4to0(["10秒間安全に立っていられる","監視下で10秒間立っていられる","3秒間立っていられる","3秒間目を閉じておけないが安全","転倒防止のための介助が必要"])),
    .init(number: 7,  name: "閉脚立位（1分）",    scoringCriteria: berg4to0(["1分間安全に立っていられる","監視下で1分間立っていられる","30秒間立っていられる","15秒間立っていられる","介助なしに立位や15秒間の保持ができない"])),
    .init(number: 8,  name: "立位前方リーチ",     description: "前方へのリーチ距離", scoringCriteria: berg4to0(["25cm以上のリーチが可能","12cm以上のリーチが可能","5cm以上のリーチが可能","リーチするが監視が必要","バランス保持のために介助が必要"])),
    .init(number: 9,  name: "立位での床からの物拾い", scoringCriteria: berg4to0(["安全かつ容易に拾える","監視下で拾える","2〜5cm以内に近づけないが安定","試みるが監視が必要","試みることができない、または介助が必要"])),
    .init(number: 10, name: "立位での振り返り",   scoringCriteria: berg4to0(["両側とも安全に後方を見られる","一側のみ安全に後方を見られる","横を向くが安全","振り返る際に監視が必要","バランスを保つための介助が必要"])),
    .init(number: 11, name: "360°回転",          scoringCriteria: berg4to0(["4秒以内に安全に360°回転","一側4秒以内のみ可能","安全だが遅い","厳重な監視または言語指示が必要","回転時に介助が必要"])),
    .init(number: 12, name: "踏み台昇降（4回）",  scoringCriteria: berg4to0(["20秒以内に安全に4回実施","20秒以内に4回できるが監視が必要","監視下で4回できるが20秒超","最小限の介助で2回以上できる","転倒防止のために介助が必要"])),
    .init(number: 13, name: "タンデム立位",       scoringCriteria: berg4to0(["独立してタンデム位をとれ30秒保持","独立して継ぎ足位をとれ30秒保持","独立して足を前に出せ30秒保持","歩を前に出すのに介助が必要だが15秒保持","立位中バランスを失う"])),
    .init(number: 14, name: "片脚立位",          scoringCriteria: berg4to0(["10秒以上独立して立っていられる","5〜10秒独立して立っていられる","3秒以上独立して立っていられる","片脚立位を試みるが3秒未満","試みることができず介助が必要"]))
]

private func berg4to0(_ descs: [String]) -> [ScoringCriterion] {
    zip((0...4).reversed(), descs).map { .init(score: $0, description: $1) }
}

// MARK: - Fugl-Meyer Balance

private let fuglMeyerBalanceItems: [AssessmentItem] = [
    .init(number: 1, name: "介助なし坐位", scoringCriteria: [
        .init(score: 0, description: "0: 坐位保持できない"),
        .init(score: 1, description: "1: 坐位保持できるが5分未満"),
        .init(score: 2, description: "2: 5分以上安定した坐位")]),
    .init(number: 2, name: "健側上肢のパラシュート反応", scoringCriteria: fm012Bal()),
    .init(number: 3, name: "患側上肢のパラシュート反応", scoringCriteria: fm012Bal()),
    .init(number: 4, name: "介助下立位", scoringCriteria: [
        .init(score: 0, description: "0: 立位不能"),
        .init(score: 1, description: "1: 多大な介助で立位可能"),
        .init(score: 2, description: "2: 最小限の介助で1分間立位")]),
    .init(number: 5, name: "介助なし立位", scoringCriteria: [
        .init(score: 0, description: "0: 立位不能"),
        .init(score: 1, description: "1: 1分未満の立位"),
        .init(score: 2, description: "2: 1分以上の安定した立位")]),
    .init(number: 6, name: "健側片脚立位", scoringCriteria: [
        .init(score: 0, description: "0: 片脚立位不能"),
        .init(score: 1, description: "1: 4秒未満"),
        .init(score: 2, description: "2: 4〜9秒")]),
    .init(number: 7, name: "患側片脚立位", scoringCriteria: [
        .init(score: 0, description: "0: 片脚立位不能"),
        .init(score: 1, description: "1: 4秒未満"),
        .init(score: 2, description: "2: 4〜9秒")])
]

private func fm012Bal() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 反応なし"),
     .init(score: 1, description: "1: 部分的な反応"),
     .init(score: 2, description: "2: 正常な反応")]
}

// MARK: - Fugl-Meyer Upper

private let fuglMeyerUpperItems: [AssessmentItem] = [
    .init(number: 1,  name: "反射活動（上腕二頭筋）",        scoringCriteria: fm02()),
    .init(number: 2,  name: "反射活動（上腕三頭筋）",        scoringCriteria: fm02()),
    .init(number: 3,  name: "屈筋共同運動（肩挙上）",        scoringCriteria: fm012()),
    .init(number: 4,  name: "屈筋共同運動（肩後退）",        scoringCriteria: fm012()),
    .init(number: 5,  name: "屈筋共同運動（肩外転90°）",    scoringCriteria: fm012()),
    .init(number: 6,  name: "屈筋共同運動（肩外旋）",        scoringCriteria: fm012()),
    .init(number: 7,  name: "屈筋共同運動（肘屈曲）",        scoringCriteria: fm012()),
    .init(number: 8,  name: "屈筋共同運動（前腕回外）",      scoringCriteria: fm012()),
    .init(number: 9,  name: "伸筋共同運動（肩内転/内旋）",   scoringCriteria: fm012()),
    .init(number: 10, name: "伸筋共同運動（肘伸展）",        scoringCriteria: fm012()),
    .init(number: 11, name: "伸筋共同運動（前腕回内）",      scoringCriteria: fm012()),
    .init(number: 12, name: "共同運動外（手を腰へ）",        scoringCriteria: fm012()),
    .init(number: 13, name: "共同運動外（肩屈曲90°肘伸展）", scoringCriteria: fm012()),
    .init(number: 14, name: "共同運動外（前腕回内外）",      scoringCriteria: fm012()),
    .init(number: 15, name: "手関節安定性（肘屈曲位）",      scoringCriteria: fm012()),
    .init(number: 16, name: "手関節屈伸（肘屈曲位）",        scoringCriteria: fm012()),
    .init(number: 17, name: "手関節安定性（肘伸展位）",      scoringCriteria: fm012()),
    .init(number: 18, name: "手関節屈伸（肘伸展位）",        scoringCriteria: fm012()),
    .init(number: 19, name: "手関節円運動",                  scoringCriteria: fm012()),
    .init(number: 20, name: "手指集団屈曲",                  scoringCriteria: fm012()),
    .init(number: 21, name: "手指集団伸展",                  scoringCriteria: fm012()),
    .init(number: 22, name: "手指把握（MP伸展/IP屈曲）",     scoringCriteria: fm012()),
    .init(number: 23, name: "手指把握（母指対立）",          scoringCriteria: fm012()),
    .init(number: 24, name: "手指把握（ピンチ）",            scoringCriteria: fm012()),
    .init(number: 25, name: "手指把握（円柱把握）",          scoringCriteria: fm012()),
    .init(number: 26, name: "手指把握（球状把握）",          scoringCriteria: fm012()),
    .init(number: 27, name: "上肢協調性（振戦）",            scoringCriteria: fm012()),
    .init(number: 28, name: "上肢協調性（測定障害）",        scoringCriteria: fm012()),
    .init(number: 29, name: "上肢協調性（速度）",            scoringCriteria: fm012())
]

// MARK: - Fugl-Meyer Lower

private let fuglMeyerLowerItems: [AssessmentItem] = [
    .init(number: 1,  name: "反射活動（アキレス腱）", scoringCriteria: fm02()),
    .init(number: 2,  name: "反射活動（膝蓋腱）",    scoringCriteria: fm02()),
    .init(number: 3,  name: "屈筋共同運動（股屈曲）", scoringCriteria: fm012()),
    .init(number: 4,  name: "屈筋共同運動（膝屈曲）", scoringCriteria: fm012()),
    .init(number: 5,  name: "屈筋共同運動（足背屈）", scoringCriteria: fm012()),
    .init(number: 6,  name: "伸筋共同運動（股伸展）", scoringCriteria: fm012()),
    .init(number: 7,  name: "伸筋共同運動（膝伸展）", scoringCriteria: fm012()),
    .init(number: 8,  name: "伸筋共同運動（足底屈）", scoringCriteria: fm012()),
    .init(number: 9,  name: "共同運動外（坐位膝屈曲）", scoringCriteria: fm012()),
    .init(number: 10, name: "共同運動外（坐位足背屈）", scoringCriteria: fm012()),
    .init(number: 11, name: "共同運動外（立位膝屈曲）", scoringCriteria: fm012()),
    .init(number: 12, name: "共同運動外（立位足背屈）", scoringCriteria: fm012()),
    .init(number: 13, name: "下肢協調性（振戦）",      scoringCriteria: fm012()),
    .init(number: 14, name: "下肢協調性（測定障害）",   scoringCriteria: fm012()),
    .init(number: 15, name: "下肢協調性（速度）",       scoringCriteria: fm012())
]

// MARK: - Fugl-Meyer Sensory

private let fuglMeyerSensoryItems: [AssessmentItem] = [
    .init(number: 1,  name: "触覚（上腕）",   description: "軽い触覚刺激", scoringCriteria: fm024Sensory()),
    .init(number: 2,  name: "触覚（手掌）",   description: "軽い触覚刺激", scoringCriteria: fm024Sensory()),
    .init(number: 3,  name: "触覚（大腿）",   description: "軽い触覚刺激", scoringCriteria: fm024Sensory()),
    .init(number: 4,  name: "触覚（下腿足底）", description: "軽い触覚刺激", scoringCriteria: fm024Sensory()),
    .init(number: 5,  name: "固有感覚（肩関節）", description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 6,  name: "固有感覚（肘関節）", description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 7,  name: "固有感覚（手関節）", description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 8,  name: "固有感覚（母指）",   description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 9,  name: "固有感覚（股関節）", description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 10, name: "固有感覚（膝関節）", description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 11, name: "固有感覚（足関節）", description: "上下運動の方向認知", scoringCriteria: fm024Prop()),
    .init(number: 12, name: "固有感覚（母趾）",   description: "上下運動の方向認知", scoringCriteria: fm024Prop())
]

private func fm024Sensory() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 感覚なし（麻酔状態）"),
     .init(score: 1, description: "1: 感覚鈍麻（過剰な刺激でのみ感知）"),
     .init(score: 2, description: "2: 正常感覚")]
}

private func fm024Prop() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 固有感覚なし（方向不明）"),
     .init(score: 1, description: "1: 75%以上の正答率"),
     .init(score: 2, description: "2: 正確に知覚（100%）")]
}

private func fm02() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 反射活動なし"),
     .init(score: 2, description: "2: 反射活動あり")]
}

private func fm012() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 全く動かない"),
     .init(score: 1, description: "1: 部分的に動く"),
     .init(score: 2, description: "2: 完全に動く")]
}

// MARK: - SIAS

private let siasItems: [AssessmentItem] = [
    // 運動機能（下肢）
    .init(number: 1,  name: "膝口テスト（股関節屈筋）", description: "仰臥位：股・膝屈曲させ手で口を触れるか", scoringCriteria: sias0to5()),
    .init(number: 2,  name: "膝伸展テスト（膝関節伸筋）", description: "仰臥位：膝関節完全伸展させるか", scoringCriteria: sias0to5()),
    .init(number: 3,  name: "足背屈テスト（足関節背屈筋）", description: "仰臥位：足関節背屈させるか", scoringCriteria: sias0to5()),
    // 運動機能（上肢）
    .init(number: 4,  name: "肩屈曲テスト（肩関節屈筋）", description: "坐位：上肢を前方挙上させるか", scoringCriteria: sias0to5()),
    .init(number: 5,  name: "肘伸展テスト（肘関節伸筋）", description: "坐位：肘を伸展させるか", scoringCriteria: sias0to5()),
    .init(number: 6,  name: "手指伸展テスト",              description: "坐位：手指を伸展させるか", scoringCriteria: sias0to5()),
    // 筋緊張
    .init(number: 7,  name: "膝関節伸筋緊張", description: "仰臥位：膝伸筋群のトーヌス", scoringCriteria: sias0to3Tone()),
    .init(number: 8,  name: "肘関節屈筋緊張", description: "仰臥位：肘屈筋群のトーヌス", scoringCriteria: sias0to3Tone()),
    // 感覚
    .init(number: 9,  name: "上肢感覚", description: "上腕部の触覚・固有感覚", scoringCriteria: sias0to2Sense()),
    .init(number: 10, name: "下肢感覚", description: "大腿部の触覚・固有感覚", scoringCriteria: sias0to2Sense()),
    // 関節可動域
    .init(number: 11, name: "肩関節ROM", description: "患側肩関節屈曲可動域", scoringCriteria: sias0to3ROM()),
    .init(number: 12, name: "足関節ROM（疼痛）", description: "底屈拘縮・疼痛", scoringCriteria: sias0to3ROM()),
    // 疼痛
    .init(number: 13, name: "肩部疼痛", description: "肩関節の安静時・運動時疼痛", scoringCriteria: [
        .init(score: 0, description: "0: 安静時痛あり、またはROM制限を伴う疼痛"),
        .init(score: 1, description: "1: 運動終末域でのみ疼痛"),
        .init(score: 2, description: "2: 疼痛なし")]),
    // 体幹
    .init(number: 14, name: "腹筋力テスト", description: "仰臥位→坐位へのSU動作", scoringCriteria: [
        .init(score: 0, description: "0: 起き上がり不能"),
        .init(score: 1, description: "1: 介助で可能"),
        .init(score: 2, description: "2: 自力で可能（健側手を使用）"),
        .init(score: 3, description: "3: 自力で可能（手を使わず）")]),
    .init(number: 15, name: "垂直性認知", description: "坐位での身体垂直認知", scoringCriteria: [
        .init(score: 0, description: "0: 著明な体幹傾斜（>15°）"),
        .init(score: 1, description: "1: 軽度の傾斜（5〜15°）"),
        .init(score: 2, description: "2: 正常（<5°）")]),
    // バランス
    .init(number: 16, name: "坐位バランス", description: "背もたれなしの端坐位", scoringCriteria: sias0to3Balance()),
    .init(number: 17, name: "起立能力",   description: "端坐位から立ち上がり", scoringCriteria: sias0to3Balance()),
    .init(number: 18, name: "歩行能力",   description: "実用的な歩行能力", scoringCriteria: [
        .init(score: 0, description: "0: 歩行不能"),
        .init(score: 1, description: "1: 平行棒内または歩行器使用"),
        .init(score: 2, description: "2: 四点杖または二点杖使用"),
        .init(score: 3, description: "3: 一点杖または自立歩行")])
]

private func sias0to5() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 全く動かない（弛緩性麻痺）"),
     .init(score: 1, description: "1: 触知できる収縮のみ"),
     .init(score: 2, description: "2: 重力に抗せない随意運動"),
     .init(score: 3, description: "3: 重力に抗せるが抵抗に負ける（共同運動優位）"),
     .init(score: 4, description: "4: 分離した運動（共同運動パターンの一部）"),
     .init(score: 5, description: "5: 完全な分離運動")]
}

private func sias0to3Tone() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 弛緩（筋緊張なし）"),
     .init(score: 1, description: "1: 低下"),
     .init(score: 2, description: "2: 正常"),
     .init(score: 3, description: "3: 亢進")]
}

private func sias0to2Sense() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 感覚消失"),
     .init(score: 1, description: "1: 感覚鈍麻"),
     .init(score: 2, description: "2: 正常")]
}

private func sias0to3ROM() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 著明な制限または強い疼痛"),
     .init(score: 1, description: "1: 中等度の制限または疼痛"),
     .init(score: 2, description: "2: 軽度の制限または軽い疼痛"),
     .init(score: 3, description: "3: 制限なし・疼痛なし")]
}

private func sias0to3Balance() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 不能"),
     .init(score: 1, description: "1: 多大な介助が必要"),
     .init(score: 2, description: "2: 軽度の介助または監視"),
     .init(score: 3, description: "3: 自立")]
}

// MARK: - TCT (Trunk Control Test) — special items for 0/12/25 scoring

let tctItemNames = ["患側への寝返り", "健側への寝返り", "仰臥位から端坐位への起き上がり", "端坐位バランス（30秒）"]
let tctScoreOptions = [0, 12, 25]
let tctScoreLabels = ["0: 不能", "12: 介助・代償あり", "25: 正常遂行"]

// MARK: - TIS (Trunk Impairment Scale)

private let tisItems: [AssessmentItem] = [
    // 静的バランス（max 7）
    .init(number: 1, name: "静的バランス①: 端坐位保持", description: "背もたれなし、両足接地", scoringCriteria: [
        .init(score: 0, description: "0: 10秒以内に崩れる"),
        .init(score: 2, description: "2: 10秒間保持できる（手で支持なし）")]),
    .init(number: 2, name: "静的バランス②: 患側への体重移動", description: "患側への能動的側方体重移動", scoringCriteria: [
        .init(score: 0, description: "0: 骨盤挙上なし"),
        .init(score: 1, description: "1: 骨盤挙上、体幹伸展なし"),
        .init(score: 2, description: "2: 骨盤挙上と適切な体幹伸展")]),
    .init(number: 3, name: "静的バランス③: 健側への体重移動", description: "健側への能動的側方体重移動", scoringCriteria: [
        .init(score: 0, description: "0: 骨盤挙上なし"),
        .init(score: 1, description: "1: 骨盤挙上、体幹伸展なし"),
        .init(score: 2, description: "2: 骨盤挙上と適切な体幹伸展"),
        .init(score: 3, description: "3: 体重移動後も端坐位を安定して保持")]),
    // 動的バランス（max 10）
    .init(number: 4, name: "動的バランス①: 体幹短縮（患側）", description: "患側下肢のスペースを作る短縮", scoringCriteria: tisActivity()),
    .init(number: 5, name: "動的バランス②: 体幹短縮（健側）", description: "健側下肢のスペースを作る短縮", scoringCriteria: tisActivity()),
    .init(number: 6, name: "動的バランス③: 体幹前傾（患側肘接触）", description: "患側肘を患側膝に接触させる", scoringCriteria: tisActivity()),
    .init(number: 7, name: "動的バランス④: 体幹前傾（健側肘接触）", description: "健側肘を健側膝に接触させる", scoringCriteria: tisActivity()),
    .init(number: 8, name: "動的バランス⑤: 患側腕伸展と対側挙上", description: "患側腕伸展→健側腕を肩高に挙上", scoringCriteria: [
        .init(score: 0, description: "0: 実施不能"),
        .init(score: 1, description: "1: 手の支持なしで不安定"),
        .init(score: 2, description: "2: 安定して実施できる")]),
    // 協調性（max 6）
    .init(number: 9,  name: "協調①: 患側への骨盤回旋", description: "坐位で骨盤を患側へ回旋", scoringCriteria: tisCoord()),
    .init(number: 10, name: "協調②: 健側への骨盤回旋", description: "坐位で骨盤を健側へ回旋", scoringCriteria: tisCoord()),
    .init(number: 11, name: "協調③: 患側への体幹回旋（上部）", description: "上部体幹を患側へ回旋", scoringCriteria: tisCoord()),
    .init(number: 12, name: "協調④: 健側への体幹回旋（上部）", description: "上部体幹を健側へ回旋", scoringCriteria: tisCoord()),
    .init(number: 13, name: "協調⑤: 反対方向への回旋（患→健）", description: "骨盤患側・体幹健側方向への反対回旋", scoringCriteria: tisCoord()),
    .init(number: 14, name: "協調⑥: 反対方向への回旋（健→患）", description: "骨盤健側・体幹患側方向への反対回旋", scoringCriteria: tisCoord())
]

private func tisActivity() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 実施不能"),
     .init(score: 1, description: "1: 手の支持を要する"),
     .init(score: 2, description: "2: 手の支持なしで実施できる")]
}

private func tisCoord() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 実施不能"),
     .init(score: 1, description: "1: 代償あり（体幹・上肢）")]
}

// MARK: - FACT (Functional Assessment for Control of Trunk)

private let factItems: [AssessmentItem] = [
    // 坐位タスク
    .init(number: 1,  name: "背もたれなし端坐位（5秒）", scoringCriteria: fact012()),
    .init(number: 2,  name: "患側上肢前方挙上（肩90°）", scoringCriteria: fact012()),
    .init(number: 3,  name: "健側上肢前方挙上（肩90°）", scoringCriteria: fact012()),
    .init(number: 4,  name: "体幹前傾（両手を前方床近くへ）", scoringCriteria: fact012()),
    .init(number: 5,  name: "体幹患側回旋（60°以上）", scoringCriteria: fact012()),
    .init(number: 6,  name: "体幹健側回旋（60°以上）", scoringCriteria: fact012()),
    .init(number: 7,  name: "患側側屈（患側肘→患側膝）", scoringCriteria: fact012()),
    .init(number: 8,  name: "健側側屈（健側肘→健側膝）", scoringCriteria: fact012()),
    // 移乗タスク
    .init(number: 9,  name: "仰臥位→端坐位（患側から）", scoringCriteria: fact012()),
    .init(number: 10, name: "仰臥位→端坐位（健側から）", scoringCriteria: fact012()),
    .init(number: 11, name: "端坐位→仰臥位（患側へ）", scoringCriteria: fact012()),
    .init(number: 12, name: "端坐位→仰臥位（健側へ）", scoringCriteria: fact012()),
    // 立位タスク
    .init(number: 13, name: "坐位→立位", scoringCriteria: fact012()),
    .init(number: 14, name: "立位→坐位", scoringCriteria: fact012()),
    .init(number: 15, name: "立位での体重移動（患側）", scoringCriteria: fact012()),
    .init(number: 16, name: "立位での体重移動（健側）", scoringCriteria: fact012()),
    .init(number: 17, name: "立位での体幹回旋（左右各60°）", scoringCriteria: fact012())
]

private func fact012() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 実施不能 / 全介助"),
     .init(score: 1, description: "1: 部分介助 / 代償動作あり"),
     .init(score: 2, description: "2: 自立・正常遂行")]
}

// MARK: - Barthel Index

private let barthelItems: [AssessmentItem] = [
    .init(number: 1,  name: "食事", scoringCriteria: [
        .init(score: 0,  description: "全介助"),
        .init(score: 5,  description: "部分介助（食物を切る等）"),
        .init(score: 10, description: "自立（補助具使用可）")]),
    .init(number: 2,  name: "椅子・ベッド移乗", scoringCriteria: [
        .init(score: 0,  description: "全介助（坐位不可）"),
        .init(score: 5,  description: "多大な介助が必要"),
        .init(score: 10, description: "最小限の介助または監視"),
        .init(score: 15, description: "自立")]),
    .init(number: 3,  name: "整容", description: "洗顔・歯磨き・ひげ剃り・整髪", scoringCriteria: [
        .init(score: 0, description: "介助が必要"),
        .init(score: 5, description: "自立")]),
    .init(number: 4,  name: "トイレ動作", scoringCriteria: [
        .init(score: 0,  description: "全介助"),
        .init(score: 5,  description: "部分介助"),
        .init(score: 10, description: "自立（補助具使用可）")]),
    .init(number: 5,  name: "入浴", scoringCriteria: [
        .init(score: 0, description: "介助が必要"),
        .init(score: 5, description: "自立（浴槽・シャワー）")]),
    .init(number: 6,  name: "歩行", scoringCriteria: [
        .init(score: 0,  description: "歩行不能"),
        .init(score: 5,  description: "車椅子で45m以上移動自立"),
        .init(score: 10, description: "1人の介助で45m以上歩行"),
        .init(score: 15, description: "45m以上自立歩行（補助具可）")]),
    .init(number: 7,  name: "階段昇降", scoringCriteria: [
        .init(score: 0,  description: "不可"),
        .init(score: 5,  description: "介助または監視が必要"),
        .init(score: 10, description: "自立（補助具可）")]),
    .init(number: 8,  name: "更衣", scoringCriteria: [
        .init(score: 0,  description: "全介助"),
        .init(score: 5,  description: "部分介助（半分以上自分で）"),
        .init(score: 10, description: "自立（補助具・特殊衣類可）")]),
    .init(number: 9,  name: "排便コントロール", scoringCriteria: [
        .init(score: 0,  description: "失禁または浣腸が必要"),
        .init(score: 5,  description: "時々失禁あり"),
        .init(score: 10, description: "完全自立")]),
    .init(number: 10, name: "排尿コントロール", scoringCriteria: [
        .init(score: 0,  description: "失禁またはカテーテル管理"),
        .init(score: 5,  description: "時々失禁あり"),
        .init(score: 10, description: "完全自立")])
]

// MARK: - MMSE

private let mmseItems: [AssessmentItem] = [
    .init(number: 1,  name: "時間の見当識（5点）", description: "年・季節・月・日・曜日（各1点）", scoringCriteria: rangeScale(0, 5)),
    .init(number: 2,  name: "場所の見当識（5点）", description: "国・県・市・病院・病棟（各1点）", scoringCriteria: rangeScale(0, 5)),
    .init(number: 3,  name: "即時記憶（3点）",     description: "3つの単語を繰り返す（各1点）", scoringCriteria: rangeScale(0, 3)),
    .init(number: 4,  name: "注意・計算（5点）",   description: "100-7を5回（各1点）", scoringCriteria: rangeScale(0, 5)),
    .init(number: 5,  name: "遅延再生（3点）",     description: "3つの単語を再び言う（各1点）", scoringCriteria: rangeScale(0, 3)),
    .init(number: 6,  name: "物品呼称（2点）",     description: "時計・鉛筆（各1点）", scoringCriteria: rangeScale(0, 2)),
    .init(number: 7,  name: "復唱（1点）",         description: "「桜・猫・電車」を復唱", scoringCriteria: rangeScale(0, 1)),
    .init(number: 8,  name: "3段階命令（3点）",    description: "「右手に紙を持ち…」3段階の命令", scoringCriteria: rangeScale(0, 3)),
    .init(number: 9,  name: "書字命令読解（1点）", description: "「目を閉じてください」を実行", scoringCriteria: rangeScale(0, 1)),
    .init(number: 10, name: "書字（1点）",          description: "意味のある文章を書く", scoringCriteria: rangeScale(0, 1)),
    .init(number: 11, name: "図形模写（1点）",      description: "五角形を模写", scoringCriteria: rangeScale(0, 1))
]

private func rangeScale(_ min: Int, _ max: Int) -> [ScoringCriterion] {
    (min...max).map { .init(score: $0, description: "\($0)点") }
}

// MARK: - CBS (Catherine Bergego Scale)

private let cbsItems: [AssessmentItem] = [
    .init(number: 1,  name: "口・顔・歯の清潔", description: "患側の清潔を忘れる",       scoringCriteria: cbsScale()),
    .init(number: 2,  name: "更衣",            description: "患側の更衣を忘れる",       scoringCriteria: cbsScale()),
    .init(number: 3,  name: "食事",            description: "患側のトレイ上の食物を無視", scoringCriteria: cbsScale()),
    .init(number: 4,  name: "テーブルの整頓",   description: "患側のテーブルを整頓しない", scoringCriteria: cbsScale()),
    .init(number: 5,  name: "会話中の注意方向", description: "患側の話し相手に注意を向けない", scoringCriteria: cbsScale()),
    .init(number: 6,  name: "テレビ・映画の視聴", description: "患側の画面を無視する",    scoringCriteria: cbsScale()),
    .init(number: 7,  name: "歩行中の障害物",  description: "患側の障害物を無視してぶつかる", scoringCriteria: cbsScale()),
    .init(number: 8,  name: "移動方向",        description: "患側へ曲がる際に困難がある", scoringCriteria: cbsScale()),
    .init(number: 9,  name: "身体の無視",      description: "患側の身体部位を無視する",   scoringCriteria: cbsScale()),
    .init(number: 10, name: "個人的な用品",    description: "患側に置いた用品を探せない", scoringCriteria: cbsScale())
]

private func cbsScale() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 全く無視なし"),
     .init(score: 1, description: "1: 軽度（偶発的・わずか）"),
     .init(score: 2, description: "2: 中等度（頻繁に観察）"),
     .init(score: 3, description: "3: 重度（常時観察・重大な障害）")]
}

// MARK: - FAC

private let facItems: [AssessmentItem] = [
    .init(number: 1, name: "歩行自立度分類", description: "Functional Ambulation Category", scoringCriteria: [
        .init(score: 0, description: "0: 非歩行 — 歩行不能・全介助"),
        .init(score: 1, description: "1: 依存歩行（重度） — 連続的な介助が必要"),
        .init(score: 2, description: "2: 依存歩行（軽度） — 監視・少量の介助が必要"),
        .init(score: 3, description: "3: 監視歩行 — 監視または言語的誘導が必要"),
        .init(score: 4, description: "4: 平地自立 — 平坦な地面では自立、段差・斜面は介助"),
        .init(score: 5, description: "5: 完全自立 — あらゆる環境での歩行が自立")])
]

// MARK: - MNA-SF

private let mnaSFItems: [AssessmentItem] = [
    .init(number: 1, name: "A: 食欲不振・消化器問題・咀嚼・嚥下困難", description: "過去3ヶ月間の食事量の変化", scoringCriteria: [
        .init(score: 0, description: "0: 著明な食事量の減少"),
        .init(score: 1, description: "1: 中等度の食事量の減少"),
        .init(score: 2, description: "2: 食事量の変化なし")]),
    .init(number: 2, name: "B: 体重減少", description: "過去3ヶ月間の体重変化", scoringCriteria: [
        .init(score: 0, description: "0: 3kg以上の体重減少"),
        .init(score: 1, description: "1: わからない"),
        .init(score: 2, description: "2: 1〜3kgの体重減少"),
        .init(score: 3, description: "3: 体重減少なし")]),
    .init(number: 3, name: "C: 移動能力", scoringCriteria: [
        .init(score: 0, description: "0: ベッドまたは車椅子に限定"),
        .init(score: 1, description: "1: ベッドや車椅子から離れられるが、外出はできない"),
        .init(score: 2, description: "2: 外出できる")]),
    .init(number: 4, name: "D: 精神的ストレスまたは急性疾患", description: "過去3ヶ月間", scoringCriteria: [
        .init(score: 0, description: "0: はい"),
        .init(score: 2, description: "2: いいえ")]),
    .init(number: 5, name: "E: 神経・精神的問題", scoringCriteria: [
        .init(score: 0, description: "0: 強度の認知症またはうつ"),
        .init(score: 1, description: "1: 軽度の認知症"),
        .init(score: 2, description: "2: 精神的問題なし")]),
    .init(number: 6, name: "F1: BMI（kg/m²）", description: "BMI = 体重(kg) ÷ 身長(m)²", scoringCriteria: [
        .init(score: 0, description: "0: BMI < 19"),
        .init(score: 1, description: "1: 19 ≤ BMI < 21"),
        .init(score: 2, description: "2: 21 ≤ BMI < 23"),
        .init(score: 3, description: "3: BMI ≥ 23")]),
]
