//
//  ViewController.m
//  BannerAdsObjC
//
//  Created by MacBookPro002 on 2024/05/27.
//

#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaManagerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *adView;
//@property (nonatomic) ArutanaManagerViewController *arutana;
@property (nonatomic) ArutanaBanner *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     locationID:  管理画面から払い出された広告枠ID
     adType:      枠サイズ
                  kADG_AdType_Sp：320x50, kADG_AdType_Large:320x100,
                  kADG_AdType_Rect:300x250, kADG_AdType_Tablet:728x90,
                  kADG_AdType_Free:自由設定
     rootViewController: 広告を配置するViewController
     */
//    self.arutana = [[ArutanaManagerViewController alloc] initWithLocationID:@"48547"
//                                                                     adType:ArutanaAdType_Sp
//                                                         rootViewController:self];
//    
//    [self.arutana addAdContainerView:self.adView]; // 広告Viewを配置するViewを指定
//    self.arutana.delegate = self;
//    [self.arutana setEnableTestMode:YES];
//    [self.arutana loadRequest]; // 広告リクエスト
    
    self.banner = [[ArutanaBanner alloc] initWithLocationID:@"48547" adType:ArutanaAdType_Sp];
    [self.banner addAdContainerView:self.adView]; // 広告Viewを配置するViewを指定
    self.banner.delegate = self;
    [self.banner setEnableTestMode:YES];
    [self.banner loadRequest]; // 広告リクエスト
    
}


@end
