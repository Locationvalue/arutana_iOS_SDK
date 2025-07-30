# モーダル広告および動画広告の表示順序制御について

Arutana広告を実装する際のルールと手順を以下に示します。本マニュアルでは、モーダル広告と動画広告の2種類の広告を適切に表示する方法について説明します。実装ルールに従い、ユーザー体験を損なうことなく、効果的に広告を表示することを目的としています。

## 広告フォーマットの概要

Arutana広告は、以下の2種類のフォーマットを提供します：

1. **モーダル広告**  
   画面中央に表示され、簡単に閉じることができる広告。
2. **動画広告**  
   フルスクリーン形式で表示される動画型の広告。

## 実装ルール

モーダル広告は、動画広告よりも先に表示されます。また、モーダル広告の読み込みが失敗した場合や閉じられた場合に限り、動画広告を表示してください。

1. **モーダル広告の優先表示**  
   - モーダル広告が読み込まれていれば、必ず最初に表示します。

2. **動画広告の表示条件**  
   - モーダル広告の読み込みに失敗した場合。
   - モーダル広告が閉じられた場合。

## 実装例

```objective-c
// ViewController.m
#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaInterstitialDelegate, ArutanaMovieAdDelegate>

@property (nonatomic) ArutanaInterstitial *interstitial; // モーダル広告
@property (nonatomic) ArutanaMovieAd *movieAd;           // 動画広告

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // モーダル広告の初期化
    self.interstitial = [[ArutanaInterstitial alloc] init];
    [self.interstitial setLocationId:@"4"]; // 管理画面から払い出された広告枠ID
    self.interstitial.delegate = self;
    [self.interstitial setEnableTestMode:YES];
    [self.interstitial setTopMargin:100];
    self.interstitial.rootViewController = self;
    [self.interstitial preload]; // モーダル広告をプリロード

    // 動画広告の初期化
    self.movieAd = [[ArutanaMovieAd alloc] init];
    [self.movieAd setLocationId:@"6"]; // 管理画面から払い出された広告枠ID
    self.movieAd.delegate = self;
    [self.movieAd setEnableTestMode:YES];
    [self.movieAd setUserId:@"1"];
    [self.movieAd setTopMargin:0];
    self.movieAd.rootViewController = self;
}

#pragma mark - ArutanaInterstitialDelegate

- (void)arutanaInterstitialReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"モーダル広告を受信しました。");
    [self.interstitial show]; // モーダル広告を表示
}

- (void)arutanaInterstitialClose:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"モーダル広告が閉じられました。");
    self.modalAdDisplayed = YES;
    [self.movieAd preload]; // 動画広告をプリロード
}

- (void)arutanaInterstitialFailedToReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial code:(kArutanaErrorCode)code {
    NSLog(@"モーダル広告の取得に失敗しました。");
    [self.movieAd preload]; // 動画広告をプリロード
}

#pragma mark - ArutanaMovieAdDelegate

- (void)arutanaMovieReceiveAd {
    NSLog(@"動画広告を受信しました。");
    [self.movieAd show]; // 動画広告を表示
}

- (void)arutanaMovieClose {
    NSLog(@"動画広告が閉じられました。");
}

- (void)arutanaMovieFailedToReceiveAdWithCode:(kArutanaErrorCode)code {
    NSLog(@"動画広告の取得に失敗しました。コード: %ld", (long)code);
}

@end
```

## 実装のポイント

1. **広告の初期化とプリロード**  
   - モーダル広告と動画広告は、それぞれ `viewDidLoad` で初期化し、最初にプリロードを行います。

2. **イベントの管理**  
   - `arutanaInterstitialReceiveAd`: モーダル広告が準備できた場合に表示。
   - `arutanaInterstitialClose`: モーダル広告が閉じられた際に動画広告を準備。
   - `arutanaInterstitialFailedToReceiveAd`: モーダル広告が取得に失敗した場合に動画広告を準備。
   - `arutanaMovieReceiveAd`: 動画広告が準備できた場合に表示。

3. **ユーザー体験の最適化**  
   - モーダル広告を優先的に表示することで、ユーザーの負担を軽減します。
   - 失敗時や終了時にも次の広告を準備することで、広告収益の最大化を図ります。

4. **showTopPageのイベント送信の処理タイミング**
   - preloadが呼ばれるタイミングは「表示されるポップアップがない場合」＝ Top画面でイベントを送信しているタイミングとなっています。
   - ログイン機能がTop画面である場合、userIDの取得は`viewWillAppear()`で行うことが多いかと思います。
   - その場合、setUserIDをした後にshowTopPageのイベント送信を呼ぶ必要がある為、.showTopPageのイベント送信の処理は`viewDidAppear()`でご記載ください。

5. **bannerLoadの呼び出しタイミング**
   - ログイン機能がTop画面の場合、userIDの取得後にbannerLoadを呼ぶ必要がある為、bannerLoadの呼び出しは`viewWillAppear()`でご記載ください。

6. **ポップアップとの順番待ちの処理(ModuleAppご利用のお客様向け)**
   - ModuleApps2.0でv1.13.2以上のSDKで「ポップアップの表示時に独自処理を追加」できるようになっています。
   - これを用いて、ポップアップとARUTANAモーダルの表示が同じタイミングで設定されている場合、以下の動作となります。
     - ①ホーム画面でポップアップ表示
     - ②ホームを離脱
     - ③再びホーム画面表示した際にARUTANAモーダルを表示

7. **フローティング広告との順番待ち処理(ModuleAppご利用のお客様向け)**
   - ModuleApp 1.0の場合はフローティング広告 → ARUTANAモーダルの表示順になるように処理追加が必要です。

8. **特定条件下でのポップアップ待ち合わせ処理(ModuleAppご利用のお客様向け)**
   - ModuleApp 1.0、ModuleApp 2.0、ARUTANA SDKを導入されている場合、それぞれ待ち合わせ処理が必要になります。
   - ARUTANA SDKの実装により特定のお客様のアプリにはホーム画面に表示するポップアップ型のコンテンツが合計つ存在することになります。
     - ①フローティング広告（MA1.0）
     - ②アプリ内メッセージモーダル（MA2.0）
     - ③ARUTANA広告モーダル、動画
   - 上記3点が①フローティング→②アプリ内メッセージ→③ARUTANAモーダルの順に、かつ、1つ表示→ホームを離脱→ホームを再表示→次を表示となるように待ち合わせ処理を入れる必要がありますのでご注意ください。

このマニュアルに従い、実装を進めてください。不明点がある場合はお問い合わせください。