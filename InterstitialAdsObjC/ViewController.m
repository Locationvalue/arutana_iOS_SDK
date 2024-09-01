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
    [self.interstitial setLocationID:@"4"]; // 管理画面から払い出された広告枠ID
    self.interstitial.delegate = self;
    [self.interstitial setEnableTestMode:YES];
    [self.interstitial setUserID:nil];
    [self.interstitial setPositionY:-100];
    self.interstitial.rootViewController = self;
    
    //モーダルが見やすいようにライトグレーの背景にする
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)didTapPreloadButton:(id)sender {
    // 広告リクエスト
    [self.interstitial preload];
}

- (IBAction)didTapShowButton:(id)sender {
    // 広告表示
    [self.interstitial show];
}

- (void)arutanaInterstitialNonad:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"NoAd");
}
- (void)arutanaInterstitialReceiveAd:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Received an ad.");
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
    // エラー時のリトライは特段の理由がない限り必ず記述するようにしてください。
    
    switch (code) {
        case kArutanaErrorCodeNeedConnection:// ネットワーク不通
        case kArutanaErrorCodeExceedLimit:// エラー多発
        case kArutanaErrorCodeNoAd:// 広告レスポンスなし
            //non
            break;
        case kArutanaErrorCodeUnknown:
        case kArutanaErrorCodeCommunicationError:
        case kArutanaErrorCodeReceivedFiller:
        case kArutanaErrorCodeTemplateFailed:
            break;
    }
}
@end
