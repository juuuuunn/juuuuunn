# ことわざ学習アプリ

毎日1つのことわざをプッシュ通知でお届けするiOS学習アプリです。

## 機能

- **今日のことわざ**: 日付ベースでことわざが毎日自動で切り替わる
- **一覧・検索**: カテゴリフィルタ＋テキスト検索でことわざを探せる
- **詳細表示**: ことわざ・読み方・意味・例文を表示。シェア機能付き
- **毎日通知**: 好きな時刻に毎日ことわざを通知（ローカル通知）

## データ

- ことわざ数: 60件以上
- カテゴリ: 努力・根気 / 知恵・学び / 人間関係 / 自然・時間 / 行動・判断 / 運・運命 / 感情・心

## Xcodeプロジェクトの作成手順

1. Xcode を開く
2. **File → New → Project** を選択
3. **iOS → App** を選択して Next
4. 設定:
   - Product Name: `KotowazaApp`
   - Interface: `SwiftUI`
   - Language: `Swift`
5. プロジェクトを保存したら、`KotowazaApp/Sources/` 内のすべての `.swift` ファイルをXcodeにドラッグ＆ドロップ（または File → Add Files）
6. `Info.plist` に通知用の許可文を追加（後述）

### Info.plist への追記

```xml
<key>NSUserNotificationUsageDescription</key>
<string>毎日のことわざをお知らせするために通知を使用します。</string>
```

Xcodeのターゲット設定 → **Info** タブ → "Custom iOS Target Properties" に下記を追加してもOK:
- Key: `Privacy - Notifications Usage Description`
- Value: `毎日のことわざをお知らせするために通知を使用します。`

## ファイル構成

```
Sources/
├── KotowazaApp.swift          # @main エントリポイント
├── Models/
│   └── Proverb.swift          # データモデル・カテゴリ定義
├── Data/
│   └── ProverbData.swift      # ことわざデータ（60件以上）
├── Services/
│   └── NotificationService.swift  # 通知スケジューリング
├── ViewModels/
│   └── ProverbViewModel.swift     # ビジネスロジック
└── Views/
    ├── ContentView.swift          # タブバー
    ├── HomeView.swift             # 今日のことわざ画面
    ├── ProverbListView.swift      # 一覧・検索画面
    ├── ProverbDetailView.swift    # 詳細画面
    └── SettingsView.swift         # 設定画面（通知時刻等）
```

## 動作要件

- iOS 17.0 以上
- Xcode 15.0 以上
