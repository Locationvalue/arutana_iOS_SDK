# Arutana 広告SDK モーダル広告導入手順

このマニュアルでは、Arutana 広告SDKを使用してモーダル広告（インタースティシャル広告）をアプリケーションに統合する手順を説明します。

## 必要条件

- [SDKインストール手順](./sdk_install.md)を参考に、Arutana SDK がプロジェクトにインストールされていること。
- Xcode 開発環境が設定されていること。

## 実装手順

### 1. `ViewController.m` の設定

`ViewController.m` ファイルにモーダル広告のコードを追加します。以下のコードは Arutana 広告SDK を使ってモーダル広告を表示するための実装例です。

## コード例

※ コードブロック記号を変換しています

```objc
#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaInterstitialDelegate>

@property (nonatomic) ArutanaInterstitial *interstitial;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // インタースティシャル広告を初期化
    self.interstitial = [[ArutanaInterstitial alloc] init];
    self.interstitial.delegate = self;
    self.interstitial.rootViewController = self;
    [self.interstitial setLocationId:@"4"]; // 広告枠IDを指定
    [self.interstitial setUserId:@"xxxx"]; // ユーザーIDを設定
    [self.interstitial setEnableTestMode:YES]; // テストモードを有効化（リリース時は削除）
    [self.interstitial preload]; // 広告リクエストを実行して事前に広告をロード
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.interstitial preload]; // 画面が再表示された時に広告を準備
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.interstitial dismiss]; // 画面が閉じられる時に広告を破棄
}

// 広告リロードボタンが押された時の処理
- (IBAction)didTapReloadButton:(id)sender {
    [self.interstitial preload]; // 広告を再度準備
}

#pragma mark - ArutanaInterstitialDelegate

// 広告が正常に受信されたときの処理
- (void)arutanaInterstitialReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Received an ad.");
    [self.interstitial show]; // 広告がロードされたら表示
}

// 広告が表示されたときの処理
- (void)arutanaInterstitialShowAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Show ad");
}

// 広告がタップされたときの処理
- (void)arutanaInterstitialDidTapAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Did tap an ad.");
}

// 広告が閉じられたときの処理
- (void)arutanaInterstitialClose:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Closed interstitial ads.");
}

// 広告受信に失敗したときの処理
- (void)arutanaInterstitialFailedToReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial code:(kArutanaErrorCode)code {
    NSLog(@"Failed to receive an ad.");
}

@end
```

### 2. モーダル広告の表示準備と表示

広告は `preload` メソッドで事前に読み込みますが、実際に広告を表示するには、`arutanaInterstitialReceiveAd` デリゲートが呼び出された際に `show` メソッドを実行する必要があります。以下のように、広告を受信したタイミングで `show` メソッドを呼び出してください。

```objc
- (void)arutanaInterstitialReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Received an ad.");
    [self.interstitial show]; // 広告がロードされたら表示
}
```

### 3. 広告表示の動作確認

広告の動作を確認するために、以下の条件でアプリを実行してください。

1. **テストモードを有効化**
   テストモードが有効化されていることを確認します。
   ```objc
   [self.interstitial setEnableTestMode:YES];
   ```
   **注意**: 本番環境でリリースする際は、必ずテストモードの設定を削除してください。

2. **ユーザーIDを設定**
   ログイン中のユーザーIDを `setUserId` メソッドで設定します。
   ```objc
   [self.interstitial setUserId:@"xxxx"];
   ```

### 4. 広告イベントのハンドリング

Arutana SDK のデリゲートメソッドを使用して、広告の受信やタップに対する処理を実装します。以下のメソッドを適宜実装してください。

- **`arutanaInterstitialDidTapAd`**
  ユーザーが広告をタップした際に呼び出されます。
  
- **`arutanaInterstitialReceiveAd`**
  広告が正常に受信された際に呼び出されます。
  
- **`arutanaInterstitialFailedToReceiveAd`**
  広告の受信に失敗した際に呼び出されます。

### 5. テストモードの解除（本番リリース時）

アプリを本番リリースする前に、テストモードを無効にする必要があります。以下の行を削除またはコメントアウトしてください。

```objc
[self.interstitial setEnableTestMode:YES];
```

これで、本番環境で広告が正しく表示されます。

## まとめ

以上で、Arutana 広告SDK を使用したモーダル広告の実装は完了です。このマニュアルに従って、正しく広告を表示できることを確認してください。

# サンプルコード

- [Objective-C](https://github.com/Locationvalue/arutana_iOS_SDK/blob/main/InterstitialAdsObjC/ViewController.m)
- [Swift](https://github.com/Locationvalue/arutana_iOS_SDK/blob/main/InterstitialAdsSwift/ViewController.swift)
