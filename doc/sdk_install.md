# 広告SDK導入手順

---

## はじめに

このドキュメントでは、iOS向けの広告SDKを導入するための手順を説明します。本手順は、Xcodeを使用するiOS開発環境を前提としています。以下の対応バージョンに基づいてSDKを導入してください。

---

## 対応バージョン

- **Xcode**：13.0 以降
- **iOS**：13.0 以降

---

## 導入手順

### 1. SDK をダウンロードする

1. [こちらのリンク](https://github.com/Locationvalue/arutana_iOS_SDK/raw/refs/heads/main/Arutana.xcframework.zip)からSDKのバイナリファイルをダウンロードしてください。
2. ダウンロードしたZIPファイルを解凍します。`Arutana.xcframework`ディレクトリが作成されていることを確認してください。

### 2. SDKをXcodeプロジェクトに追加

1. `Arutana.xcframework`ディレクトリを、Xcodeのプロジェクトに追加します。
    - Xcodeのプロジェクトナビゲータ内で任意の場所にドラッグ&ドロップするか、プロジェクトナビゲータを右クリックして「Add Files to...」を選択します。
    - "Copy items if needed"にチェックが入っていることを確認し、「Finish」をクリックします。

### 3. Arutana SDKの設定

1. リンクした`Arutana.xcframework`の「Embed」オプションを設定します。誤った設定を行うと、アプリ起動時にクラッシュが発生する可能性があるため、必ず正しい設定を行ってください。
    - Xcodeの「プロジェクト設定画面」を開きます。
    - 該当するアプリのターゲットを選択します。
    - 「General」タブを選択し、下にスクロールして「Frameworks, Libraries, and Embedded Content」を見つけます。
    - リンクした`Arutana.xcframework`の「Embed」オプションを「Embed & Sign」に設定します。

2. 設定が完了したら、プロジェクトをビルドして設定を反映します。

---

## 注意事項

- SDK導入時に発生するビルドエラーやアプリクラッシュの原因の多くは、`Embed`の設定に関連しています。設定後は必ずビルドとテストを行い、動作確認をしてください。
- 対応バージョンに準拠していることを確認し、使用するSDKやターゲットiOSバージョンに応じて設定を見直してください。

### Swift 6 アプリへ導入する場合（v0.1.1 以前の SDK をご利用のアプリ向け）

**v0.1.2 以降の SDK をご利用の場合、この節の手順は不要です。** 通常どおり `import Arutana` で導入・利用できます。

以下は、**v0.1.1 以前の SDK** を Swift 6 アプリで利用する際の回避策です。当該バージョンの SDK は Swift 5 言語モードでビルドされていますが、`swiftinterface` を含む `xcframework` として配布しているため、Swift 6 アプリにも導入は可能です。

ただし Swift 6 では concurrency チェックが厳格になるため、**v0.1.1 以前の SDK 利用時のみ**、アプリ側で以下の対応が必要になる場合があります。

1. SDK を import するファイルでは、通常の import の代わりに `@preconcurrency import Arutana` を使用してください。

```swift
@preconcurrency import Arutana
import UIKit
```

2. `UIViewController` や `UIView` を渡す処理、`show()` / `dismiss()` などの表示処理は `@MainActor` を付けた型、または `Task { @MainActor in ... }` / `await MainActor.run { ... }` の中で実行してください。

```swift
@MainActor
final class SampleViewController: UIViewController {
    private let interstitial = ArutanaInterstitial()

    func showAd() {
        interstitial.rootViewController = self
        interstitial.show()
    }
}
```

3. delegate を実装する型に `@MainActor` を付ける場合は、concurrency チェックを回避するために conformance 側へ `@preconcurrency` を付与してください。

```swift
@MainActor
final class SampleViewController: UIViewController, @preconcurrency ArutanaInterstitialDelegate {
    func arutanaInterstitialClose(arutanaInterstitial: ArutanaInterstitial) {
        Task { @MainActor in
            self.closeButton.isHidden = false
        }
    }
}
```

4. delegate コールバック内で UI を更新する場合も、main actor 上で処理してください。

```swift
func arutanaInterstitialClose(arutanaInterstitial: ArutanaInterstitial) {
    Task { @MainActor in
        self.closeButton.isHidden = false
    }
}
```

5. 上記の対応は、必要に応じて Arutana SDK を利用する画面やラッパー層に限定して適用してください。

**v0.1.2 以降へアップデートした場合**は、上記の `@preconcurrency import` や `@preconcurrency` 付き delegate 実装は削除して問題ありません。

---

これでSDKの導入が完了です。引き続きアプリケーションの開発を進めてください。
