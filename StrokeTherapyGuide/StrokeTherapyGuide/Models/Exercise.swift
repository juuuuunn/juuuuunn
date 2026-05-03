import Foundation

enum ExerciseCategory: String, CaseIterable, Identifiable, Codable {
    case rom = "関節可動域訓練"
    case strengthening = "筋力増強訓練"
    case balance = "バランス訓練"
    case gait = "歩行訓練"
    case upperLimb = "上肢機能訓練"
    case adl = "ADL訓練"
    case respiratory = "呼吸理学療法"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .rom: return "arrow.clockwise.circle.fill"
        case .strengthening: return "dumbbell.fill"
        case .balance: return "figure.stand"
        case .gait: return "figure.walk"
        case .upperLimb: return "hand.raised.fill"
        case .adl: return "house.fill"
        case .respiratory: return "lungs.fill"
        }
    }

    var colorName: String {
        switch self {
        case .rom: return "blue"
        case .strengthening: return "red"
        case .balance: return "purple"
        case .gait: return "green"
        case .upperLimb: return "orange"
        case .adl: return "teal"
        case .respiratory: return "cyan"
        }
    }
}

enum DifficultyLevel: String, CaseIterable, Codable {
    case easy = "容易"
    case moderate = "中等度"
    case hard = "困難"
}

struct Exercise: Identifiable, Codable {
    let id: UUID
    let name: String
    let category: ExerciseCategory
    let phase: [TherapyPhase]
    let difficulty: DifficultyLevel
    let targetMuscles: [String]
    let purpose: String
    let procedure: [String]
    let precautions: [String]
    let sets: String
    let repetitions: String
    let tip: String?

    init(id: UUID = UUID(), name: String, category: ExerciseCategory, phase: [TherapyPhase],
         difficulty: DifficultyLevel, targetMuscles: [String], purpose: String,
         procedure: [String], precautions: [String], sets: String, repetitions: String, tip: String? = nil) {
        self.id = id
        self.name = name
        self.category = category
        self.phase = phase
        self.difficulty = difficulty
        self.targetMuscles = targetMuscles
        self.purpose = purpose
        self.procedure = procedure
        self.precautions = precautions
        self.sets = sets
        self.repetitions = repetitions
        self.tip = tip
    }
}

extension Exercise {
    static let sampleData: [Exercise] = [
        // ROM訓練
        Exercise(
            name: "肩関節他動ROM訓練",
            category: .rom,
            phase: [.acute, .subacute],
            difficulty: .easy,
            targetMuscles: ["三角筋", "棘上筋", "棘下筋", "広背筋"],
            purpose: "肩関節可動域の維持・拘縮予防・浮腫軽減",
            procedure: [
                "患者を仰臥位にする",
                "患側上肢を把持（一方は肘関節、もう一方は手関節）",
                "肩関節屈曲：ゆっくりと前方挙上（0〜150°）",
                "肩関節外転：側方挙上（0〜120°）",
                "肩関節内外旋：肘90°屈曲位で実施",
                "痛みのない範囲で10〜20回繰り返す"
            ],
            precautions: [
                "肩関節亜脱臼がある場合は上腕骨頭を支持",
                "過度な牽引・急激な動作を避ける",
                "疼痛が生じたら即座に中止",
                "拘縮が強い場合は強制的な可動域拡大を行わない"
            ],
            sets: "1〜2セット",
            repetitions: "各方向10〜20回",
            tip: "患者にリラックスを促し、呼吸を止めないよう指導する"
        ),
        Exercise(
            name: "足関節他動ROM訓練",
            category: .rom,
            phase: [.acute, .subacute],
            difficulty: .easy,
            targetMuscles: ["下腿三頭筋", "前脛骨筋", "腓骨筋群"],
            purpose: "尖足予防・深部静脈血栓症予防・感覚入力",
            procedure: [
                "仰臥位または端坐位で実施",
                "一方の手で踵を把持、もう一方で足部を支持",
                "足関節背屈：ゆっくりと底屈位から背屈へ（0〜20°）",
                "足関節底屈：背屈位から底屈へ（0〜40°）",
                "内返し・外返しも合わせて実施",
                "踵骨の動きも確認しながら実施"
            ],
            precautions: [
                "痙縮が強い場合は徐々に力を入れる",
                "皮膚の発赤・腫脹がある場合は担当医に確認",
                "深部静脈血栓症が疑われる場合は実施前に確認"
            ],
            sets: "2〜3セット",
            repetitions: "各方向20〜30回",
            tip: "腓腹筋のストレッチを意識し、膝を伸展位で実施するとより効果的"
        ),

        // 筋力増強
        Exercise(
            name: "大腿四頭筋セッティング",
            category: .strengthening,
            phase: [.acute, .subacute],
            difficulty: .easy,
            targetMuscles: ["大腿四頭筋"],
            purpose: "大腿四頭筋の等尺性収縮訓練・筋萎縮予防",
            procedure: [
                "仰臥位または端坐位で膝関節伸展位をとる",
                "太ももの裏がベッドに押し付けるようにゆっくり力を入れる",
                "膝蓋骨が頭側に引き上がるのを確認",
                "5〜10秒間保持",
                "ゆっくりと力を抜く",
                "繰り返し実施"
            ],
            precautions: [
                "呼吸を止めないよう注意（特に高血圧患者）",
                "痙縮が強い場合は過度な努力を避ける",
                "膝関節に疼痛がある場合は中止"
            ],
            sets: "3セット",
            repetitions: "10〜15回（5〜10秒保持）",
            tip: "視覚的フィードバックとして膝蓋骨の動きを患者自身で確認させる"
        ),
        Exercise(
            name: "股関節外転筋力強化（SLR外転）",
            category: .strengthening,
            phase: [.subacute, .chronic],
            difficulty: .moderate,
            targetMuscles: ["中殿筋", "小殿筋", "大腿筋膜張筋"],
            purpose: "中殿筋強化・歩行時の側方安定性向上",
            procedure: [
                "側臥位（患側上）で下側の膝を軽度屈曲",
                "上側（患側）の膝を伸展位に保つ",
                "上肢を床につけてバランスをとる",
                "患側下肢を約30°外転挙上",
                "3〜5秒保持後ゆっくり下ろす",
                "疲労に応じて回数・セット数を調整"
            ],
            precautions: [
                "骨盤が後傾しないよう注意",
                "代償として体幹の側屈が起こりやすい",
                "痙縮で適切な筋収縮が得られない場合はNMES併用を検討"
            ],
            sets: "3セット",
            repetitions: "10〜15回",
            tip: "触覚フィードバック（中殿筋部に手を当てる）で筋収縮を確認"
        ),
        Exercise(
            name: "端坐位での上肢リーチ訓練",
            category: .strengthening,
            phase: [.subacute, .chronic],
            difficulty: .moderate,
            targetMuscles: ["三角筋", "上腕三頭筋", "前鋸筋", "体幹筋"],
            purpose: "上肢機能・体幹安定性・座位バランスの改善",
            procedure: [
                "端坐位でバランスを保つ",
                "患側上肢で前方・側方・斜め方向へリーチ",
                "目標物（コーン・ボール等）を使用",
                "リーチ距離を段階的に拡大",
                "正中線を越えるリーチも取り入れる",
                "上肢を持ち上げながら体幹を安定させることを意識"
            ],
            precautions: [
                "亜脱臼がある場合は支持しながら実施",
                "座位バランスが不安定な場合は必ず監視",
                "疼痛・痙縮増悪時は中止"
            ],
            sets: "3セット",
            repetitions: "各方向10回",
            tip: "ミラーセラピーと組み合わせることで効果的"
        ),

        // バランス訓練
        Exercise(
            name: "立位重心移動訓練",
            category: .balance,
            phase: [.subacute, .chronic],
            difficulty: .moderate,
            targetMuscles: ["下肢全体", "体幹筋"],
            purpose: "立位バランス向上・麻痺側への荷重促進",
            procedure: [
                "平行棒内または手すりの前で立位をとる",
                "足を肩幅程度に開く",
                "前後方向への重心移動：踵〜つま先への体重移動",
                "左右方向への重心移動：健側⇔患側への体重移動",
                "患側へ十分な荷重がかかるよう意識",
                "体重計を使った視覚フィードバックも有効"
            ],
            precautions: [
                "転倒リスクに応じて介助量を設定",
                "起立性低血圧が疑われる場合は安静時BPを確認",
                "下肢装具の着脱・調整を確認"
            ],
            sets: "3〜5セット",
            repetitions: "各方向10〜20回",
            tip: "体重計2台（左右）を使用したバイオフィードバック訓練が効果的"
        ),
        Exercise(
            name: "タンデム歩行（継ぎ足歩行）",
            category: .balance,
            phase: [.subacute, .chronic],
            difficulty: .hard,
            targetMuscles: ["下腿三頭筋", "前脛骨筋", "腓骨筋群", "体幹筋"],
            purpose: "動的バランス・前後方向の安定性向上",
            procedure: [
                "手すり沿いに立位をとる",
                "一方の足のつま先に、もう一方の踵をつけながら歩く",
                "視線は前方に向ける",
                "ゆっくりと確実に体重移動を行う",
                "5〜10m程度を往復する",
                "安定したら手すりなしで実施"
            ],
            precautions: [
                "Berg Balance Scale ≥ 40点を目安に実施",
                "転倒リスクが高い場合は監視・介助を強化",
                "前庭障害・視覚障害がある場合は特に注意"
            ],
            sets: "3〜5往復",
            repetitions: "5〜10m",
            tip: "視覚的ターゲット（テープラインなど）を床に貼ると行いやすい"
        ),

        // 歩行訓練
        Exercise(
            name: "体重免荷トレッドミル歩行（BWSTT）",
            category: .gait,
            phase: [.subacute],
            difficulty: .moderate,
            targetMuscles: ["下肢全体", "体幹筋"],
            purpose: "正常歩行パターンの反復練習・歩行速度・耐久性向上",
            procedure: [
                "ハーネスを装着し体重の20〜30%を免荷して開始",
                "トレッドミルを低速（0.1〜0.3 m/s）から開始",
                "セラピストが患側下肢のスイング・接地を補助",
                "正常な歩行パターン（踵接地・膝屈曲・蹴り出し）を誘導",
                "体重免荷量を徐々に減らしながら速度を上げる",
                "最終的に通常歩行速度（0.8〜1.2 m/s）を目標とする"
            ],
            precautions: [
                "ハーネス装着による圧迫・皮膚損傷に注意",
                "心拍・SpO2・血圧のモニタリング",
                "急激な速度変化は避ける",
                "転倒リスクに応じてセラピスト配置を決定"
            ],
            sets: "継続歩行",
            repetitions: "20〜45分",
            tip: "セラピストは患側膝の屈曲を補助しながらスイング相を誘導"
        ),
        Exercise(
            name: "段差昇降訓練",
            category: .gait,
            phase: [.subacute, .chronic],
            difficulty: .hard,
            targetMuscles: ["大腿四頭筋", "大殿筋", "下腿三頭筋"],
            purpose: "階段昇降能力の回復・下肢筋力・バランス向上",
            procedure: [
                "低い段差（5〜10cm）から開始",
                "昇段：健側から（「健から上がる」）→ 患側を引き上げる",
                "降段：患側から（「患から下りる」）→ 健側を下ろす",
                "手すりを使用しながら安全に実施",
                "段差高さ・手すり使用を段階的に変更",
                "最終的に15〜18cmの通常段差で実施"
            ],
            precautions: [
                "転倒リスクが高い患者には後方から監視・介助",
                "患側膝折れに注意",
                "足底感覚低下がある場合は慎重に",
                "疲労時の転倒リスク増大に注意"
            ],
            sets: "3〜5セット",
            repetitions: "昇降10〜20回",
            tip: "「健上がり患下り」の原則を繰り返し指導する"
        ),

        // 上肢機能
        Exercise(
            name: "鏡療法（ミラーセラピー）",
            category: .upperLimb,
            phase: [.acute, .subacute, .chronic],
            difficulty: .easy,
            targetMuscles: ["上肢全体"],
            purpose: "運動機能回復・疼痛軽減・運動イメージの促通",
            procedure: [
                "鏡（縦置き）を体の正中線に立てる",
                "健側が鏡に映り患側が隠れるよう配置",
                "健側上肢で様々な動作を行う",
                "鏡に映った健側を「患側が動いている」と認識する",
                "同時に患側でも同じ動作を試みる",
                "手関節屈伸・前腕回内外・指の開閉など多様な動作を実施"
            ],
            precautions: [
                "半側空間無視がある場合の適応を慎重に検討",
                "視覚的な混乱が生じた場合は中止",
                "疼痛（CRPS等）への効果を期待する場合は頻回に実施"
            ],
            sets: "1〜2セット",
            repetitions: "各動作1〜2分",
            tip: "患者に「鏡の中の手が自分の患側の手」であることを意識させる"
        ),
        Exercise(
            name: "ペグボード訓練",
            category: .upperLimb,
            phase: [.subacute, .chronic],
            difficulty: .moderate,
            targetMuscles: ["手指屈筋群", "対立筋", "骨間筋"],
            purpose: "手指巧緻性・つまみ動作・手指独立性の向上",
            procedure: [
                "ペグボードを適切な高さに設置",
                "ペグを1本ずつ穴に差し込む",
                "拇指と示指のピンチで把持",
                "ボードの端から順に全てのペグを移動させる",
                "可能であれば時間を計測して記録",
                "難易度：ペグの太さ変更・手の使用制限など"
            ],
            precautions: [
                "疼痛・痙縮増悪時は中止",
                "過度の努力による代償動作を避ける",
                "認知機能低下がある場合は簡易課題から開始"
            ],
            sets: "3〜5セット",
            repetitions: "各セット完了まで",
            tip: "NHPT（九穴ペグテスト）を評価ツールとしても活用できる"
        ),

        // 呼吸理学療法
        Exercise(
            name: "腹式呼吸訓練",
            category: .respiratory,
            phase: [.acute, .subacute],
            difficulty: .easy,
            targetMuscles: ["横隔膜", "腹横筋"],
            purpose: "換気量増加・呼吸筋強化・リラクゼーション",
            procedure: [
                "半坐位または坐位をとる",
                "一方の手を腹部、もう一方を胸部に置く",
                "鼻からゆっくり吸気（腹部が膨らむことを確認）",
                "口をすぼめてゆっくり呼気（4〜6秒）",
                "胸部の手ができるだけ動かないようにする",
                "規則正しいリズムで繰り返す"
            ],
            precautions: [
                "過換気症状（めまい・しびれ）が出た場合は中止",
                "意識レベル低下患者には適応を慎重に検討",
                "肺炎急性期は禁忌ではないが無理をしない"
            ],
            sets: "2〜3セット",
            repetitions: "10〜15回",
            tip: "就寝前のリラクゼーションとしても活用できる"
        )
    ]
}
