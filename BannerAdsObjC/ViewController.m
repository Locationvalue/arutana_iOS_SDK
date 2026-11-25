//
//  ViewController.m
//  BannerAdsObjC
//
//  Created by ARUTANA.
//

#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaBannerDelegate>

@property (weak, nonatomic) IBOutlet UIView *adView;
@property (nonatomic) ArutanaBanner *banner;

@end

// YES にすると、dev 環境の Fluct 確認用の枠（1132）を表示する。この枠は Arutana の広告を返さず、Fluct の広告を表示する
static const BOOL kUseFluctTestPlacement = NO;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (kUseFluctTestPlacement) {
        self.banner = [[ArutanaBanner alloc] initWithLocationId:@"1132" adType:ArutanaAdType_Sp]; // Fluct 確認用の広告枠ID
        [self.banner setEnableDevMode:YES]; // dev 環境に接続する
    } else {
        self.banner = [[ArutanaBanner alloc] initWithLocationId:@"1" adType:ArutanaAdType_Sp]; // 広告枠IDを指定して初期化
    }
    [self.banner addAdContainerView:self.adView]; // 広告Viewを配置するViewを指定
    self.banner.delegate = self;
    [self.banner setUserId:@"1"]; // ログイン中のユーザーの会員ID
    [self.banner setEnableTestMode:YES]; // テストモードを有効化. 本番リリース時は削除
    [self.banner loadRequest]; // 広告表示
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.banner loadRequest]; // 画面復帰時に広告を再表示する
}

- (void)arutanaBannerDidTapAd { 
    NSLog(@"Did tap an ad.");
}

- (void)arutanaBannerReceiveAd { 
    NSLog(@"Received an ad.");
}

- (void)arutanaBannerFailedToReceiveAd:(kArutanaErrorCode)code { 
    NSLog(@"Failed to receive an ad.");
}

@end
