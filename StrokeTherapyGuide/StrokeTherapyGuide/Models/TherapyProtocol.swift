import Foundation

enum TherapyPhase: String, CaseIterable, Identifiable, Codable {
    case acute = "急性期"
    case subacute = "回復期"
    case chronic = "維持期・慢性期"

    var id: String { rawValue }

    var durationDescription: String {
        switch self {
        case .acute: return "発症後〜2週間"
        case .subacute: return "2週間〜6ヶ月"
        case .chronic: return "6ヶ月以降"
        }
    }

    var colorName: String {
        switch self {
        case .acute: return "red"
        case .subacute: return "orange"
        case .chronic: return "green"
        }
    }

    var iconName: String {
        switch self {
        case .acute: return "cross.fill"
        case .subacute: return "arrow.up.heart.fill"
        case .chronic: return "figure.walk"
        }
    }
}

struct TherapyProtocol: Identifiable, Codable {
    let id: UUID
    let phase: TherapyPhase
    let title: String
    let goal: String
    let precautions: [String]
    let interventions: [Intervention]
    let evidenceLevel: EvidenceLevel

    init(id: UUID = UUID(), phase: TherapyPhase, title: String, goal: String,
         precautions: [String], interventions: [Intervention], evidenceLevel: EvidenceLevel) {
        self.id = id
        self.phase = phase
        self.title = title
        self.goal = goal
        self.precautions = precautions
        self.interventions = interventions
        self.evidenceLevel = evidenceLevel
    }
}

struct Intervention: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let frequency: String
    let duration: String

    init(id: UUID = UUID(), name: String, description: String, frequency: String, duration: String) {
        self.id = id
        self.name = name
        self.description = description
        self.frequency = frequency
        self.duration = duration
    }
}

enum EvidenceLevel: String, Codable, CaseIterable {
    case levelA = "推奨グレードA"
    case levelB = "推奨グレードB"
    case levelC = "推奨グレードC"
    case levelD = "推奨グレードD"

    var description: String {
        switch self {
        case .levelA: return "強く推奨される（高いエビデンス）"
        case .levelB: return "推奨される（中程度のエビデンス）"
        case .levelC: return "条件によっては推奨される"
        case .levelD: return "推奨されないまたはエビデンス不十分"
        }
    }

    var color: String {
        switch self {
        case .levelA: return "blue"
        case .levelB: return "green"
        case .levelC: return "orange"
        case .levelD: return "gray"
        }
    }
}

extension TherapyProtocol {
    static let sampleData: [TherapyProtocol] = [
        // 急性期
        TherapyProtocol(
            phase: .acute,
            title: "早期離床・ポジショニング",
            goal: "廃用予防、合併症予防、早期ADL自立",
            precautions: [
                "バイタルサインを確認（BP < 220/120 mmHg）",
                "意識レベルの確認（JCS・GCS）",
                "脳浮腫増悪徴候に注意",
                "深部静脈血栓症のリスク評価",
                "嚥下障害の有無を確認"
            ],
            interventions: [
                Intervention(name: "ポジショニング", description: "患側上下肢を適切に支持し、拘縮・浮腫・疼痛を予防する。2時間ごとの体位変換を実施。", frequency: "2時間毎", duration: "継続"),
                Intervention(name: "関節可動域訓練（他動）", description: "全関節の他動ROM訓練。特に肩関節は過度な牽引を避ける。痛みのない範囲で実施。", frequency: "1〜2回/日", duration: "各関節10〜20回"),
                Intervention(name: "早期離床", description: "発症後24〜48時間以内に坐位・立位を開始（バイタル安定を確認後）。段階的に負荷を増加。", frequency: "1〜2回/日", duration: "耐容能に応じて"),
                Intervention(name: "呼吸理学療法", description: "深呼吸訓練・排痰援助・胸郭モビライゼーション。肺炎・無気肺の予防。", frequency: "1〜2回/日", duration: "15〜20分"),
                Intervention(name: "神経筋電気刺激（NMES）", description: "麻痺側上下肢への電気刺激。筋萎縮予防・感覚入力促通。", frequency: "1回/日", duration: "20〜30分")
            ],
            evidenceLevel: .levelA
        ),
        TherapyProtocol(
            phase: .acute,
            title: "急性期歩行・移乗訓練",
            goal: "安全な立位・移乗・歩行の再獲得",
            precautions: [
                "転倒リスクを必ずアセスメント",
                "起立性低血圧に注意（ゆっくりと頭部挙上）",
                "過負荷による症状増悪を監視",
                "介助量を適切に設定"
            ],
            interventions: [
                Intervention(name: "端坐位訓練", description: "ベッドサイドで端坐位バランス訓練。体幹筋活性化・座位耐久性向上。", frequency: "2〜3回/日", duration: "5〜15分"),
                Intervention(name: "立位訓練", description: "平行棒内での立位保持。重心移動・荷重訓練を段階的に進める。", frequency: "1〜2回/日", duration: "10〜20分"),
                Intervention(name: "移乗動作訓練", description: "ベッド⇔車椅子間の移乗。患側への移乗も早期から練習する。", frequency: "毎回", duration: "各動作ごと"),
                Intervention(name: "平行棒内歩行", description: "介助下での歩行開始。正常な歩行パターンを意識した練習。", frequency: "1〜2回/日", duration: "10〜15分")
            ],
            evidenceLevel: .levelA
        ),

        // 回復期
        TherapyProtocol(
            phase: .subacute,
            title: "歩行再建訓練",
            goal: "実用的歩行能力の回復・歩行速度・耐久性の向上",
            precautions: [
                "疲労・疼痛に配慮した運動強度設定",
                "装具の適切な使用を確認",
                "認知機能・注意障害が歩行に与える影響を評価",
                "心肺機能の評価と運動処方"
            ],
            interventions: [
                Intervention(name: "トレッドミル歩行訓練", description: "体重免荷トレッドミル（BWSTT）または通常トレッドミル。速度・負荷を段階的に増加。", frequency: "5回/週", duration: "20〜45分"),
                Intervention(name: "地上歩行訓練", description: "様々な環境での歩行練習（平地・段差・スロープ・不整地）。二重課題も取り入れる。", frequency: "毎日", duration: "30〜60分"),
                Intervention(name: "下肢筋力強化", description: "麻痺側下肢の選択的筋力強化。大腿四頭筋・ハムストリングス・下腿三頭筋・前脛骨筋。", frequency: "3〜5回/週", duration: "30〜45分"),
                Intervention(name: "ロボット支援歩行訓練", description: "Lokomat等を使用した反復練習。神経可塑性の促通。適応基準を確認。", frequency: "3〜5回/週", duration: "30〜60分"),
                Intervention(name: "機能的電気刺激（FES）", description: "歩行中の下垂足に対するFES。前脛骨筋への刺激でクリアランス改善。", frequency: "歩行練習中", duration: "練習時間に応じて")
            ],
            evidenceLevel: .levelA
        ),
        TherapyProtocol(
            phase: .subacute,
            title: "上肢機能回復訓練",
            goal: "麻痺側上肢の運動機能回復・ADLへの統合",
            precautions: [
                "肩関節亜脱臼の有無を確認",
                "複合性局所疼痛症候群（CRPS）の徴候に注意",
                "認知機能・無視症状が訓練に与える影響を考慮",
                "過度な代償動作を避ける"
            ],
            interventions: [
                Intervention(name: "CI療法（mCIMT）", description: "健側上肢を制限し患側の集中使用。高強度・課題志向型訓練。適応：患側の最小随意運動が必要。", frequency: "5回/週", duration: "2〜3時間/日、2週間"),
                Intervention(name: "ロボット支援上肢訓練", description: "MIT-MANUS等を用いた反復訓練。高回数の練習により神経可塑性を促進。", frequency: "3〜5回/週", duration: "1時間"),
                Intervention(name: "鏡療法", description: "健側の動作を鏡で見ながら患側を動かす。疼痛軽減・運動機能改善に有効。", frequency: "毎日", duration: "20〜30分"),
                Intervention(name: "課題志向型訓練", description: "実際のADL動作を繰り返し練習（コップを持つ・ボタンをかけるなど）。", frequency: "毎日", duration: "30〜60分"),
                Intervention(name: "経頭蓋磁気刺激（TMS）補助療法", description: "rTMSと組み合わせた運動訓練。患側皮質の興奮性を高める。専門施設での実施。", frequency: "5回/週", duration: "訓練と合わせて")
            ],
            evidenceLevel: .levelB
        ),
        TherapyProtocol(
            phase: .subacute,
            title: "バランス・転倒予防訓練",
            goal: "静的・動的バランス能力の改善、転倒リスクの低減",
            precautions: [
                "転倒リスクスコア（Berg Balance Scale）で定期評価",
                "視覚・前庭・体性感覚障害の統合評価",
                "認知機能低下患者では監視強化",
                "適切な補助具・装具の使用"
            ],
            interventions: [
                Intervention(name: "静的バランス訓練", description: "両脚・片脚立位での重心制御訓練。不安定面（バランスパッド）の使用で難度調整。", frequency: "毎日", duration: "15〜20分"),
                Intervention(name: "動的バランス訓練", description: "外乱応答・予測的姿勢調節の訓練。ステッピング・リーチ動作の練習。", frequency: "毎日", duration: "20〜30分"),
                Intervention(name: "体重移動訓練", description: "前後・左右への重心移動。麻痺側への荷重を促進。", frequency: "毎日", duration: "15〜20分"),
                Intervention(name: "太極拳・ヨガ応用", description: "ゆっくりした動作での全身協調性・バランス向上。", frequency: "3回/週", duration: "30〜45分")
            ],
            evidenceLevel: .levelB
        ),

        // 維持期
        TherapyProtocol(
            phase: .chronic,
            title: "維持期運動療法・再発予防",
            goal: "機能維持・二次予防・QOL向上・社会復帰支援",
            precautions: [
                "長期管理における過負荷・低負荷の両方に注意",
                "心血管リスク因子の継続管理",
                "うつ・認知機能低下のスクリーニング",
                "自主訓練の定着を支援"
            ],
            interventions: [
                Intervention(name: "有酸素運動プログラム", description: "中等度強度の有酸素運動（最大心拍数の50〜70%）。脳卒中再発リスク低減・全身体力向上。", frequency: "3〜5回/週", duration: "30〜60分"),
                Intervention(name: "筋力維持訓練", description: "上下肢・体幹の筋力維持プログラム。漸進的抵抗訓練（PRE）。", frequency: "2〜3回/週", duration: "30〜45分"),
                Intervention(name: "自主訓練指導", description: "家庭での継続訓練プログラム指導。動画・パンフレットを活用。", frequency: "毎日", duration: "30分〜"),
                Intervention(name: "社会参加支援", description: "地域での運動教室・デイケアへの参加促進。社会的孤立を予防。", frequency: "週1〜2回", duration: "継続的"),
                Intervention(name: "認知機能訓練", description: "二重課題歩行・認知課題との組み合わせ。認知症予防・注意機能維持。", frequency: "3回/週", duration: "20〜30分")
            ],
            evidenceLevel: .levelB
        )
    ]
}
