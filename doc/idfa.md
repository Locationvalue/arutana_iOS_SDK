# IDFAを利用した配信実施時の実装方法について

## IDFA取得の実装方法

当項目は、ARUTANA配信でIDFAを利用した配信を実施する場合に必要になる工程となります。  
従来、広告の読み込みのために実行していたコードを、以下の通り変更ください。

下記のサンプルコードはモーダル広告の際の処理を記載しておりますが、同様に**バナー、動画広告**でもIDFAを取得するための処理を追加してください。

```swift
// 従来
self.interstitial.preload();

// IDFAを取得する場合
AdTrackingUtility.shared.requestTrackingAuthorization { idfa in
    DispatchQueue.main.async {
        // 取得したIDFAを広告クラスにセットします。
        self.interstitial?.setIDFA(idfa);
        // 従来の広告読込コードをここに実装ください
        self.interstitial?.preload();
    }
}
```

---

IDFAを取得する必要があるが、**ユーザー許諾をアプリで取得していない**場合には、下記処理1,2を確認してください。

## 1. `Info.plist` における `NSUserTrackingUsageDescription` の追加

### 1.1 概要

iOS 14 以降では、ATT によってユーザーの追跡許可を求める際に、必ず `Info.plist` に `NSUserTrackingUsageDescription` キーを追加し、その説明文を設定しなければなりません（[Apple Developer](https://qiita.com/charcoJP/items/e1b93e05afbd0c506b6c?utm_source=chatgpt.com)）。

このキーが存在しない場合：

- アプリが**起動時や許可ダイアログを呼び出したタイミングでクラッシュ**する
- Appleの**審査でリジェクトされる**

> ※ iOS 13 以前では ATT 自体が存在しないため、このキーは影響しませんが、iOS 14+ に備えて設定が必要です。

### 1.2 設定手順

1. Xcodeでプロジェクトを開く  
   - プロジェクトナビゲーターから `Info.plist` を選択  
2. `NSUserTrackingUsageDescription` キーを追加  
   - `+` ボタンで新規エントリ追加  
   - `Key` に **Privacy - Tracking Usage Description**（エディタ上では `NSUserTrackingUsageDescription`）を入力  
   - `Value` に「ユーザーに表示したい、なぜトラッキングが必要かを説明する文言」を入力  

例：

```xml
<key>NSUserTrackingUsageDescription</key>
<string>広告をパーソナライズするためにトラッキングを許可してください。</string>
```

---

## 2. `AppTrackingTransparency.framework` の弱結合（Optional Linking）

### 2.1 なぜ弱結合が必要か

- AppTrackingTransparency.framework は iOS 14 以降でのみ利用できるフレームワークであり、iOS 13 およびそれ以前には存在しません ([Qiita](https://stackoverflow.com/questions/67575259/android-which-dependency-to-use-if-needs-advertisingidclient?utm_source=chatgpt.com))。
- もし通常の強制リンク（Required）にしてしまうと、**iOS 13 でアプリを実行しようとした際に「フレームワークが見つからない」エラーが発生し、クラッシュしてしまいます** ([Qiita](https://qiita.com/f_nishio/items/e3665a93b6e061f9ea0f?utm_source=chatgpt.com))。
- そこで、**Xcode のビルド設定で AppTrackingTransparency.framework を “Optional” に設定し、弱結合 (Weak Linking) にする**必要があります。これにより、iOS 13 実行時にはフレームワークの読み込みが行われず、ランタイムエラーを防ぎます 。

### 2.2 設定手順（Xcode）

1. プロジェクト設定を開く
   - Xcode のプロジェクトナビゲーターからターゲットを選択し、**Build Phases** タブを開きます。
2. Link Binary With Libraries セクションを展開
   - **+** ボタンをクリックしてフレームワーク追加ダイアログを開き、**AppTrackingTransparency.framework** を追加します ([Qiita](https://stackoverflow.com/questions/67575259/android-which-dependency-to-use-if-needs-advertisingidclient?utm_source=chatgpt.com))。
3. 追加した AppTrackingTransparency.framework を “Optional” に変更
   - 追加後、右側の列にある「Status」が Required になっているはずなので、ドロップダウンメニューをクリックし、**“Optional”** を選択します ([Qiita](https://qiita.com/f_nishio/items/e3665a93b6e061f9ea0f?utm_source=chatgpt.com))。
4. ビルド設定が反映されることを確認
   - iOS 13 のシミュレータまたは実機を使い、アプリが起動時にクラッシュしないことを確認してください。
   - iOS 14 以上では、Optional でリンクされているため、ATT API を正常に呼び出せるはずです ([Qiita](https://qiita.com/f_nishio/items/e3665a93b6e061f9ea0f?utm_source=chatgpt.com))。

> iOS 14 以上では、Optional でリンクされているため、ATT API を正常に呼び出せます。
