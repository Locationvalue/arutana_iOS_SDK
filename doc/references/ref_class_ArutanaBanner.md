# クラス: `ArutanaBanner`

## 概要
`ArutanaBanner`クラスは、広告バナーを表示し、広告の受信やタップイベントを処理するためのクラスです。このクラスは広告配信の管理や表示コンテナへの配置、ユーザーアクションのハンドリングを提供します。

## パッケージ
`Arutana`

## 継承関係
`NSObject`を継承し、`ArutanaAPIClientDelegate`および`SFSafariViewControllerDelegate`プロトコルを実装しています。

## コンストラクタ

### `@objc public init(locationId: String, adType: ArutanaAdType)`
- **説明**: 指定された`locationId`（広告枠ID）と`adType`（広告タイプ）を使用して`ArutanaBanner`インスタンスを初期化します。初期化時にバナー用のビューとタップイベントを設定します。
- **パラメータ**:
  - `locationId`: 広告枠ID
  - `adType`: 広告のタイプ

## パブリックフィールド

### `@objc public var delegate: ArutanaBannerDelegate?`
- **説明**: `ArutanaBannerDelegate`プロトコルを実装したオブジェクトを設定することで、広告の受信やタップなどのイベントを処理することができます。

## パブリックメソッド

### `@objc(setUserId:) public func setUserId(_ userId: String?)`
- **説明**: ログイン中のユーザーの会員ID（user id）を設定します。
- **パラメータ**:
  - `userId`: 設定するユーザーID

### `@objc(setEnableTestMode:) public func setEnableTestMode(_ isTest: Bool)`
- **説明**: テストモードを有効または無効に設定します。
- **パラメータ**:
  - `isTest`: テストモードを有効にする場合は`true`、無効にする場合は`false`

### `@objc public func addAdContainerView(_ adContainerView: UIView)`
- **説明**: 広告を表示するためのコンテナビューを設定し、バナーをこのビューに追加します。バナーは指定されたコンテナビューのサイズにフィットするように配置されます。
- **パラメータ**:
  - `adContainerView`: 広告バナーを表示する`UIView`

### `@objc public func loadRequest()`
- **説明**: 広告のリクエストを行います。広告サイズが無効な場合はエラーログを出力し、広告の受信に失敗します。

## 内部クラス

なし

## デリゲートメソッド (プロトコル実装)

### `func arutanaAPIClientReceiveAd(ad: AdResponse.Placement.Ad)`
- **説明**: `ArutanaAPIClientDelegate`プロトコルのメソッドで、広告の受信が成功した際に呼び出されます。受信した広告のURLやトラッキングURLを設定し、広告イメージをダウンロードして表示します。

### `func arutanaAPIClientFailedToReceiveAd(code: kArutanaErrorCode)`
- **説明**: `ArutanaAPIClientDelegate`プロトコルのメソッドで、広告の受信に失敗した際に呼び出されます。指定されたエラーコードで失敗処理を行います。

### `public func safariViewControllerDidFinish(_ controller: SFSafariViewController)`
- **説明**: `SFSafariViewControllerDelegate`プロトコルのメソッドで、Safari View Controllerが閉じられた時に呼び出されます。内部的に保持している`webWindow`を`nil`に設定します。
