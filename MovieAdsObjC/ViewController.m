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
    self.movieAd.delegate = self;
    self.movieAd.rootViewController = self;
    [self.movieAd setLocationId:@"6"];// 管理画面から払い出された広告枠ID
    [self.movieAd setUserId:@"1"]; // ログイン中ユーザーの会員ID
    [self.movieAd setEnableTestMode:YES]; // テストモードを有効化. 本番リリース時は削除
    [self.movieAd preload]; // 広告の表示準備を開始
}

- (void)viewWillAppear:(BOOL)animated {
    [self.movieAd preload]; // 画面活性化時に広告の表示準備を開始
}

- (IBAction)didTapReloadButton:(id)sender {
    [self.movieAd preload];
}

- (void)arutanaMovieReceiveAd {
    // 広告取得完了
    [self.movieAd show];// 広告の表示準備が完了したら広告を表示する
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

- (void)arutanaMovieFailedToReceiveAdWithCode:(kArutanaErrorCode)code {
    // 通信エラー
}

@end
