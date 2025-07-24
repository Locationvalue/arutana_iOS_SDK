# プロトコル: `ArutanaMovieAdDelegate`

## 概要
`ArutanaMovieAdDelegate`プロトコルは、`ArutanaMovieAd`クラスに関連する動画広告の受信、表示、タップ、クローズ、フルスクリーン開始・終了、広告受信失敗などのイベントを通知するためのデリゲートメソッドを定義します。`ArutanaMovieAd`クラスのインスタンスが広告の状態を処理する際に、このプロトコルを実装することでイベントをハンドリングできます。

## メソッド

### `@objc func arutanaMovieReceiveAd()`
- **説明**: 動画広告の受信が完了した際に呼び出されます。広告が正常にロードされたときの処理を実装します。

### `@objc func arutanaMovieShowAd()`
- **説明**: 動画広告が表示された際に呼び出されます。広告の表示開始に対応する処理を実装します。

### `@objc func arutanaMovieDidTapAd()`
- **説明**: ユーザーが動画広告をタップした際に呼び出されます。広告タップ時の処理を実装します。

### `@objc func arutanaMovieClose()`
- **説明**: 動画広告がクローズされた際に呼び出されます。広告のクローズに対応する処理を実装します。

### `@objc func arutanaMovieStartFull()`
- **説明**: 動画広告が全画面で再生を開始した際に呼び出されます。全画面表示開始時の処理を実装します。

### `@objc func arutanaMovieEndFull()`
- **説明**: 動画広告の全画面表示が終了した際に呼び出されます。全画面表示終了時の処理を実装します。

### `@objc func arutanaMovieFailedToReceiveAd(code: kArutanaErrorCode)`
- **説明**: 動画広告の受信に失敗した際に呼び出されます。失敗時のエラーコードを受け取り、適切なエラーハンドリングを行います。
- **パラメータ**:
  - `code`: 動画広告の受信に失敗した際のエラーコード（`kArutanaErrorCode`）
