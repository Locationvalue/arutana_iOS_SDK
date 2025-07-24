# 列挙型: `kArutanaErrorCode`

## 概要
`kArutanaErrorCode`は、広告の受信処理におけるエラーコードを表す列挙型です。広告の受信が失敗した際に、原因を示すために利用されます。

## 値一覧

### `kArutanaErrorCodeUnknown`
- **説明**: 不明なエラーが発生しました。

### `kArutanaErrorCodeCommunicationError`
- **説明**: 通信エラーが発生しました。サーバーへの接続に問題がある可能性があります。

### `kArutanaErrorCodeReceivedFiller`
- **説明**: 広告リクエストが成功したが、フィラー広告（埋め合わせ用の広告）を受信しました。

### `kArutanaErrorCodeNoAd`
- **説明**: 広告在庫がなく、広告を取得できませんでした。

### `kArutanaErrorCodeNeedConnection`
- **説明**: ネットワーク接続が必要です。インターネットに接続されていないため、広告を取得できません。

### `kArutanaErrorCodeExceedLimit`
- **説明**: 広告表示の上限を超えたため、広告を取得できません。

### `kArutanaErrorCodeTemplateFailed`
- **説明**: 広告テンプレートの取得や処理に失敗しました。
