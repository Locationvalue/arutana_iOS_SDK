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
//@property (nonatomic) ArutanaManagerViewController *arutana;
@property (nonatomic) ArutanaBanner *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.banner = [[ArutanaBanner alloc] initWithLocationID:@"48547" adType:ArutanaAdType_Sp];
    [self.banner addAdContainerView:self.adView]; // 広告Viewを配置するViewを指定
    self.banner.delegate = self;
    [self.banner setUserId:nil];
    [self.banner setEnableTestMode:YES];
    [self.banner loadRequest]; // 広告リクエスト
    
}

- (void)arutanaBannerDidTapAd { 
    //
}

- (void)arutanaBannerFailedToReceiveAdWithCode:(kArutanaErrorCode)code { 
    //
}

- (void)arutanaBannerReceiveAd { 
    //
}

@end
