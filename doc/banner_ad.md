# Arutana 広告SDK バナー広告導入手順

このマニュアルでは、Arutana 広告SDKを使用した広告バナーの実装手順を説明します。以下の手順に従って、広告バナーをアプリケーションに統合してください。
開発環境に Xcode を使用することを前提とします。

## 必要条件

- [SDKインストール手順](./sdk_install.md)を参考に、Arutana SDK がプロジェクトにインストールされていること。
- Xcode 開発環境が設定されていること。

## 実装手順

### 1. `ViewController.m` の設定

`ViewController.m` ファイルに広告バナーのコードを追加します。以下のコードは Arutana 広告SDK を使ってバナー広告を表示するための実装例です。

### コード例

```objc
#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaBannerDelegate>

@property (weak, nonatomic) IBOutlet UIView *adView; // 広告を表示するためのビュー
@property (nonatomic) ArutanaBanner *banner; // 広告バナーオブジェクト

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 広告バナーを初期化
    self.banner = [[ArutanaBanner alloc] initWithLocationId:@"1" adType:ArutanaAdType_Sp]; // 広告枠IDを指定
    [self.banner addAdContainerView:self.adView]; // 広告ビューを表示するコンテナを指定
    self.banner.delegate = self;
    [self.banner setUserId:@"1"]; // ユーザーIDを設定
    [self.banner setEnableTestMode:YES]; // テストモードを有効化 (リリース時は削除)
    [self.banner loadRequest]; // 広告リクエストを実行
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.banner loadRequest]; // 画面復帰時に再度広告を読み込む
}

#pragma mark - ArutanaBannerDelegate

// 広告がタップされたときの処理
- (void)arutanaBannerDidTapAd { 
    NSLog(@"Did tap an ad.");
}

// 広告が正常に受信されたときの処理
- (void)arutanaBannerReceiveAd { 
    NSLog(@"Received an ad.");
}

// 広告受信に失敗したときの処理
- (void)arutanaBannerFailedToReceiveAd:(kArutanaErrorCode)code { 
    NSLog(@"Failed to receive an ad.");
}

@end
```

### 2. インターフェースの設定

次に、Interface Builder を使用して、`UIView` を `Storyboard` または `XIB` に追加します。この `UIView` が広告を表示する場所になります。

- Interface Builder で `UIView` をドラッグして、表示したい位置に配置します。
- `adView` プロパティと `UIView` を接続します。

### 3. 広告表示の動作確認

広告の動作を確認するために、以下の条件でアプリを実行してください。

1. **テストモードを有効化**  
   テストモードが有効化されていることを確認します。  
   ```objc
   [self.banner setEnableTestMode:YES];
   ```
   **注意**: 本番環境でリリースする際は、必ずテストモードの設定を削除してください。

2. **ユーザーIDを設定**  
   ログイン中のユーザーIDを `setUserId` メソッドで設定します。
   ```objc
   [self.banner setUserId:@"1"];
   ```

### 4. 広告イベントのハンドリング

Arutana SDK のデリゲートメソッドを使用して、広告の受信やタップに対する処理を実装します。以下のメソッドを適宜実装してください。

- **`arutanaBannerDidTapAd`**  
  ユーザーが広告をタップした際に呼び出されます。
  
- **`arutanaBannerReceiveAd`**  
  広告が正常に受信された際に呼び出されます。
  
- **`arutanaBannerFailedToReceiveAd`**  
  広告の受信に失敗した際に呼び出されます。

### 5. テストモードの解除（本番リリース時）

アプリを本番リリースする前に、テストモードを無効にする必要があります。以下の行を削除またはコメントアウトしてください。

```objc
[self.banner setEnableTestMode:YES];
```

これで、本番環境で広告が正しく表示されます。

## まとめ

以上で、Arutana 広告SDK を使用した広告バナーの実装は完了です。このマニュアルに従って、正しく広告を表示できることを確認してください。

# サンプルコード

- [Objective-C](https://github.com/Locationvalue/arutana_iOS_SDK/blob/main/BannerAdsObjC/ViewController.m)
- [Swift](https://github.com/Locationvalue/arutana_iOS_SDK/blob/main/BannerAdsSwift/ViewController.swift)

## 注意事項

### 広告枠IDについて

テスト、本番で広告枠IDが違います。

IDの間違いによる表示間違い事故が発生していますので、IDコピーの際お間違いがないように注意をお願いします。