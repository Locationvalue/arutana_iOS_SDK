# クラス: `ArutanaMovieAd`

## 概要
`ArutanaMovieAd`クラスは、動画広告の表示、管理、イベントのハンドリングを行うクラスです。動画広告の受信、表示、タップ、フルスクリーン表示、クローズなどのイベントを処理します。

## パッケージ
`Arutana`

## 継承関係
`NSObject`を継承しています。

## コンストラクタ

### `public override init()`
- **説明**: `ArutanaMovieAd`クラスの新しいインスタンスを生成します。

## パブリックフィールド

### `@objc public var rootViewController: UIViewController?`
- **説明**: 広告を表示するためのルートビューコントローラを設定します。

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
- **説明**: 広告表示時の上部マージンを設定します。設定されると、下部マージンはリセットされます。
- **パラメータ**:
  - `margin`: 上部マージンの値

### `@objc(setBottomMargin:) public func setBottomMargin(_ margin: Int)`
- **説明**: 広告表示時の下部マージンを設定します。設定されると、上部マージンはリセットされます。
- **パラメータ**:
  - `margin`: 下部マージンの値

### `@objc(setEnableTestMode:) public func setEnableTestMode(_ isTest: Bool)`
- **説明**: テストモードを有効または無効に設定します。
- **パラメータ**:
  - `isTest`: テストモードを有効にする場合は`true`、無効にする場合は`false`

### `@objc(setTextColor:) public func setTextColor(_ color: UIColor)`
- **説明**: 広告内テキストの色を設定します。
- **パラメータ**:
  - `color`: テキストカラー

### `@objc(useSafeAreaInsets:) public func useSafeAreaInsets(_ use: Bool)`
- **説明**: 広告の表示位置の決定において、SafeAreaを考慮するか否かを指定します。Trueの場合、SafeAreaを考慮した位置に表示されます。
- **パラメータ**:
  - `use`: 安全領域のインセットを使用する場合は`true`、使用しない場合は`false`

### `@objc public func dismiss()`
- **説明**: 広告を非表示にします。

### `@objc public func preload()`
- **説明**: 広告を事前にロードします。非同期タスクで広告リクエストを行います。

### `@objc public func show()`
- **説明**: 事前にロードされた広告を表示します。事前に広告がロードされていない場合は何も行いません。`preload`メソッドで広告が事前に読み込まれていることを確認してください。

## 内部クラス

なし
