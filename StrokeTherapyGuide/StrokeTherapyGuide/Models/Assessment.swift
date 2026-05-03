import Foundation

enum AssessmentType: String, CaseIterable, Identifiable, Codable {
    case nihss = "NIHSS"
    case bergBalance = "Berg Balance Scale"
    case fuglMeyerUpper = "Fugl-Meyer（上肢）"
    case fuglMeyerLower = "Fugl-Meyer（下肢）"
    case tenMeterWalk = "10m歩行テスト"
    case tug = "Timed Up and Go Test"
    case fim = "FIM"

    var id: String { rawValue }

    var abbreviation: String { rawValue }

    var purpose: String {
        switch self {
        case .nihss: return "脳卒中重症度・神経学的欠損の評価"
        case .bergBalance: return "立位・動的バランス能力の評価"
        case .fuglMeyerUpper: return "上肢運動機能・感覚の回復度評価"
        case .fuglMeyerLower: return "下肢運動機能・感覚の回復度評価"
        case .tenMeterWalk: return "歩行速度・歩行能力の評価"
        case .tug: return "移動能力・転倒リスクの評価"
        case .fim: return "ADL自立度・介護負担の評価"
        }
    }

    var maxScore: Int {
        switch self {
        case .nihss: return 42
        case .bergBalance: return 56
        case .fuglMeyerUpper: return 66
        case .fuglMeyerLower: return 34
        case .tenMeterWalk: return 0
        case .tug: return 0
        case .fim: return 126
        }
    }

    var iconName: String {
        switch self {
        case .nihss: return "brain.head.profile"
        case .bergBalance: return "figure.stand"
        case .fuglMeyerUpper: return "hand.raised.fill"
        case .fuglMeyerLower: return "figure.walk"
        case .tenMeterWalk: return "stopwatch.fill"
        case .tug: return "timer"
        case .fim: return "checkmark.circle.fill"
        }
    }
}

struct AssessmentItem: Identifiable, Codable {
    let id: UUID
    let number: Int
    let name: String
    let description: String
    let scoringCriteria: [ScoringCriterion]
    var selectedScore: Int?

    init(id: UUID = UUID(), number: Int, name: String, description: String,
         scoringCriteria: [ScoringCriterion], selectedScore: Int? = nil) {
        self.id = id
        self.number = number
        self.name = name
        self.description = description
        self.scoringCriteria = scoringCriteria
        self.selectedScore = selectedScore
    }
}

struct ScoringCriterion: Identifiable, Codable {
    let id: UUID
    let score: Int
    let description: String

    init(id: UUID = UUID(), score: Int, description: String) {
        self.id = id
        self.score = score
        self.description = description
    }
}

extension AssessmentType {
    var items: [AssessmentItem] {
        switch self {
        case .nihss: return nihssItems
        case .bergBalance: return bergBalanceItems
        case .fuglMeyerUpper: return fuglMeyerUpperItems
        case .fuglMeyerLower: return fuglMeyerLowerItems
        default: return []
        }
    }

    var interpretation: [(range: ClosedRange<Int>, label: String, description: String)] {
        switch self {
        case .nihss:
            return [
                (0...0, "正常", "神経学的欠損なし"),
                (1...4, "軽症", "軽度の神経学的欠損"),
                (5...15, "中等症", "中等度の神経学的欠損"),
                (16...20, "重症", "重度の神経学的欠損"),
                (21...42, "最重症", "非常に重度の神経学的欠損")
            ]
        case .bergBalance:
            return [
                (0...20, "高転倒リスク", "車椅子依存レベル"),
                (21...40, "中等度転倒リスク", "介助歩行レベル"),
                (41...56, "低転倒リスク", "独立歩行可能レベル")
            ]
        case .fuglMeyerUpper:
            return [
                (0...19, "重症", "弛緩性麻痺〜軽度の随意運動"),
                (20...35, "著明な障害", "一部の随意運動あり"),
                (36...55, "中等度障害", "協調性に問題あり"),
                (56...66, "軽度障害〜正常", "ほぼ正常な協調運動")
            ]
        case .fuglMeyerLower:
            return [
                (0...9, "重症", "弛緩性麻痺"),
                (10...19, "著明な障害", "最小限の随意運動"),
                (20...28, "中等度障害", "協調性に問題あり"),
                (29...34, "軽度障害〜正常", "ほぼ正常な協調運動")
            ]
        default:
            return []
        }
    }
}

private let nihssItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "意識レベル", description: "患者の意識レベルを評価", scoringCriteria: [
        ScoringCriterion(score: 0, description: "完全覚醒"),
        ScoringCriterion(score: 1, description: "軽度の刺激で覚醒"),
        ScoringCriterion(score: 2, description: "繰り返し刺激で覚醒"),
        ScoringCriterion(score: 3, description: "反射のみ、または無反応")
    ]),
    AssessmentItem(number: 2, name: "意識レベル（質問）", description: "現在の月と年齢を答えさせる", scoringCriteria: [
        ScoringCriterion(score: 0, description: "両問とも正解"),
        ScoringCriterion(score: 1, description: "1問のみ正解"),
        ScoringCriterion(score: 2, description: "両問とも不正解")
    ]),
    AssessmentItem(number: 3, name: "意識レベル（従命）", description: "開眼・閉眼および手の開閉を命令", scoringCriteria: [
        ScoringCriterion(score: 0, description: "両命令とも従う"),
        ScoringCriterion(score: 1, description: "1命令のみ従う"),
        ScoringCriterion(score: 2, description: "どちらも従えない")
    ]),
    AssessmentItem(number: 4, name: "眼球運動", description: "水平眼球運動の評価", scoringCriteria: [
        ScoringCriterion(score: 0, description: "正常"),
        ScoringCriterion(score: 1, description: "部分的麻痺"),
        ScoringCriterion(score: 2, description: "完全麻痺または共同偏視")
    ]),
    AssessmentItem(number: 5, name: "視野", description: "対座法による視野検査", scoringCriteria: [
        ScoringCriterion(score: 0, description: "視野欠損なし"),
        ScoringCriterion(score: 1, description: "部分的半盲"),
        ScoringCriterion(score: 2, description: "完全半盲"),
        ScoringCriterion(score: 3, description: "両側性盲または皮質盲")
    ]),
    AssessmentItem(number: 6, name: "顔面麻痺", description: "歯を見せる・目を閉じる・眉を上げる動作", scoringCriteria: [
        ScoringCriterion(score: 0, description: "正常な対称的運動"),
        ScoringCriterion(score: 1, description: "軽度の麻痺（鼻唇溝の平坦化等）"),
        ScoringCriterion(score: 2, description: "部分的麻痺（下顔面の完全麻痺等）"),
        ScoringCriterion(score: 3, description: "完全麻痺（一側または両側）")
    ]),
    AssessmentItem(number: 7, name: "上肢の運動（右）", description: "上肢挙上保持テスト（90°または45°）", scoringCriteria: [
        ScoringCriterion(score: 0, description: "10秒間保持可能"),
        ScoringCriterion(score: 1, description: "10秒以内に下降するが落下しない"),
        ScoringCriterion(score: 2, description: "重力に抗するが保持不可"),
        ScoringCriterion(score: 3, description: "重力に抗せず下降"),
        ScoringCriterion(score: 4, description: "全く動かない")
    ]),
    AssessmentItem(number: 8, name: "上肢の運動（左）", description: "上肢挙上保持テスト（90°または45°）", scoringCriteria: [
        ScoringCriterion(score: 0, description: "10秒間保持可能"),
        ScoringCriterion(score: 1, description: "10秒以内に下降するが落下しない"),
        ScoringCriterion(score: 2, description: "重力に抗するが保持不可"),
        ScoringCriterion(score: 3, description: "重力に抗せず下降"),
        ScoringCriterion(score: 4, description: "全く動かない")
    ]),
    AssessmentItem(number: 9, name: "下肢の運動（右）", description: "下肢挙上保持テスト（30°）", scoringCriteria: [
        ScoringCriterion(score: 0, description: "5秒間保持可能"),
        ScoringCriterion(score: 1, description: "5秒以内に下降するが落下しない"),
        ScoringCriterion(score: 2, description: "重力に抗するが保持不可"),
        ScoringCriterion(score: 3, description: "重力に抗せず下降"),
        ScoringCriterion(score: 4, description: "全く動かない")
    ]),
    AssessmentItem(number: 10, name: "下肢の運動（左）", description: "下肢挙上保持テスト（30°）", scoringCriteria: [
        ScoringCriterion(score: 0, description: "5秒間保持可能"),
        ScoringCriterion(score: 1, description: "5秒以内に下降するが落下しない"),
        ScoringCriterion(score: 2, description: "重力に抗するが保持不可"),
        ScoringCriterion(score: 3, description: "重力に抗せず下降"),
        ScoringCriterion(score: 4, description: "全く動かない")
    ]),
    AssessmentItem(number: 11, name: "運動失調", description: "指鼻指試験・踵膝試験", scoringCriteria: [
        ScoringCriterion(score: 0, description: "なし"),
        ScoringCriterion(score: 1, description: "一側肢に失調"),
        ScoringCriterion(score: 2, description: "両側に失調")
    ]),
    AssessmentItem(number: 12, name: "感覚", description: "針刺激に対する感覚評価", scoringCriteria: [
        ScoringCriterion(score: 0, description: "正常"),
        ScoringCriterion(score: 1, description: "軽度〜中等度の感覚低下"),
        ScoringCriterion(score: 2, description: "重度〜完全な感覚消失")
    ]),
    AssessmentItem(number: 13, name: "言語（失語）", description: "物品命名・文章読み上げ・発話の評価", scoringCriteria: [
        ScoringCriterion(score: 0, description: "正常"),
        ScoringCriterion(score: 1, description: "軽度〜中等度の失語"),
        ScoringCriterion(score: 2, description: "重度の失語"),
        ScoringCriterion(score: 3, description: "無言または全失語")
    ]),
    AssessmentItem(number: 14, name: "構音障害", description: "発話の明瞭度評価", scoringCriteria: [
        ScoringCriterion(score: 0, description: "正常"),
        ScoringCriterion(score: 1, description: "軽度〜中等度の構音障害"),
        ScoringCriterion(score: 2, description: "重度の構音障害または無言")
    ]),
    AssessmentItem(number: 15, name: "消去・無視", description: "両側同時刺激に対する消去・無視の評価", scoringCriteria: [
        ScoringCriterion(score: 0, description: "異常なし"),
        ScoringCriterion(score: 1, description: "一側の感覚・視覚・聴覚の消去"),
        ScoringCriterion(score: 2, description: "重度の半側無視・複数感覚の消去")
    ])
]

private let bergBalanceItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "坐位から立位", description: "「立ってください」と指示", scoringCriteria: [
        ScoringCriterion(score: 4, description: "手を使わずに安全に立ち上がれる"),
        ScoringCriterion(score: 3, description: "手を使って自力で立てる"),
        ScoringCriterion(score: 2, description: "数回試みた後に手を使って立てる"),
        ScoringCriterion(score: 1, description: "立つための最小限の介助が必要"),
        ScoringCriterion(score: 0, description: "立つために中等度〜最大限の介助が必要")
    ]),
    AssessmentItem(number: 2, name: "監視なしの立位", description: "2分間の立位保持", scoringCriteria: [
        ScoringCriterion(score: 4, description: "2分間安全に立っていられる"),
        ScoringCriterion(score: 3, description: "監視下で2分間立っていられる"),
        ScoringCriterion(score: 2, description: "30秒間立っていられる"),
        ScoringCriterion(score: 1, description: "数回の試みで30秒間立っていられる"),
        ScoringCriterion(score: 0, description: "介助なしに30秒間立っていられない")
    ]),
    AssessmentItem(number: 3, name: "監視なしの坐位（背もたれなし）", description: "2分間の端坐位保持", scoringCriteria: [
        ScoringCriterion(score: 4, description: "2分間安全に坐っていられる"),
        ScoringCriterion(score: 3, description: "監視下で2分間坐っていられる"),
        ScoringCriterion(score: 2, description: "30秒間坐っていられる"),
        ScoringCriterion(score: 1, description: "10秒間坐っていられる"),
        ScoringCriterion(score: 0, description: "支持なしに10秒間坐っていられない")
    ]),
    AssessmentItem(number: 4, name: "立位から坐位", description: "「坐ってください」と指示", scoringCriteria: [
        ScoringCriterion(score: 4, description: "手をほとんど使わずに安全に坐れる"),
        ScoringCriterion(score: 3, description: "手を使って坐降を制御する"),
        ScoringCriterion(score: 2, description: "下肢後面をチェアに接触させて坐降を制御"),
        ScoringCriterion(score: 1, description: "自力で坐れるが坐降のコントロールができない"),
        ScoringCriterion(score: 0, description: "坐るために介助が必要")
    ]),
    AssessmentItem(number: 5, name: "移乗動作", description: "チェア⇔ベッドの移乗", scoringCriteria: [
        ScoringCriterion(score: 4, description: "手をほとんど使わずに安全に移乗できる"),
        ScoringCriterion(score: 3, description: "手を使って安全に移乗できる"),
        ScoringCriterion(score: 2, description: "言語指示または監視が必要"),
        ScoringCriterion(score: 1, description: "1人の介助者が必要"),
        ScoringCriterion(score: 0, description: "2人の介助者または監視が必要")
    ]),
    AssessmentItem(number: 6, name: "目を閉じて立位", description: "10秒間目を閉じた立位", scoringCriteria: [
        ScoringCriterion(score: 4, description: "10秒間安全に立っていられる"),
        ScoringCriterion(score: 3, description: "監視下で10秒間立っていられる"),
        ScoringCriterion(score: 2, description: "3秒間立っていられる"),
        ScoringCriterion(score: 1, description: "3秒間目を閉じておけないが安全に立っている"),
        ScoringCriterion(score: 0, description: "転倒防止のための介助が必要")
    ]),
    AssessmentItem(number: 7, name: "両足そろえての立位", description: "1分間の閉脚立位", scoringCriteria: [
        ScoringCriterion(score: 4, description: "1分間安全に立っていられる"),
        ScoringCriterion(score: 3, description: "監視下で1分間立っていられる"),
        ScoringCriterion(score: 2, description: "30秒間立っていられる"),
        ScoringCriterion(score: 1, description: "15秒間立っていられる"),
        ScoringCriterion(score: 0, description: "介助なしに立位や15秒間の保持ができない")
    ]),
    AssessmentItem(number: 8, name: "立位でのリーチ", description: "前方へのリーチ距離", scoringCriteria: [
        ScoringCriterion(score: 4, description: "25cm以上のリーチが可能"),
        ScoringCriterion(score: 3, description: "12cm以上のリーチが可能"),
        ScoringCriterion(score: 2, description: "5cm以上のリーチが可能"),
        ScoringCriterion(score: 1, description: "リーチするが監視が必要"),
        ScoringCriterion(score: 0, description: "バランスを保持するために介助が必要")
    ]),
    AssessmentItem(number: 9, name: "立位で床からの物拾い", description: "足の前に置いたスリッパを拾う", scoringCriteria: [
        ScoringCriterion(score: 4, description: "安全かつ容易に拾える"),
        ScoringCriterion(score: 3, description: "監視下で拾える"),
        ScoringCriterion(score: 2, description: "2〜5cm以内に近づけないが安定"),
        ScoringCriterion(score: 1, description: "試みるが監視が必要"),
        ScoringCriterion(score: 0, description: "試みることができない、または介助が必要")
    ]),
    AssessmentItem(number: 10, name: "立位での振り返り（左右）", description: "後方を振り返る", scoringCriteria: [
        ScoringCriterion(score: 4, description: "両側とも安全に後方を見られる"),
        ScoringCriterion(score: 3, description: "一側のみ安全に後方を見られる"),
        ScoringCriterion(score: 2, description: "横を向くが安全"),
        ScoringCriterion(score: 1, description: "振り返る際に監視が必要"),
        ScoringCriterion(score: 0, description: "バランスを保つための介助が必要")
    ]),
    AssessmentItem(number: 11, name: "360°回転", description: "安全に回転する", scoringCriteria: [
        ScoringCriterion(score: 4, description: "4秒以内に安全に360°回転できる"),
        ScoringCriterion(score: 3, description: "一側4秒以内のみ可能"),
        ScoringCriterion(score: 2, description: "安全だが遅い"),
        ScoringCriterion(score: 1, description: "厳重な監視または言語指示が必要"),
        ScoringCriterion(score: 0, description: "回転時に介助が必要")
    ]),
    AssessmentItem(number: 12, name: "踏み台昇降", description: "交互に踏み台に足を乗せる（4回）", scoringCriteria: [
        ScoringCriterion(score: 4, description: "20秒以内に安全に4回実施できる"),
        ScoringCriterion(score: 3, description: "20秒以内に4回実施できるが監視が必要"),
        ScoringCriterion(score: 2, description: "監視下で4回できるが20秒超"),
        ScoringCriterion(score: 1, description: "最小限の介助で2回以上できる"),
        ScoringCriterion(score: 0, description: "転倒防止のために介助が必要、または実施できない")
    ]),
    AssessmentItem(number: 13, name: "タンデム立位（継ぎ足立位）", description: "一方の足のつま先にもう一方の踵をつけた立位", scoringCriteria: [
        ScoringCriterion(score: 4, description: "独立してタンデム位をとれ30秒間保持"),
        ScoringCriterion(score: 3, description: "独立して継ぎ足位をとれ30秒間保持"),
        ScoringCriterion(score: 2, description: "独立して足を前に出せ30秒間保持"),
        ScoringCriterion(score: 1, description: "歩を前に出すのに介助が必要だが15秒間保持"),
        ScoringCriterion(score: 0, description: "立位中バランスを失う")
    ]),
    AssessmentItem(number: 14, name: "片脚立位", description: "片脚での立位保持", scoringCriteria: [
        ScoringCriterion(score: 4, description: "10秒以上独立して立っていられる"),
        ScoringCriterion(score: 3, description: "5〜10秒独立して立っていられる"),
        ScoringCriterion(score: 2, description: "3秒以上独立して立っていられる"),
        ScoringCriterion(score: 1, description: "片脚立位を試みるが3秒間保持できない"),
        ScoringCriterion(score: 0, description: "試みることができず介助が必要")
    ])
]

private let fuglMeyerUpperItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "反射活動（上腕二頭筋）", description: "肘屈筋反射の誘発", scoringCriteria: [
        ScoringCriterion(score: 0, description: "反射活動なし"),
        ScoringCriterion(score: 2, description: "反射活動あり")
    ]),
    AssessmentItem(number: 2, name: "反射活動（上腕三頭筋）", description: "肘伸筋反射の誘発", scoringCriteria: [
        ScoringCriterion(score: 0, description: "反射活動なし"),
        ScoringCriterion(score: 2, description: "反射活動あり")
    ]),
    AssessmentItem(number: 3, name: "屈筋共同運動（肩挙上）", description: "仰臥位で肩の挙上（肩甲骨挙上）", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 4, name: "屈筋共同運動（肩後退）", description: "肩甲骨後退", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 5, name: "屈筋共同運動（肩外転90°）", description: "肩外転90°", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 6, name: "屈筋共同運動（肘屈曲）", description: "肘屈曲", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 7, name: "屈筋共同運動（前腕回外）", description: "前腕回外", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 8, name: "伸筋共同運動（肩内転/内旋）", description: "肩内転・内旋", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 9, name: "伸筋共同運動（肘伸展）", description: "肘伸展", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 10, name: "伸筋共同運動（前腕回内）", description: "前腕回内", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 11, name: "共同運動外の動き（手を腰に持っていく）", description: "坐位で手を腰後部へ", scoringCriteria: [
        ScoringCriterion(score: 0, description: "特有の動作がない"),
        ScoringCriterion(score: 1, description: "手が腸骨棘の前を通る"),
        ScoringCriterion(score: 2, description: "完全に行える")
    ]),
    AssessmentItem(number: 12, name: "共同運動外（肩屈曲90°肘伸展）", description: "肩屈曲90°肘伸展・前腕回内", scoringCriteria: [
        ScoringCriterion(score: 0, description: "最初から体幹の回旋または肘屈曲"),
        ScoringCriterion(score: 1, description: "動作中に肘屈曲または体幹の逸脱"),
        ScoringCriterion(score: 2, description: "完全に行える")
    ]),
    AssessmentItem(number: 13, name: "共同運動外（前腕回内外）", description: "肩屈曲30〜90°肘伸展位での前腕回内外", scoringCriteria: [
        ScoringCriterion(score: 0, description: "不正確な姿勢または回内外不可"),
        ScoringCriterion(score: 1, description: "姿勢は保てるが制限あり"),
        ScoringCriterion(score: 2, description: "完全に行える")
    ]),
    AssessmentItem(number: 14, name: "手関節安定性（肘90°屈曲位）", description: "肘屈曲90°で手関節背屈15°保持", scoringCriteria: [
        ScoringCriterion(score: 0, description: "背屈不可"),
        ScoringCriterion(score: 1, description: "ある程度の背屈は可能だが15°未満"),
        ScoringCriterion(score: 2, description: "保持可能")
    ]),
    AssessmentItem(number: 15, name: "手関節屈伸（肘90°屈曲位）", description: "手関節の屈伸運動", scoringCriteria: [
        ScoringCriterion(score: 0, description: "随意運動不可"),
        ScoringCriterion(score: 1, description: "わずかな随意運動のみ"),
        ScoringCriterion(score: 2, description: "完全に行える")
    ])
]

private let fuglMeyerLowerItems: [AssessmentItem] = [
    AssessmentItem(number: 1, name: "反射活動（アキレス腱反射）", description: "仰臥位でアキレス腱反射", scoringCriteria: [
        ScoringCriterion(score: 0, description: "反射活動なし"),
        ScoringCriterion(score: 2, description: "反射活動あり")
    ]),
    AssessmentItem(number: 2, name: "反射活動（膝蓋腱反射）", description: "仰臥位で膝蓋腱反射", scoringCriteria: [
        ScoringCriterion(score: 0, description: "反射活動なし"),
        ScoringCriterion(score: 2, description: "反射活動あり")
    ]),
    AssessmentItem(number: 3, name: "屈筋共同運動（股関節屈曲）", description: "仰臥位で股関節屈曲", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 4, name: "屈筋共同運動（膝関節屈曲）", description: "膝屈曲90°以上", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "90°未満"),
        ScoringCriterion(score: 2, description: "90°以上")
    ]),
    AssessmentItem(number: 5, name: "屈筋共同運動（足関節背屈）", description: "足関節背屈", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 6, name: "伸筋共同運動（股関節伸展）", description: "仰臥位で股関節伸展", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 7, name: "伸筋共同運動（膝関節伸展）", description: "膝関節伸展", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 8, name: "伸筋共同運動（足関節底屈）", description: "足関節底屈", scoringCriteria: [
        ScoringCriterion(score: 0, description: "全く動かない"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 9, name: "共同運動外（坐位での膝屈曲）", description: "坐位で膝屈曲90°以上", scoringCriteria: [
        ScoringCriterion(score: 0, description: "膝は90°以上屈曲できない"),
        ScoringCriterion(score: 1, description: "90°以上可能だが不完全"),
        ScoringCriterion(score: 2, description: "完全に行える")
    ]),
    AssessmentItem(number: 10, name: "共同運動外（坐位での足関節背屈）", description: "坐位での足関節背屈", scoringCriteria: [
        ScoringCriterion(score: 0, description: "背屈不可"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ]),
    AssessmentItem(number: 11, name: "共同運動外（立位での膝屈曲）", description: "立位（股伸展）での膝屈曲90°", scoringCriteria: [
        ScoringCriterion(score: 0, description: "膝屈曲の際に股屈曲、または立位不可"),
        ScoringCriterion(score: 1, description: "股伸展は保てるが膝屈曲は90°未満"),
        ScoringCriterion(score: 2, description: "完全に行える")
    ]),
    AssessmentItem(number: 12, name: "共同運動外（立位での足関節背屈）", description: "立位での足関節背屈", scoringCriteria: [
        ScoringCriterion(score: 0, description: "背屈不可"),
        ScoringCriterion(score: 1, description: "部分的に動く"),
        ScoringCriterion(score: 2, description: "完全に動く")
    ])
]
