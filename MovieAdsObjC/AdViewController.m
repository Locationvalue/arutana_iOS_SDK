//
//  AdViewController.m
//  MovieAdsObjC
//
//  Created by MacBookPro002 on 2024/06/27.
//

#import "AdViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface AdViewController () <ArutanaVIAdManagerDelegate>
@property (weak, nonatomic) IBOutlet UIView *adWrapperView;
@property (nonatomic) ArutanaVIAdManager *manager;
@end

@implementation AdViewController
//@IBOutlet private weak var adWrapperView: UIView!
//
//private var manager:ArutanaVIAdManager?;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.manager = [[ArutanaVIAdManager alloc] initWithPubId:@"1" delegate:self];
    [self.manager setPreloadType:kArutanaVPreloadTypeAll];
    //    self.manager = ArutanaVIAdManager(pubId: "1", delegate: self);
    //    self.manager?.preloadType = .Arutana_PRELOAD_ALL;
    
    [self.manager load];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (UIViewController * _Nonnull)viewControllerForPresentingModalView {
    return self;
}

- (void)onReadyToPlayAd {
//    [self.manager showAdForViewWithView:self.adWrapperView];
}

- (void)onCloseAd {
    [self.manager removeAd];
}

@end
