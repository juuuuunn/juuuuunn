# 脳卒中理学療法ガイド

理学療法士向けの脳卒中標準理学療法を指南するiOSアプリです。

## 概要

**脳卒中治療ガイドライン 2021（改訂2023）**および**日本理学療法士協会 脳卒中理学療法診療ガイドライン**に準拠した臨床支援ツールです。

## 主な機能

### 1. 治療プロトコル
病期（急性期・回復期・維持期）別の標準的な理学療法プロトコルを参照できます。
- 各プロトコルの目標・注意事項・介入内容を確認
- 推奨グレード（A〜D）の表示
- 介入ごとの頻度・時間の目安

### 2. 運動メニュー
14種類以上の運動・訓練の詳細手順を参照できます。
- カテゴリ別フィルタ（ROM・筋力・バランス・歩行・上肢・ADL・呼吸）
- 病期別フィルタ
- 検索機能
- 実施手順・対象筋・注意事項・臨床のポイントを表示

### 3. 評価ツール
主要な神経学的・機能的評価スケールを内蔵しています。

| 評価ツール | 内容 |
|-----------|------|
| NIHSS | NIH脳卒中スケール（15項目・0〜42点） |
| Berg Balance Scale | バランス評価（14項目・0〜56点） |
| Fugl-Meyer Assessment（上肢） | 上肢運動機能（0〜66点） |
| Fugl-Meyer Assessment（下肢） | 下肢運動機能（0〜34点） |
| TUG Test | Timed Up and Go（ストップウォッチ内蔵） |
| 10m歩行テスト | 歩行速度計測（ストップウォッチ内蔵） |
| FIM | 機能的自立度評価票（18項目・18〜126点） |

## 動作環境

- iOS 17.0以降
- iPhone / iPad 対応
- Xcode 15以降でビルド可能

## プロジェクト構成

```
StrokeTherapyGuide/
├── StrokeTherapyGuide.xcodeproj/
└── StrokeTherapyGuide/
    ├── StrokeTherapyGuideApp.swift      # App エントリポイント
    ├── ContentView.swift                # タブナビゲーション
    ├── Models/
    │   ├── TherapyProtocol.swift        # プロトコル・介入のモデル
    │   ├── Exercise.swift               # 運動・訓練のモデル
    │   └── Assessment.swift            # 評価スケールのモデル
    └── Views/
        ├── Home/
        │   └── HomeView.swift           # ホーム画面
        ├── Protocol/
        │   ├── ProtocolListView.swift   # プロトコル一覧
        │   └── ProtocolDetailView.swift # プロトコル詳細
        ├── Exercise/
        │   ├── ExerciseListView.swift   # 運動メニュー一覧
        │   └── ExerciseDetailView.swift # 運動詳細
        └── Assessment/
            ├── AssessmentListView.swift  # 評価ツール一覧
            └── AssessmentDetailView.swift # 評価実施画面
```

## 参照ガイドライン

- 脳卒中治療ガイドライン 2021（改訂2023）- 日本脳卒中学会
- 脳卒中理学療法診療ガイドライン - 日本理学療法士協会
- AHA/ASA Guidelines for Adult Stroke Rehabilitation

---

> **注意**: 本アプリは教育・臨床支援目的です。実際の診療は患者個々の状態に応じた専門的判断に基づいて行ってください。
