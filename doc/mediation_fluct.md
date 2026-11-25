# iOS SDK Fluct メディエーション

# はじめに

Arutana の広告がない広告枠では、Fluct の広告を代わりに表示できます（メディエーション）。
本項では、Fluct の広告を表示するためにアプリに追加するもの（Fluct アダプターと FluctSDK）と、その設定を示します。

開発環境に Xcode を使用することを前提とします。

### 対応バージョン

Xcode 26.0.1 以降
iOS 13.0 以降
Arutana SDK 0.1.3 以降
Fluct アダプター 0.0.1
FluctSDK 6.45.1 以降（動作を確認した版: 6.45.1）

### Fluct の広告を表示する条件

次の条件をすべて満たす場合に、Fluct の広告を表示します。

- 広告枠に、Arutana の担当者が Fluct の設定をしている
- Arutana から配信する広告がない
- アプリに Fluct アダプターと FluctSDK が組み込まれている

次の場合は Fluct の広告を表示せず、これまでどおりの通知をします。

- 通信エラー・オフラインなど、Arutana の広告を取得できなかった場合
- 表示回数の上限（フリークエンシーキャップ）に達している場合

### 対応する広告

| 広告 | Fluct の広告 |
|---|---|
| バナー広告 | 320×100 のバナー |
| インタースティシャル広告 | 300×250 のバナーを、Arutana のインタースティシャル（モーダル）の中に表示 |
| 動画広告 | 対象外 |

### 導入の流れ

1\. Fluct アダプターを追加します
<br>↓<br>
2\. FluctSDK を追加します
<br>↓<br>
3\. ビルド設定と Info.plist を設定します

広告表示の実装（コード）の変更は不要です。

# 1. Fluct アダプターを追加する

Arutana SDK（Arutana.xcframework）はこれまでどおり追加してください（Embed & Sign）。

### ダウンロードする

配布リポジトリの Frameworks から Arutana-fluct-adapter.xcframework.zip をダウンロードしてください。

### プロジェクトに追加する

ダウンロードした ZIP ファイルを解凍し、"Arutana-fluct-adapter.xcframework"をプロジェクトナビゲータの任意の場所にドラッグ&ドロップするか、右クリック > Add Files to ... を選択し、"Copy items if needed"にチェックがついていることを確認して、Finish を押します。

### Embed に Do Not Embed を選択する

Fluct アダプターは静的なライブラリです。Arutana.xcframework とは設定が異なりますので、ご注意ください。

1\. Xcode のプロジェクト設定画面を開いてください
2\. 該当のアプリのターゲットを選択してください
3\. General タブを選択し、Frameworks, Libraries, and Embedded Content までスクロールしてください
4\. Arutana-fluct-adapter.xcframework の Embed に Do Not Embed を選択してください

# 2. FluctSDK を追加する

FluctSDK は、Fluct アダプターには含まれていません。アプリに追加してください。

### CocoaPods を使用する

1\. 次の行をプロジェクトの Podfile に追加します。
pod 'FluctSDK', '>= 6.45.1'
2\. pod install を実行します。

### Swift Package Manager を使用する

1\. Xcode で File > Add Package Dependencies... を開きます。
2\. 次の URL を入力し、FluctSDK を追加します。Dependency Rule は 6.45.1 以降になるよう指定してください。
https://github.com/voyagegroup/FluctSDK-iOS-Swift-Package

Swift Package Manager の場合は、次の章の Other Linker Flags の設定が必要です。

詳しくは、Fluct のスタートガイドを御覧ください。
https://voyagegroup.github.io/FluctSDK-Doc/#/fluctsdk-ios/start

# 3. ビルド設定と Info.plist を設定する

### Other Linker Flags に -ObjC を追加する

Target > Build Settings > Other Linker Flags に `-ObjC` を追加してください。
CocoaPods で FluctSDK を追加した場合は、自動で追加されます。

`-ObjC` がない場合、Arutana SDK が Fluct アダプターを見つけられず、Fluct の広告は表示されません。

### SKAdNetwork と AppTrackingTransparency に対応する

Info.plist に、Fluct が指定する SKAdNetworkItems を追加してください。
トラッキングの許可を求める場合は、NSUserTrackingUsageDescription を設定してください。

手順と SKAdNetworkItems の一覧は、Fluct の次のページを御覧ください。
https://voyagegroup.github.io/FluctSDK-Doc/#/fluctsdk-ios/others/ios14
https://voyagegroup.github.io/FluctSDK-Doc/#/fluctsdk-ios/others/skadnetwork

App-Bound Domains は設定しないでください（Fluct の指定です）。

# 広告の表示について

### バナー広告

- Fluct の広告は、`addAdContainerView` で指定した View の上端中央に、320×100 で表示します。広告を配置する View は、幅 320pt・高さ 100pt 以上にしてください。
- Fluct は、320×100 の枠にも 320×50 の広告を返すことがあります（Fluct の仕様）。その場合は、320×100pt の領域の上下の中央に表示します。
- `addAdContainerView` で View を指定していない場合は、Fluct の広告を表示しません。
- Fluct の広告は自動で切り替わりません（ローテーションしません）。広告を更新する場合は、Arutana の広告と同じく `loadRequest()` を呼び直してください。

### インタースティシャル広告

- Fluct の 300×250 の広告を、Arutana のインタースティシャルの中に表示します。画面の幅に収まらない場合は、縦横の比率を保って縮小します（拡大はしません）。
- Fluct を設定した広告枠では、広告の視認性を確保するため、`setWidth` で既定値（0.7）より狭くしないでください。
- Fluct の広告を表示している間は、「詳細はこちら」ボタンと注意書きを表示しません。
- `rootViewController` の設定と `preload()` / `show()` の呼び出しは、これまでどおりです。

### Delegate の通知

Fluct の広告も、Arutana の広告と同じ Delegate メソッドで通知します。

| 状況 | バナー広告 | インタースティシャル広告 |
|---|---|---|
| Fluct の広告を受信した | arutanaBannerReceiveAd | arutanaInterstitialReceiveAd |
| Fluct の広告もなかった | arutanaBannerFailedToReceiveAd（.arutanaErrorCodeNoAd） | arutanaInterstitialFailedToReceiveAd（.arutanaErrorCodeNoAd） |
| Fluct の広告がタップされた | arutanaBannerDidTapAd | arutanaInterstitialDidTapAd |
| 受信した Fluct の広告が、後から表示できなくなった | arutanaBannerFailedToReceiveAd（.arutanaErrorCodeNoAd） | arutanaInterstitialFailedToReceiveAd（.arutanaErrorCodeNoAd）※ |

Fluct の広告の受信を 5 秒待っても完了しない場合は、Fluct の広告もなかったものとして通知します。

Fluct の広告は、受信を通知した後でも、Fluct 側のエラーで表示できなくなることがあります。その場合は、受信の通知の後に失敗を通知します。バナー広告では枠が空になるので、必要に応じて広告を取り直すか、枠を隠してください。

※ インタースティシャル広告では、まだ表示していない広告だけが対象です。この通知の後に `show()` を呼んでも、その広告は表示されません。表示中の広告で起きた場合は、空のモーダルを残さないようモーダルを閉じ、arutanaInterstitialClose を通知します。

### テストモードについて

Fluct のバナー広告にはテストモードがありません。`setEnableTestMode(true)` を指定しても、Fluct からは通常の広告が返ります。
テストモードを有効にすると、Fluct アダプターの詳細なログを出力します。

# うまく表示されない場合

まず、ログを出力して状況を確認してください。

```swift
// 確認が済んだら削除してください
ArutanaLogger.logLevel = .debug
banner.setEnableTestMode(true) // Fluct アダプターの詳細なログも出力します（インタースティシャル広告も同じメソッドです）
```

| ログ | 原因と対処 |
|---|---|
| `Mediation adapter is not available as banner.` / `Mediation adapter is not available as interstitial.` | Fluct アダプターが見つかりません。Arutana-fluct-adapter.xcframework の追加と、Other Linker Flags の `-ObjC` を確認してください |
| `Mediation failed.` | Fluct の広告を受信できませんでした。Fluct がエラーを返した場合は、直前の `didFailToStoreAd` のログに Fluct のエラー内容が出力されます |
| `Mediation start.` が出ない | Arutana の広告を受信したか、広告枠に Fluct の設定がありません。広告枠の設定は Arutana の担当者にお問い合わせください |
