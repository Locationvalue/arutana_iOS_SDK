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
    [self.interstitial setLocationID:@"48549"]; // 管理画面から払い出された広告枠ID
    self.interstitial.delegate = self;
    [self.interstitial setEnableTestMode:YES];
    [self.interstitial setUserId:nil];
    [self.interstitial setPositionY:0];
    self.interstitial.rootViewController = self;
}

- (IBAction)didTapPreloadButton:(id)sender {
    // 広告リクエスト
    [self.interstitial preload];
}

- (IBAction)didTapShowButton:(id)sender {
    // 広告表示
    [self.interstitial show];
}

- (void)arutanaInterstitialReceiveAdWithArutanaInterstitial:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Received an ad.");
}
- (void)arutanaInterstitialFailedToReceiveAdWithArutanaInterstitial:(ArutanaInterstitial * _Nonnull)arutanaInterstitial code:(kArutanaErrorCode)code {
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
            //ArutanaManagerViewControllerは使わない？
//            [arutanaManagerViewController loadRequest];
            break;
    }
}
- (void)arutanaInterstitialDidTapAdWithArutanaInterstitial:(ArutanaInterstitial * _Nonnull)arutanaInterstitial {
    NSLog(@"Did tap an ad.");
}
- (void)arutanaInterstitialClose {
    NSLog(@"Closed interstitial ads.");
}

@end
