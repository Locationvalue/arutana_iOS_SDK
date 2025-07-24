# プロトコル: `ArutanaInterstitialDelegate`

## 概要
`ArutanaInterstitialDelegate`プロトコルは、`ArutanaInterstitial`クラスに関連するインタースティシャル広告の受信、表示、タップ、クローズ、受信失敗などのイベントを通知するためのデリゲートメソッドを定義します。`ArutanaInterstitial`クラスのインスタンスが広告の状態を処理する際に、このプロトコルを実装することでイベントをハンドリングできます。

## メソッド

### `@objc(arutanaInterstitialReceiveAd:) func arutanaInterstitialReceiveAd(arutanaInterstitial: ArutanaInterstitial)`
- **説明**: インタースティシャル広告の受信が完了した際に呼び出されます。広告が正常にロードされたときの処理を実装します。
- **パラメータ**:
  - `arutanaInterstitial`: 対象の`ArutanaInterstitial`インスタンス

### `@objc(arutanaInterstitialShowAd:) func arutanaInterstitialShowAd(arutanaInterstitial: ArutanaInterstitial)`
- **説明**: インタースティシャル広告が表示された際に呼び出されます。広告の表示開始に対応する処理を実装します。
- **パラメータ**:
  - `arutanaInterstitial`: 対象の`ArutanaInterstitial`インスタンス

### `@objc(arutanaInterstitialDidTapAd:) func arutanaInterstitialDidTapAd(arutanaInterstitial: ArutanaInterstitial)`
- **説明**: ユーザーがインタースティシャル広告をタップした際に呼び出されます。広告タップ時の処理を実装します。
- **パラメータ**:
  - `arutanaInterstitial`: 対象の`ArutanaInterstitial`インスタンス

### `@objc(arutanaInterstitialClose:) func arutanaInterstitialClose(arutanaInterstitial: ArutanaInterstitial)`
- **説明**: インタースティシャル広告がクローズされた際に呼び出されます。広告のクローズに対応する処理を実装します。
- **パラメータ**:
  - `arutanaInterstitial`: 対象の`ArutanaInterstitial`インスタンス

### `@objc(arutanaInterstitialFailedToReceiveAd:code:) func arutanaInterstitialFailedToReceiveAd(arutanaInterstitial: ArutanaInterstitial, code: kArutanaErrorCode)`
- **説明**: インタースティシャル広告の受信に失敗した際に呼び出されます。失敗時のエラーコードを受け取り、適切なエラーハンドリングを行います。
- **パラメータ**:
  - `arutanaInterstitial`: 対象の`ArutanaInterstitial`インスタンス
  - `code`: インタースティシャル広告の受信に失敗した際のエラーコード（`kArutanaErrorCode`）