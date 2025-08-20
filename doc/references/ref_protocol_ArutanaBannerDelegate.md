# プロトコル: `ArutanaBannerDelegate`

## 概要
`ArutanaBannerDelegate`プロトコルは、`ArutanaBanner`クラスに関連する広告の受信、失敗、およびタップイベントを通知するためのデリゲートメソッドを定義します。`ArutanaBanner`クラスのインスタンスが広告の状態を処理する際に、このプロトコルを実装することでイベントをハンドリングできます。

## メソッド

### `@objc(arutanaBannerReceiveAd) func arutanaBannerReceiveAd()`
- **説明**: 広告の受信が成功した際に呼び出されます。広告が正常にロードされたときの処理を実装します。

### `@objc(arutanaBannerFailedToReceiveAd:) func arutanaBannerFailedToReceiveAd(code: kArutanaErrorCode)`
- **説明**: 広告の受信が失敗した際に呼び出されます。失敗時のエラーコードを受け取り、適切なエラーハンドリングを行います。
- **パラメータ**:
  - `code`: 広告受信に失敗した際のエラーコード（`kArutanaErrorCode`）

### `@objc(arutanaBannerDidTapAd) func arutanaBannerDidTapAd()`
- **説明**: ユーザーが広告をタップした際に呼び出されます。タップイベントに対応する処理を実装します。
