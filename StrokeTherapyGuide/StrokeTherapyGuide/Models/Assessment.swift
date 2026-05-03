import Foundation

// MARK: - Domain (障害領域)

enum StrokeDomain: String, CaseIterable, Identifiable {
    case neurological  = "神経学的評価"
    case motor         = "運動機能・麻痺"
    case spasticity    = "痙縮・筋緊張"
    case balanceGait   = "バランス・歩行"
    case upperLimb     = "上肢機能・巧緻性"
    case adl           = "ADL・日常生活"
    case cognition     = "高次脳機能・認知"
    case pain          = "疼痛"
    case qol           = "QOL・社会参加"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .neurological: return "brain.head.profile"
        case .motor:        return "figure.arms.open"
        case .spasticity:   return "arrow.trianglehead.2.clockwise.rotate.90"
        case .balanceGait:  return "figure.walk"
        case .upperLimb:    return "hand.raised.fill"
        case .adl:          return "house.fill"
        case .cognition:    return "lightbulb.fill"
        case .pain:         return "waveform.path.ecg"
        case .qol:          return "heart.fill"
        }
    }

    var color: DomainColor {
        switch self {
        case .neurological: return .red
        case .motor:        return .orange
        case .spasticity:   return .pink
        case .balanceGait:  return .green
        case .upperLimb:    return .blue
        case .adl:          return .teal
        case .cognition:    return .purple
        case .pain:         return .yellow
        case .qol:          return .cyan
        }
    }
}

enum DomainColor: String {
    case red, orange, pink, green, blue, teal, purple, yellow, cyan
}

// MARK: - AssessmentType

enum AssessmentType: String, CaseIterable, Identifiable, Codable {
    // 神経学的評価
    case nihss          = "NIHSS"
    case jcs            = "JCS（Japan Coma Scale）"
    case gcs            = "GCS（Glasgow Coma Scale）"

    // 運動機能・麻痺
    case brunnstrom     = "Brunnstrom Stage"
    case fuglMeyerUpper = "Fugl-Meyer（上肢）"
    case fuglMeyerLower = "Fugl-Meyer（下肢）"

    // 痙縮・筋緊張
    case mas            = "Modified Ashworth Scale"

    // バランス・歩行
    case bergBalance    = "Berg Balance Scale"
    case tug            = "TUG Test"
    case tenMeterWalk   = "10m歩行テスト"
    case sixMWT         = "6分間歩行テスト"
    case fac            = "FAC（歩行自立度）"

    // 上肢機能・巧緻性
    case nhpt           = "9穴ペグテスト（NHPT）"
    case bbt            = "Box and Block Test（BBT）"

    // ADL
    case fim            = "FIM"
    case barthelIndex   = "Barthel Index"

    // 高次脳機能
    case mmse           = "MMSE"
    case moca           = "MoCA"
    case cbs            = "CBS（半側空間無視）"

    // 疼痛
    case vasNrs         = "VAS / NRS"

    // QOL
    case sis            = "SIS（脳卒中影響スケール）"

    var id: String { rawValue }

    var domain: StrokeDomain {
        switch self {
        case .nihss, .jcs, .gcs:                       return .neurological
        case .brunnstrom, .fuglMeyerUpper, .fuglMeyerLower: return .motor
        case .mas:                                     return .spasticity
        case .bergBalance, .tug, .tenMeterWalk, .sixMWT, .fac: return .balanceGait
        case .nhpt, .bbt:                              return .upperLimb
        case .fim, .barthelIndex:                      return .adl
        case .mmse, .moca, .cbs:                       return .cognition
        case .vasNrs:                                  return .pain
        case .sis:                                     return .qol
        }
    }

    var purpose: String {
        switch self {
        case .nihss:          return "脳卒中神経学的重症度の定量的評価"
        case .jcs:            return "意識障害レベルの評価（国内標準）"
        case .gcs:            return "意識障害レベルの評価（国際標準）"
        case .brunnstrom:     return "上肢・手・下肢の回復ステージ評価"
        case .fuglMeyerUpper: return "上肢運動機能・感覚・協調性の定量評価"
        case .fuglMeyerLower: return "下肢運動機能・感覚・協調性の定量評価"
        case .mas:            return "痙縮（筋緊張亢進）の重症度評価"
        case .bergBalance:    return "立位・動的バランス能力の評価"
        case .tug:            return "移動能力・転倒リスクの評価"
        case .tenMeterWalk:   return "歩行速度（m/s）の計測"
        case .sixMWT:         return "歩行持久力・有酸素能力の評価"
        case .fac:            return "歩行自立度の簡便な分類"
        case .nhpt:           return "手指巧緻性・上肢協調性の評価"
        case .bbt:            return "上肢把持機能・移動速度の評価"
        case .fim:            return "ADL自立度・介護量の包括的評価"
        case .barthelIndex:   return "ADL自立度の評価（10項目）"
        case .mmse:           return "認知機能スクリーニング（30点）"
        case .moca:           return "軽度認知障害（MCI）のスクリーニング"
        case .cbs:            return "半側空間無視の日常生活への影響評価"
        case .vasNrs:         return "疼痛強度の主観的評価"
        case .sis:            return "脳卒中後のQOLと機能的アウトカムの評価"
        }
    }

    var maxScore: Int? {
        switch self {
        case .nihss:          return 42
        case .jcs:            return nil
        case .gcs:            return 15
        case .brunnstrom:     return nil
        case .fuglMeyerUpper: return 66
        case .fuglMeyerLower: return 34
        case .mas:            return nil
        case .bergBalance:    return 56
        case .tug:            return nil
        case .tenMeterWalk:   return nil
        case .sixMWT:         return nil
        case .fac:            return 5
        case .nhpt:           return nil
        case .bbt:            return nil
        case .fim:            return 126
        case .barthelIndex:   return 100
        case .mmse:           return 30
        case .moca:           return 30
        case .cbs:            return 30
        case .vasNrs:         return 10
        case .sis:            return nil
        }
    }

    var iconName: String { domain.iconName }

    var hasScoringUI: Bool {
        switch self {
        case .nihss, .gcs, .jcs, .brunnstrom, .fuglMeyerUpper, .fuglMeyerLower,
             .mas, .bergBalance, .barthelIndex, .fim, .mmse, .cbs, .fac:
            return true
        default:
            return false
        }
    }

    var hasTimer: Bool {
        switch self {
        case .tug, .tenMeterWalk, .sixMWT, .nhpt: return true
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
        case .nihss:          return nihssItems
        case .gcs:            return gcsItems
        case .jcs:            return jcsItems
        case .bergBalance:    return bergBalanceItems
        case .fuglMeyerUpper: return fuglMeyerUpperItems
        case .fuglMeyerLower: return fuglMeyerLowerItems
        case .mas:            return masItems
        case .barthelIndex:   return barthelItems
        case .mmse:           return mmseItems
        case .cbs:            return cbsItems
        case .fac:            return facItems
        case .brunnstrom:     return []   // 専用UI
        default:              return []
        }
    }

    var interpretation: [(range: ClosedRange<Int>, label: String, description: String)] {
        switch self {
        case .nihss:
            return [
                (0...0,   "正常",   "神経学的欠損なし"),
                (1...4,   "軽症",   "軽度の神経学的欠損"),
                (5...15,  "中等症", "中等度の神経学的欠損"),
                (16...20, "重症",   "重度の神経学的欠損"),
                (21...42, "最重症", "非常に重度の神経学的欠損")
            ]
        case .gcs:
            return [
                (15...15, "意識清明", "正常"),
                (13...14, "軽症",   "軽度意識障害"),
                (9...12,  "中等症", "中等度意識障害"),
                (3...8,   "重症",   "重度意識障害・昏睡")
            ]
        case .bergBalance:
            return [
                (0...20,  "高転倒リスク",   "車椅子依存レベル"),
                (21...40, "中等度転倒リスク","介助歩行レベル"),
                (41...56, "低転倒リスク",   "独立歩行可能レベル")
            ]
        case .fuglMeyerUpper:
            return [
                (0...19,  "重症",       "弛緩性麻痺〜最小限の随意運動"),
                (20...35, "著明な障害", "一部の随意運動あり"),
                (36...55, "中等度障害", "協調性に問題あり"),
                (56...66, "軽度〜正常", "ほぼ正常な協調運動")
            ]
        case .fuglMeyerLower:
            return [
                (0...9,   "重症",       "弛緩性麻痺"),
                (10...19, "著明な障害", "最小限の随意運動"),
                (20...28, "中等度障害", "協調性に問題あり"),
                (29...34, "軽度〜正常", "ほぼ正常な協調運動")
            ]
        case .barthelIndex:
            return [
                (0...20,  "完全依存",   "全介助"),
                (21...60, "重度依存",   "大部分介助"),
                (61...90, "中等度依存", "部分介助"),
                (91...99, "軽度依存",   "最小限介助"),
                (100...100,"完全自立",  "介助不要")
            ]
        case .mmse:
            return [
                (0...17,  "重度認知障害",  "日常生活に著しい支障"),
                (18...23, "中等度認知障害","介助・監視が必要"),
                (24...26, "軽度認知障害",  "精査・経過観察が必要"),
                (27...30, "正常範囲",     "認知機能正常")
            ]
        case .moca:
            return [
                (0...17,  "重度",   "高度な認知機能低下"),
                (18...21, "中等度", "中等度認知機能低下"),
                (22...25, "軽度",   "軽度認知障害（MCI）疑い"),
                (26...30, "正常",   "認知機能正常（≥26点）")
            ]
        case .cbs:
            return [
                (0...0,   "無視なし", "日常生活での無視を認めない"),
                (1...10,  "軽度",    "軽度の半側空間無視"),
                (11...20, "中等度",  "中等度の半側空間無視"),
                (21...30, "重度",    "重度の半側空間無視")
            ]
        case .fim:
            return [
                (18...36,   "完全介助",   "ほとんど全項目で介助"),
                (37...72,   "中等度障害", "大部分の項目で介助"),
                (73...107,  "軽度障害",   "一部で補助具または介助"),
                (108...126, "完全自立",   "全項目で自立")
            ]
        default:
            return []
        }
    }
}

// MARK: - NIHSS Items

private let nihssItems: [AssessmentItem] = [
    AssessmentItem(number: 1,  name: "意識レベル", description: "刺激に対する反応", scoringCriteria: [
        .init(score: 0, description: "完全覚醒"),
        .init(score: 1, description: "軽度の刺激で覚醒"),
        .init(score: 2, description: "繰り返し刺激で覚醒"),
        .init(score: 3, description: "反射のみ、または無反応")]),
    AssessmentItem(number: 2,  name: "意識レベル（質問）", description: "月と年齢を答えさせる", scoringCriteria: [
        .init(score: 0, description: "両問とも正解"),
        .init(score: 1, description: "1問のみ正解"),
        .init(score: 2, description: "両問とも不正解")]),
    AssessmentItem(number: 3,  name: "意識レベル（従命）", description: "開閉眼・手の開閉を命令", scoringCriteria: [
        .init(score: 0, description: "両命令とも従う"),
        .init(score: 1, description: "1命令のみ従う"),
        .init(score: 2, description: "どちらも従えない")]),
    AssessmentItem(number: 4,  name: "眼球運動", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "部分的麻痺"),
        .init(score: 2, description: "完全麻痺または共同偏視")]),
    AssessmentItem(number: 5,  name: "視野", scoringCriteria: [
        .init(score: 0, description: "視野欠損なし"),
        .init(score: 1, description: "部分的半盲"),
        .init(score: 2, description: "完全半盲"),
        .init(score: 3, description: "両側性盲または皮質盲")]),
    AssessmentItem(number: 6,  name: "顔面麻痺", description: "歯を見せる・目を閉じる", scoringCriteria: [
        .init(score: 0, description: "正常な対称的運動"),
        .init(score: 1, description: "軽度の麻痺"),
        .init(score: 2, description: "部分的麻痺（下顔面）"),
        .init(score: 3, description: "完全麻痺")]),
    AssessmentItem(number: 7,  name: "上肢の運動（右）", description: "90°挙上10秒保持", scoringCriteria: [
        .init(score: 0, description: "10秒間保持可能"),
        .init(score: 1, description: "10秒以内に下降・落下しない"),
        .init(score: 2, description: "重力に抗するが保持不可"),
        .init(score: 3, description: "重力に抗せず下降"),
        .init(score: 4, description: "全く動かない")]),
    AssessmentItem(number: 8,  name: "上肢の運動（左）", description: "90°挙上10秒保持", scoringCriteria: [
        .init(score: 0, description: "10秒間保持可能"),
        .init(score: 1, description: "10秒以内に下降・落下しない"),
        .init(score: 2, description: "重力に抗するが保持不可"),
        .init(score: 3, description: "重力に抗せず下降"),
        .init(score: 4, description: "全く動かない")]),
    AssessmentItem(number: 9,  name: "下肢の運動（右）", description: "30°挙上5秒保持", scoringCriteria: [
        .init(score: 0, description: "5秒間保持可能"),
        .init(score: 1, description: "5秒以内に下降・落下しない"),
        .init(score: 2, description: "重力に抗するが保持不可"),
        .init(score: 3, description: "重力に抗せず下降"),
        .init(score: 4, description: "全く動かない")]),
    AssessmentItem(number: 10, name: "下肢の運動（左）", description: "30°挙上5秒保持", scoringCriteria: [
        .init(score: 0, description: "5秒間保持可能"),
        .init(score: 1, description: "5秒以内に下降・落下しない"),
        .init(score: 2, description: "重力に抗するが保持不可"),
        .init(score: 3, description: "重力に抗せず下降"),
        .init(score: 4, description: "全く動かない")]),
    AssessmentItem(number: 11, name: "運動失調", description: "指鼻指試験・踵膝試験", scoringCriteria: [
        .init(score: 0, description: "なし"),
        .init(score: 1, description: "一側肢に失調"),
        .init(score: 2, description: "両側に失調")]),
    AssessmentItem(number: 12, name: "感覚", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "軽度〜中等度の感覚低下"),
        .init(score: 2, description: "重度〜完全な感覚消失")]),
    AssessmentItem(number: 13, name: "言語（失語）", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "軽度〜中等度の失語"),
        .init(score: 2, description: "重度の失語"),
        .init(score: 3, description: "無言または全失語")]),
    AssessmentItem(number: 14, name: "構音障害", scoringCriteria: [
        .init(score: 0, description: "正常"),
        .init(score: 1, description: "軽度〜中等度"),
        .init(score: 2, description: "重度または無言")]),
    AssessmentItem(number: 15, name: "消去・無視", scoringCriteria: [
        .init(score: 0, description: "異常なし"),
        .init(score: 1, description: "一側の消去"),
        .init(score: 2, description: "重度の半側無視")])
]

// MARK: - GCS Items

private let gcsItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "開眼（E）", description: "Eye Opening", scoringCriteria: [
        .init(score: 4, description: "自然に開眼"),
        .init(score: 3, description: "呼びかけで開眼"),
        .init(score: 2, description: "痛み刺激で開眼"),
        .init(score: 1, description: "開眼しない")]),
    AssessmentItem(number: 2, name: "言語反応（V）", description: "Verbal Response", scoringCriteria: [
        .init(score: 5, description: "見当識あり（正確な会話）"),
        .init(score: 4, description: "混乱した会話"),
        .init(score: 3, description: "不適切な言葉"),
        .init(score: 2, description: "理解不明な音声"),
        .init(score: 1, description: "なし")]),
    AssessmentItem(number: 3, name: "運動反応（M）", description: "Motor Response", scoringCriteria: [
        .init(score: 6, description: "命令に従う"),
        .init(score: 5, description: "痛みの場所を認識（逃避）"),
        .init(score: 4, description: "痛みから逃げる（屈曲逃避）"),
        .init(score: 3, description: "異常屈曲（除皮質硬直）"),
        .init(score: 2, description: "異常伸展（除脳硬直）"),
        .init(score: 1, description: "なし")])
]

// MARK: - JCS Items

private let jcsItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "JCSスコア", description: "刺激なしで覚醒しているか確認してから評価", scoringCriteria: [
        .init(score: 0,   description: "【0】清明 — 意識清明"),
        .init(score: 1,   description: "【I-1】だいたい清明、少し変"),
        .init(score: 2,   description: "【I-2】見当識障害あり"),
        .init(score: 3,   description: "【I-3】自分の名前・生年月日が言えない"),
        .init(score: 10,  description: "【II-10】普通の呼びかけで容易に開眼"),
        .init(score: 20,  description: "【II-20】大きな声または体をゆさぶると開眼"),
        .init(score: 30,  description: "【II-30】痛み刺激と呼びかけを繰り返すと辛うじて開眼"),
        .init(score: 100, description: "【III-100】痛み刺激で払いのける動作"),
        .init(score: 200, description: "【III-200】痛み刺激で少し手足を動かす・顔をしかめる"),
        .init(score: 300, description: "【III-300】痛み刺激に全く反応しない")])
]

// MARK: - MAS Items

private let masItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "肩関節内外旋", scoringCriteria: masScale()),
    AssessmentItem(number: 2, name: "肘関節屈曲", scoringCriteria: masScale()),
    AssessmentItem(number: 3, name: "肘関節伸展", scoringCriteria: masScale()),
    AssessmentItem(number: 4, name: "前腕回内", scoringCriteria: masScale()),
    AssessmentItem(number: 5, name: "前腕回外", scoringCriteria: masScale()),
    AssessmentItem(number: 6, name: "手関節背屈", scoringCriteria: masScale()),
    AssessmentItem(number: 7, name: "手指屈曲", scoringCriteria: masScale()),
    AssessmentItem(number: 8, name: "股関節内転筋", scoringCriteria: masScale()),
    AssessmentItem(number: 9, name: "膝関節伸展", scoringCriteria: masScale()),
    AssessmentItem(number: 10, name: "足関節底屈（痙縮）", scoringCriteria: masScale())
]

private func masScale() -> [ScoringCriterion] {
    [
        .init(score: 0, description: "0: 筋緊張の亢進なし"),
        .init(score: 1, description: "1: 軽度の筋緊張亢進（引っかかり感）"),
        .init(score: 2, description: "1+: 軽度の筋緊張亢進（引っかかりの後に軽微な抵抗）"),
        .init(score: 3, description: "2: 全可動域で抵抗あるが可動域制限なし"),
        .init(score: 4, description: "3: 可動域制限を伴う著明な筋緊張亢進"),
        .init(score: 5, description: "4: 強直（屈曲または伸展位で固定）")
    ]
}

// MARK: - Berg Balance Scale Items

private let bergBalanceItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "坐位から立位", scoringCriteria: berg4to0([
        "手を使わずに安全に立ち上がれる",
        "手を使って自力で立てる",
        "数回試みた後に手を使って立てる",
        "立つための最小限の介助が必要",
        "立つために中等度〜最大限の介助が必要"])),
    AssessmentItem(number: 2, name: "立位保持（2分）", scoringCriteria: berg4to0([
        "2分間安全に立っていられる",
        "監視下で2分間立っていられる",
        "30秒間立っていられる",
        "数回の試みで30秒間立っていられる",
        "介助なしに30秒間立っていられない"])),
    AssessmentItem(number: 3, name: "坐位保持（背もたれなし2分）", scoringCriteria: berg4to0([
        "2分間安全に坐っていられる",
        "監視下で2分間坐っていられる",
        "30秒間坐っていられる",
        "10秒間坐っていられる",
        "支持なしに10秒間坐っていられない"])),
    AssessmentItem(number: 4, name: "立位から坐位", scoringCriteria: berg4to0([
        "手をほとんど使わずに安全に坐れる",
        "手を使って坐降を制御する",
        "下肢後面をチェアに接触させて坐降を制御",
        "自力で坐れるが坐降コントロールができない",
        "坐るために介助が必要"])),
    AssessmentItem(number: 5, name: "移乗動作", scoringCriteria: berg4to0([
        "手をほとんど使わずに安全に移乗できる",
        "手を使って安全に移乗できる",
        "言語指示または監視が必要",
        "1人の介助者が必要",
        "2人の介助者または監視が必要"])),
    AssessmentItem(number: 6, name: "閉眼立位（10秒）", scoringCriteria: berg4to0([
        "10秒間安全に立っていられる",
        "監視下で10秒間立っていられる",
        "3秒間立っていられる",
        "3秒間目を閉じておけないが安全に立っている",
        "転倒防止のための介助が必要"])),
    AssessmentItem(number: 7, name: "閉脚立位（1分）", scoringCriteria: berg4to0([
        "1分間安全に立っていられる",
        "監視下で1分間立っていられる",
        "30秒間立っていられる",
        "15秒間立っていられる",
        "介助なしに立位や15秒間の保持ができない"])),
    AssessmentItem(number: 8, name: "立位前方リーチ", description: "前方へのリーチ距離", scoringCriteria: berg4to0([
        "25cm以上のリーチが可能",
        "12cm以上のリーチが可能",
        "5cm以上のリーチが可能",
        "リーチするが監視が必要",
        "バランス保持のために介助が必要"])),
    AssessmentItem(number: 9, name: "立位での床からの物拾い", scoringCriteria: berg4to0([
        "安全かつ容易に拾える",
        "監視下で拾える",
        "2〜5cm以内に近づけないが安定",
        "試みるが監視が必要",
        "試みることができない、または介助が必要"])),
    AssessmentItem(number: 10, name: "立位での振り返り（左右）", scoringCriteria: berg4to0([
        "両側とも安全に後方を見られる",
        "一側のみ安全に後方を見られる",
        "横を向くが安全",
        "振り返る際に監視が必要",
        "バランスを保つための介助が必要"])),
    AssessmentItem(number: 11, name: "360°回転", scoringCriteria: berg4to0([
        "4秒以内に安全に360°回転できる",
        "一側4秒以内のみ可能",
        "安全だが遅い",
        "厳重な監視または言語指示が必要",
        "回転時に介助が必要"])),
    AssessmentItem(number: 12, name: "踏み台昇降（4回）", scoringCriteria: berg4to0([
        "20秒以内に安全に4回実施できる",
        "20秒以内に4回できるが監視が必要",
        "監視下で4回できるが20秒超",
        "最小限の介助で2回以上できる",
        "転倒防止のために介助が必要"])),
    AssessmentItem(number: 13, name: "タンデム立位", scoringCriteria: berg4to0([
        "独立してタンデム位をとれ30秒間保持",
        "独立して継ぎ足位をとれ30秒間保持",
        "独立して足を前に出せ30秒間保持",
        "歩を前に出すのに介助が必要だが15秒保持",
        "立位中バランスを失う"])),
    AssessmentItem(number: 14, name: "片脚立位", scoringCriteria: berg4to0([
        "10秒以上独立して立っていられる",
        "5〜10秒独立して立っていられる",
        "3秒以上独立して立っていられる",
        "片脚立位を試みるが3秒未満",
        "試みることができず介助が必要"]))
]

private func berg4to0(_ descs: [String]) -> [ScoringCriterion] {
    zip((0...4).reversed(), descs).map { .init(score: $0, description: $1) }
}

// MARK: - Fugl-Meyer Upper

private let fuglMeyerUpperItems: [AssessmentItem] = [
    AssessmentItem(number: 1,  name: "反射活動（上腕二頭筋）", scoringCriteria: fm02()),
    AssessmentItem(number: 2,  name: "反射活動（上腕三頭筋）", scoringCriteria: fm02()),
    AssessmentItem(number: 3,  name: "屈筋共同運動（肩挙上）", scoringCriteria: fm012()),
    AssessmentItem(number: 4,  name: "屈筋共同運動（肩後退）", scoringCriteria: fm012()),
    AssessmentItem(number: 5,  name: "屈筋共同運動（肩外転90°）", scoringCriteria: fm012()),
    AssessmentItem(number: 6,  name: "屈筋共同運動（肩外旋）", scoringCriteria: fm012()),
    AssessmentItem(number: 7,  name: "屈筋共同運動（肘屈曲）", scoringCriteria: fm012()),
    AssessmentItem(number: 8,  name: "屈筋共同運動（前腕回外）", scoringCriteria: fm012()),
    AssessmentItem(number: 9,  name: "伸筋共同運動（肩内転/内旋）", scoringCriteria: fm012()),
    AssessmentItem(number: 10, name: "伸筋共同運動（肘伸展）", scoringCriteria: fm012()),
    AssessmentItem(number: 11, name: "伸筋共同運動（前腕回内）", scoringCriteria: fm012()),
    AssessmentItem(number: 12, name: "共同運動外（手を腰へ）", scoringCriteria: fm012()),
    AssessmentItem(number: 13, name: "共同運動外（肩屈曲90°肘伸展）", scoringCriteria: fm012()),
    AssessmentItem(number: 14, name: "共同運動外（前腕回内外）", scoringCriteria: fm012()),
    AssessmentItem(number: 15, name: "手関節安定性（肘屈曲位）", scoringCriteria: fm012()),
    AssessmentItem(number: 16, name: "手関節屈伸（肘屈曲位）", scoringCriteria: fm012()),
    AssessmentItem(number: 17, name: "手関節安定性（肘伸展位）", scoringCriteria: fm012()),
    AssessmentItem(number: 18, name: "手関節屈伸（肘伸展位）", scoringCriteria: fm012()),
    AssessmentItem(number: 19, name: "手関節円運動", scoringCriteria: fm012()),
    AssessmentItem(number: 20, name: "手指集団屈曲", scoringCriteria: fm012()),
    AssessmentItem(number: 21, name: "手指集団伸展", scoringCriteria: fm012()),
    AssessmentItem(number: 22, name: "手指把握（MP伸展/IP屈曲）", scoringCriteria: fm012()),
    AssessmentItem(number: 23, name: "手指把握（母指対立）", scoringCriteria: fm012()),
    AssessmentItem(number: 24, name: "手指把握（ピンチ）", scoringCriteria: fm012()),
    AssessmentItem(number: 25, name: "手指把握（円柱把握）", scoringCriteria: fm012()),
    AssessmentItem(number: 26, name: "手指把握（球状把握）", scoringCriteria: fm012()),
    AssessmentItem(number: 27, name: "上肢協調性（振戦）", scoringCriteria: fm012()),
    AssessmentItem(number: 28, name: "上肢協調性（測定障害）", scoringCriteria: fm012()),
    AssessmentItem(number: 29, name: "上肢協調性（速度）", scoringCriteria: fm012())
]

// MARK: - Fugl-Meyer Lower

private let fuglMeyerLowerItems: [AssessmentItem] = [
    AssessmentItem(number: 1,  name: "反射活動（アキレス腱）", scoringCriteria: fm02()),
    AssessmentItem(number: 2,  name: "反射活動（膝蓋腱）", scoringCriteria: fm02()),
    AssessmentItem(number: 3,  name: "屈筋共同運動（股屈曲）", scoringCriteria: fm012()),
    AssessmentItem(number: 4,  name: "屈筋共同運動（膝屈曲）", scoringCriteria: fm012()),
    AssessmentItem(number: 5,  name: "屈筋共同運動（足背屈）", scoringCriteria: fm012()),
    AssessmentItem(number: 6,  name: "伸筋共同運動（股伸展）", scoringCriteria: fm012()),
    AssessmentItem(number: 7,  name: "伸筋共同運動（膝伸展）", scoringCriteria: fm012()),
    AssessmentItem(number: 8,  name: "伸筋共同運動（足底屈）", scoringCriteria: fm012()),
    AssessmentItem(number: 9,  name: "共同運動外（坐位膝屈曲）", scoringCriteria: fm012()),
    AssessmentItem(number: 10, name: "共同運動外（坐位足背屈）", scoringCriteria: fm012()),
    AssessmentItem(number: 11, name: "共同運動外（立位膝屈曲）", scoringCriteria: fm012()),
    AssessmentItem(number: 12, name: "共同運動外（立位足背屈）", scoringCriteria: fm012()),
    AssessmentItem(number: 13, name: "下肢協調性（振戦）", scoringCriteria: fm012()),
    AssessmentItem(number: 14, name: "下肢協調性（測定障害）", scoringCriteria: fm012()),
    AssessmentItem(number: 15, name: "下肢協調性（速度）", scoringCriteria: fm012())
]

private func fm02() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 反射活動なし"),
     .init(score: 2, description: "2: 反射活動あり")]
}

private func fm012() -> [ScoringCriterion] {
    [.init(score: 0, description: "0: 全く動かない"),
     .init(score: 1, description: "1: 部分的に動く"),
     .init(score: 2, description: "2: 完全に動く")]
}

// MARK: - Barthel Index Items

private let barthelItems: [AssessmentItem] = [
    AssessmentItem(number: 1,  name: "食事", scoringCriteria: [
        .init(score: 0,  description: "全介助"),
        .init(score: 5,  description: "部分介助（食物を切る等）"),
        .init(score: 10, description: "自立（補助具使用可）")]),
    AssessmentItem(number: 2,  name: "椅子・ベッド移乗", scoringCriteria: [
        .init(score: 0,  description: "全介助（坐位不可）"),
        .init(score: 5,  description: "多大な介助が必要"),
        .init(score: 10, description: "最小限の介助または監視"),
        .init(score: 15, description: "自立")]),
    AssessmentItem(number: 3,  name: "整容", description: "洗顔・歯磨き・ひげ剃り・整髪", scoringCriteria: [
        .init(score: 0, description: "介助が必要"),
        .init(score: 5, description: "自立")]),
    AssessmentItem(number: 4,  name: "トイレ動作", scoringCriteria: [
        .init(score: 0,  description: "全介助"),
        .init(score: 5,  description: "部分介助"),
        .init(score: 10, description: "自立（補助具使用可）")]),
    AssessmentItem(number: 5,  name: "入浴", scoringCriteria: [
        .init(score: 0, description: "介助が必要"),
        .init(score: 5, description: "自立（浴槽・シャワー）")]),
    AssessmentItem(number: 6,  name: "歩行", scoringCriteria: [
        .init(score: 0,  description: "歩行不能"),
        .init(score: 5,  description: "車椅子で45m以上移動自立"),
        .init(score: 10, description: "1人の介助で45m以上歩行"),
        .init(score: 15, description: "45m以上自立歩行（補助具可）")]),
    AssessmentItem(number: 7,  name: "階段昇降", scoringCriteria: [
        .init(score: 0,  description: "不可"),
        .init(score: 5,  description: "介助または監視が必要"),
        .init(score: 10, description: "自立（補助具可）")]),
    AssessmentItem(number: 8,  name: "更衣", scoringCriteria: [
        .init(score: 0,  description: "全介助"),
        .init(score: 5,  description: "部分介助（半分以上自分で）"),
        .init(score: 10, description: "自立（補助具・特殊衣類可）")]),
    AssessmentItem(number: 9,  name: "排便コントロール", scoringCriteria: [
        .init(score: 0,  description: "失禁または浣腸が必要"),
        .init(score: 5,  description: "時々失禁あり"),
        .init(score: 10, description: "完全自立")]),
    AssessmentItem(number: 10, name: "排尿コントロール", scoringCriteria: [
        .init(score: 0,  description: "失禁またはカテーテル管理"),
        .init(score: 5,  description: "時々失禁あり"),
        .init(score: 10, description: "完全自立")])
]

// MARK: - MMSE Items

private let mmseItems: [AssessmentItem] = [
    AssessmentItem(number: 1,  name: "時間の見当識", description: "年・季節・月・日・曜日（各1点）", scoringCriteria: [
        .init(score: 0, description: "0点（全不正解）"),
        .init(score: 1, description: "1点"), .init(score: 2, description: "2点"),
        .init(score: 3, description: "3点"), .init(score: 4, description: "4点"),
        .init(score: 5, description: "5点（全正解）")]),
    AssessmentItem(number: 2,  name: "場所の見当識", description: "国・県・市・病院・病棟（各1点）", scoringCriteria: [
        .init(score: 0, description: "0点"), .init(score: 1, description: "1点"),
        .init(score: 2, description: "2点"), .init(score: 3, description: "3点"),
        .init(score: 4, description: "4点"), .init(score: 5, description: "5点（全正解）")]),
    AssessmentItem(number: 3,  name: "即時記憶", description: "3つの単語を繰り返す（各1点）", scoringCriteria: [
        .init(score: 0, description: "0点"),
        .init(score: 1, description: "1点"), .init(score: 2, description: "2点"),
        .init(score: 3, description: "3点（全正解）")]),
    AssessmentItem(number: 4,  name: "注意・計算（引き算）", description: "100-7を5回繰り返す（各1点）", scoringCriteria: [
        .init(score: 0, description: "0点"), .init(score: 1, description: "1点"),
        .init(score: 2, description: "2点"), .init(score: 3, description: "3点"),
        .init(score: 4, description: "4点"), .init(score: 5, description: "5点（全正解）")]),
    AssessmentItem(number: 5,  name: "遅延再生", description: "3つの単語を再び言う（各1点）", scoringCriteria: [
        .init(score: 0, description: "0点"),
        .init(score: 1, description: "1点"), .init(score: 2, description: "2点"),
        .init(score: 3, description: "3点（全正解）")]),
    AssessmentItem(number: 6,  name: "物品呼称", description: "時計・鉛筆（各1点）", scoringCriteria: [
        .init(score: 0, description: "0点（両方不正解）"),
        .init(score: 1, description: "1点（どちらか正解）"),
        .init(score: 2, description: "2点（両方正解）")]),
    AssessmentItem(number: 7,  name: "復唱", description: "「桜・猫・電車」（または「みぎ・ひだり・まるさんかくしかく」）", scoringCriteria: [
        .init(score: 0, description: "不正確"),
        .init(score: 1, description: "正確に復唱できる")]),
    AssessmentItem(number: 8,  name: "3段階命令", description: "「右手に紙を持ち、半分に折り、膝の上に置いてください」", scoringCriteria: [
        .init(score: 0, description: "0段階"),
        .init(score: 1, description: "1段階"),
        .init(score: 2, description: "2段階"),
        .init(score: 3, description: "3段階全て正確")]),
    AssessmentItem(number: 9,  name: "書字命令読解", description: "「目を閉じてください」と書いた紙を読んで実行", scoringCriteria: [
        .init(score: 0, description: "実行できない"),
        .init(score: 1, description: "正確に実行できる")]),
    AssessmentItem(number: 10, name: "書字", description: "自発的に文章を書く（主語・述語を含む）", scoringCriteria: [
        .init(score: 0, description: "書けない・意味をなさない"),
        .init(score: 1, description: "意味のある文章を書ける")]),
    AssessmentItem(number: 11, name: "図形模写", description: "重なり合った五角形を模写する", scoringCriteria: [
        .init(score: 0, description: "正確に模写できない"),
        .init(score: 1, description: "正確に模写できる")])
]

// MARK: - CBS Items (Catherine Bergego Scale)

private let cbsItems: [AssessmentItem] = [
    AssessmentItem(number: 1,  name: "口・顔・歯の清潔", description: "患側の口・顔・歯の清潔を忘れる", scoringCriteria: cbsScale()),
    AssessmentItem(number: 2,  name: "更衣", description: "患側の更衣を忘れる", scoringCriteria: cbsScale()),
    AssessmentItem(number: 3,  name: "食事", description: "患側のトレイ上の食物を無視する", scoringCriteria: cbsScale()),
    AssessmentItem(number: 4,  name: "テーブルの整頓", description: "患側のテーブルを整頓しない", scoringCriteria: cbsScale()),
    AssessmentItem(number: 5,  name: "会話中の注意方向", description: "患側の話し相手に注意を向けない", scoringCriteria: cbsScale()),
    AssessmentItem(number: 6,  name: "テレビや映画の視聴", description: "患側の画面を無視する", scoringCriteria: cbsScale()),
    AssessmentItem(number: 7,  name: "歩行中の障害物", description: "患側の障害物を無視してぶつかる", scoringCriteria: cbsScale()),
    AssessmentItem(number: 8,  name: "移動方向", description: "患側へ曲がる際に困難がある", scoringCriteria: cbsScale()),
    AssessmentItem(number: 9,  name: "身体の無視", description: "患側の身体部位を無視する", scoringCriteria: cbsScale()),
    AssessmentItem(number: 10, name: "個人的な用品", description: "患側に置いた用品を探せない", scoringCriteria: cbsScale())
]

private func cbsScale() -> [ScoringCriterion] {
    [
        .init(score: 0, description: "0: 全く無視なし"),
        .init(score: 1, description: "1: 軽度（偶発的・わずか）"),
        .init(score: 2, description: "2: 中等度（頻繁に観察）"),
        .init(score: 3, description: "3: 重度（常時観察・重大な障害）")
    ]
}

// MARK: - FAC Items

private let facItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "歩行自立度分類", description: "Functional Ambulation Category", scoringCriteria: [
        .init(score: 0, description: "0: 非歩行 — 歩行不能・全介助"),
        .init(score: 1, description: "1: 依存歩行（重度） — 連続的な介助が必要"),
        .init(score: 2, description: "2: 依存歩行（軽度） — 継続的な接触介助は不要だが監視・少量の介助必要"),
        .init(score: 3, description: "3: 依存歩行（監視） — 監視または言語的誘導が必要"),
        .init(score: 4, description: "4: 平地自立 — 平坦な地面での歩行は自立、段差・斜面は介助"),
        .init(score: 5, description: "5: 完全自立 — あらゆる地面・環境での歩行が自立")])
]
