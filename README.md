# 🐭 チンチラ体調管理アプリ - iOS版

チンチラの健康を総合的に管理するiOSアプリです。

## 機能

- **体重管理** - 体重の記録と推移グラフ
- **食事管理** - 食材の種類と量を記録
- **健康チェック** - 毛並み、目、便、食欲などの状態を記録
- **行動記録** - 活動度と睡眠時間を記録
- **医療記録** - 診察、治療、投薬などを記録
- **環境管理** - 気温と湿度を記録
- **自動アラート** - 異常を自動検出
- **統計分析** - 月間統計と健康スコア

## セットアップ

### 必須環境

- macOS
- Xcode 15.0 以上
- Node.js 16.0 以上
- npm または yarn

### インストール手順

1. **依存パッケージのインストール**
```bash
npm install
```

2. **Webアセットの同期**
```bash
npm run sync
```

3. **Xcodeで開く**
```bash
npm run ios:open
```

または

```bash
open ios/App/App.xcodeproj
```

## 開発ワークフロー

### Webコードの変更後

```bash
npm run sync
```

このコマンドで、`www/` フォルダ内の変更をiOSアプリに反映します。

### iOSアプリのビルド

```bash
npm run ios:build
```

### Xcodeでの実行

1. Xcodeで `ios/App/App.xcodeproj` を開く
2. シミュレータまたはデバイスを選択
3. ▶ ボタンでビルド・実行

## ファイル構成

```
.
├── www/                          # Webアセット
│   ├── index.html               # メインHTML
│   ├── app.js                   # アプリロジック
│   └── style.css                # スタイル
├── ios/                          # iOSプロジェクト
│   └── App/App.xcodeproj         # Xcodeプロジェクト
├── capacitor.config.json        # Capacitorの設定
├── package.json                 # npm設定
└── README.md                    # このファイル
```

## Webコードの更新

`www/` フォルダ内のファイルを編集してください：

- `index.html` - HTMLマークアップ
- `app.js` - JavaScriptロジック
- `style.css` - スタイリング

編集後は `npm run sync` でiOSアプリに反映します。

## iOSアプリ固有の設定

### アプリ情報

- **名前** - Chinchilla Health
- **Bundle ID** - com.chinchilla.health
- **最小iOS版** - iOS 14.0

### Info.plistの場所

`ios/App/App/Info.plist`

## アイコン・スプラッシュスクリーン

アイコンやスプラッシュスクリーンをカスタマイズする場合：

1. Xcodeで `ios/App/App.xcodeproj` を開く
2. Assets フォルダでアイコンを設定

## App Storeへの提出

1. Apple Developer アカウントを作成
2. Xcodeで署名設定を構成
3. Archive でアプリをビルド
4. App Store Connect にアップロード

## トラブルシューティング

### ビルドエラー

```bash
# キャッシュをクリア
rm -rf ios/App/Pods
npm run sync
```

### Webコードが反映されない

```bash
npm run sync
```

### Xcodeが開かない

```bash
xcode-select --install
```

## ライセンス

ISC

## サポート

問題が発生した場合は、GitHubのIssuesセクションで報告してください。

## 開発情報

- **フレームワーク** - Capacitor 8.3.0
- **対応OS** - iOS 14.0以上
- **開発言語** - HTML/CSS/JavaScript
