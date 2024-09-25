//
//  ViewController.m
//  InterstitialAdsObjC
//
//  Created by ARUTANA.
//

#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaInterstitialDelegate>

@property (nonatomic) ArutanaInterstitial *interstitial;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interstitial = [[ArutanaInterstitial alloc] init];
    self.interstitial.delegate = self;
    self.interstitial.rootViewController = self;
    [self.interstitial setLocationId:@"4"]; // 管理画面から払い出された広告枠ID
    [self.interstitial setUserId:@"xxxx"]; // ログイン中ユーザーの会員ID
    [self.interstitial setEnableTestMode:YES]; // テストモードを有効化. 本番リリース時は削除
    [self.interstitial preload]; // 広告の表示準備を開始
}

- (void)viewWillAppear:(BOOL)animated {
    [self.interstitial preload]; // 画面活性化時に広告の表示準備を開始
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.interstitial dismiss]; // 画面非活性時には広告を初期化
}

- (IBAction)didTapReloadButton:(id)sender {
    [self.interstitial preload];
}

- (void)arutanaInterstitialReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Received an ad.");
    [self.interstitial show]; // 広告の表示準備が完了したら広告を表示する
}

- (void)arutanaInterstitialShowAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Show ad");
}

- (void)arutanaInterstitialDidTapAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Did tap an ad.");
}

- (void)arutanaInterstitialClose:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Closed interstitial ads.");
}

- (void)arutanaInterstitialFailedToReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial code:(kArutanaErrorCode)code {
    NSLog(@"Failed to receive an ad.");
}

@end
