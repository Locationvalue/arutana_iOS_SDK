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
    
    self.banner = [[ArutanaBanner alloc] initWithLocationId:@"1" adType:ArutanaAdType_Large];
    [self.banner addAdContainerView:self.adView]; // 広告Viewを配置するViewを指定
    self.banner.delegate = self;
    [self.banner setUserId:@"1"];
    [self.banner setEnableTestMode:YES];
    [self.banner loadRequest]; // 広告リクエスト
    
}

- (void)arutanaBannerDidTapAd { 
    NSLog(@"Did tap an ad.");
}

- (void)arutanaBannerReceiveAd { 
    NSLog(@"Received an ad.");
}

- (void)arutanaBannerFailedToReceiveAd:(kArutanaErrorCode)code { 
    NSLog(@"Failed to receive an ad.");
    
    switch (code) {
        case kArutanaErrorCodeCommunicationError:
        case kArutanaErrorCodeExceedLimit:
        case kArutanaErrorCodeNoAd:
            break;
        case kArutanaErrorCodeUnknown:
            break;
        case kArutanaErrorCodeReceivedFiller:
            break;
        case kArutanaErrorCodeNeedConnection:
            break;
        case kArutanaErrorCodeTemplateFailed:
            break;
    }
}

@end
