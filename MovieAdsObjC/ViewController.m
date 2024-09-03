//
//  ViewController.m
//  MovieAdsObjC
//
//  Created by ARUTANA.
//

#import "ViewController.h"
#import <Arutana/Arutana-Swift.h>
#import <Arutana/ArutanaConstants.h>

@interface ViewController () <ArutanaMovieAdDelegate>
@property (nonatomic) ArutanaMovieAd *movieAd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieAd = [[ArutanaMovieAd alloc] init];
    [self.movieAd setLocationId:@"6"];// 管理画面から払い出された広告枠ID
    self.movieAd.delegate = self;
    [self.movieAd setEnableTestMode:YES];
    [self.movieAd setUserId:@"1"];
    [self.movieAd setPositionY:-100];
    self.movieAd.rootViewController = self;
    
    [self.movieAd preload];
}

- (IBAction)onClick:(id)sender {
    [self.movieAd show];
}


- (void)arutanaMovieNonad {
    // 広告なし
}

- (void)arutanaMovieReceiveAd {
    // 広告取得完了
}

- (void)arutanaMovieShowAd {
    // 広告表示
}

- (void)arutanaMovieDidTapAd {
    // クリック
}

- (void)arutanaMovieClose {
    // クローズ
}

- (void)arutanaMovieStartFull {
    // 全画面開始（動画）
}

- (void)arutanaMovieEndFull {
    // 全画面終了（動画）
}

- (void)arutanaMovieDeinit {
    // インスタンス破棄
}

- (void)arutanaMovieFailedToReceiveAdWithCode:(kArutanaErrorCode)code {
    // 通信エラー
}

@end
