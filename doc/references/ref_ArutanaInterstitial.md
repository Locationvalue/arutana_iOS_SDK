# クラス: `ArutanaInterstitial`

## 概要
`ArutanaInterstitial`クラスは、インタースティシャル広告（全画面広告）を表示し、広告の事前読み込み、表示、クローズなどのイベントを処理するためのクラスです。このクラスは広告のリクエストや画面上の表示機能を提供します。

## パッケージ
`Arutana`

## 継承関係
`NSObject`を継承しています。

## コンストラクタ

### `public override init()`
- **説明**: `ArutanaInterstitial`クラスの新しいインスタンスを生成します。

## パブリックフィールド

### `@objc public var rootViewController: UIViewController?`
- **説明**: インタースティシャル広告を表示するためのルートビューコントローラを設定します。

## パブリックメソッド

### `@objc(setLocationId:) public func setLocationId(_ locationId: String)`
- **説明**: 広告枠ID（location id）を設定します。
- **パラメータ**:
  - `locationId`: 広告枠ID

### `@objc(setUserId:) public func setUserId(_ userId: String?)`
- **説明**: ログイン中のユーザーID（user id）を設定します。
- **パラメータ**:
  - `userId`: 設定するユーザーID

### `@objc(setTopMargin:) public func setTopMargin(_ margin: Int)`
- **説明**: インタースティシャル広告表示時の上部マージンを設定します。
- **パラメータ**:
  - `margin`: 上部マージンの値

### `@objc(setEnableTestMode:) public func setEnableTestMode(_ isTest: Bool)`
- **説明**: テストモードを有効または無効に設定します。
- **パラメータ**:
  - `isTest`: テストモードを有効にする場合は`true`、無効にする場合は`false`

### `@objc(setAdBackgroundColor:) public func setAdBackgroundColor(_ color: UIColor)`
- **説明**: インタースティシャル広告の背景色を設定します。
- **パラメータ**:
  - `color`: 設定する背景色

### `@objc(setAdTextColor:) public func setAdTextColor(_ color: UIColor)`
- **説明**: インタースティシャル広告のテキストカラーを設定します。
- **パラメータ**:
  - `color`: 設定するテキストカラー

### `@objc(setWidth:) public func setWidth(_ widthPercentage:CGFloat)`
- **説明**: インタースティシャル広告表示時の幅を指定します。
- **パラメータ**:
  - `widthPercentage`: 画面幅に対する割合（例: 画面幅に対して50%の幅で表示する場合, 0.5）

### `@objc public func preload()`
- **説明**: インタースティシャル広告を事前に非同期で読み込みます。

### `@objc public func show()`
- **説明**: 事前にロードされたインタースティシャル広告を表示します。広告が表示中である場合や、事前にロードされていない場合は何も行いません。`preload`メソッドで広告が事前に読み込まれていることを確認してください。

### `@objc public func dismiss()`
- **説明**: 表示中のインタースティシャル広告を非表示にします。

## 内部クラス

なし