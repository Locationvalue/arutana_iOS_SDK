//
//  ViewController.m
//  InterstitialAdsObjC
//
//  Created by MacBookPro002 on 2024/05/28.
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
    [self.interstitial setLocationId:@"48549"]; // 管理画面から払い出された広告枠ID
    self.interstitial.delegate = self;
    [self.interstitial setEnableTestMode:YES];
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

- (void)arutanaManagerViewControllerDidTapAdWithArutanaManagerViewController:(ArutanaManagerViewController * _Nonnull)arutanaManagerViewController { 
    NSLog(@"Received an ad.");
}

- (void)arutanaManagerViewControllerFailedToReceiveAdWithArutanaManagerViewController:(ArutanaManagerViewController * _Nonnull)arutanaManagerViewController code:(kArutanaErrorCode)code { 
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

- (void)arutanaManagerViewControllerReceiveAdWithArutanaManagerViewController:(ArutanaManagerViewController * _Nonnull)arutanaManagerViewController { 
    NSLog(@"Did tap an ad.");
}

- (void)arutanaInterstitialClose {
    NSLog(@"Closed interstitial ads.");
}

@end
