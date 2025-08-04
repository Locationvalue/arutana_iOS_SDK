# Arutana 広告SDK 動画広告導入手順

このマニュアルでは、Arutana 広告SDKを使用して動画広告（ムービー広告）をアプリケーションに統合する手順を説明します。

## 必要条件

- [SDKインストール手順](./sdk_install.md)を参考に、Arutana SDK がプロジェクトにインストールされていること。
- Xcode 開発環境が設定されていること。

## 実装手順

### 1. `ViewController.m` の設定

`ViewController.m` ファイルに動画広告のコードを追加します。以下のコードは Arutana 広告SDK を使って動画広告を表示するための実装例です。

### コード例

```objc
#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaMovieAdDelegate>
@property (nonatomic) ArutanaMovieAd *movieAd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 動画広告の初期化
    self.movieAd = [[ArutanaMovieAd alloc] init];
    self.movieAd.delegate = self;
    self.movieAd.rootViewController = self;
    [self.movieAd setLocationId:@"6"]; // 管理画面から払い出された広告枠IDを設定
    [self.movieAd setUserId:@"1"]; // ログイン中ユーザーの会員IDを設定
    [self.movieAd setEnableTestMode:YES]; // テストモードを有効化（リリース時には削除）
    [self.movieAd preload]; // 広告の表示準備を開始
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.movieAd preload]; // 画面活性化時に広告の表示準備を開始
}

#pragma mark - ArutanaMovieAdDelegate

// 広告が正常に受信されたときの処理
- (void)arutanaMovieReceiveAd {
    NSLog(@"Received an ad.");
    [self.movieAd show]; // 広告がロードされたら必ず表示する
}

// 広告が表示されたときの処理
- (void)arutanaMovieShowAd {
    NSLog(@"Show ad");
}

// 広告がタップされたときの処理
- (void)arutanaMovieDidTapAd {
    NSLog(@"Did tap an ad.");
}

// 広告がクローズされたときの処理
- (void)arutanaMovieClose {
    NSLog(@"Closed movie ad.");
}

// 動画広告が全画面で開始されたときの処理
- (void)arutanaMovieStartFull {
    NSLog(@"Movie started in full screen.");
}

// 動画広告が全画面で終了したときの処理
- (void)arutanaMovieEndFull {
    NSLog(@"Movie ended in full screen.");
}

// 広告受信に失敗したときの処理
- (void)arutanaMovieFailedToReceiveAdWithCode:(kArutanaErrorCode)code {
    NSLog(@"Failed to receive an ad.");
}

@end
```

### 2. 動画広告の表示準備と表示

`preload` メソッドで広告を事前に読み込みますが、実際に広告を表示するには、`arutanaMovieReceiveAd` デリゲートが呼び出された際に `show` メソッドを実行する必要があります。以下のように、広告を受信したタイミングで `show` メソッドを呼び出してください。

```objc
- (void)arutanaMovieReceiveAd {
    NSLog(@"Received an ad.");
    [self.movieAd show]; // 広告がロードされたら必ず表示する
}
```

### 3. 広告表示の動作確認

広告の動作を確認するために、以下の条件でアプリを実行してください。

1. **テストモードを有効化**  
   テストモードが有効化されていることを確認します。  
   ```objc
   [self.movieAd setEnableTestMode:YES];
   ```
   **注意**: 本番環境でリリースする際は、必ずテストモードの設定を削除してください。

2. **ユーザーIDを設定**  
   ログイン中のユーザーIDを `setUserId` メソッドで設定します。
   ```objc
   [self.movieAd setUserId:@"1"];
   ```

### 4. 広告イベントのハンドリング

Arutana SDK のデリゲートメソッドを使用して、広告の受信やタップに対する処理を実装します。以下のメソッドを適宜実装してください。

- **`arutanaMovieDidTapAd`**  
  ユーザーが広告をタップした際に呼び出されます。
  
- **`arutanaMovieReceiveAd`**  
  広告が正常に受信された際に呼び出されます。
  
- **`arutanaMovieFailedToReceiveAdWithCode`**  
  広告の受信に失敗した際に呼び出されます。

- **`arutanaMovieStart`**  
  動画広告が再生された際に呼び出されます。

- **`arutanaMovieFirstQuartile`**  
  動画広告が25%再生された際に呼び出されます。

- **`arutanaMovieMidQuartile`**  
  動画広告が50%再生された際に呼び出されます。

- **`arutanaMovieThirdQuartile`**  
  動画広告が75%再生された際に呼び出されます。

- **`arutanaMovieComplete`**  
  動画広告が再生完了された際に呼び出されます。

- **`arutanaMovieEndFull`**  
  動画広告が全画面終了された際に呼び出されます。

### 5. テストモードの解除（本番リリース時）

アプリを本番リリースする前に、テストモードを無効にする必要があります。以下の行を削除またはコメントアウトしてください。

```objc
[self.movieAd setEnableTestMode:YES];
```

これで、本番環境で広告が正しく表示されます。

## まとめ

以上で、Arutana 広告SDK を使用した動画広告の実装は完了です。このマニュアルに従って、正しく広告を表示できることを確認してください。

# サンプルコード

- [Objective-C](https://github.com/Locationvalue/arutana_iOS_SDK/blob/main/MovieAdsObjC/ViewController.m)
- [Swift](https://github.com/Locationvalue/arutana_iOS_SDK/blob/main/MovieAdsSwift/ViewController.swift)

## 注意事項

### 広告枠IDについて

テスト、本番で広告枠IDが違います。

IDの間違いによる表示間違い事故が発生していますので、IDコピーの際お間違いがないように注意をお願いします。