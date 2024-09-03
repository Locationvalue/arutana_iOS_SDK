//
//  ViewController.swift
//  MovieAdsSwift
//
//  Created by ARUTANA on 2024/05/28.
//

import UIKit
import Arutana

class ViewController: UIViewController {
    private var movieAd:ArutanaMovieAd?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieAd = ArutanaMovieAd();
        self.movieAd?.setLocationId("6");// 管理画面から払い出された広告枠ID
        self.movieAd?.delegate = self;
        self.movieAd?.setEnableTestMode(true);
        self.movieAd?.setUserId("1");
        self.movieAd?.setPositionY(pos: -100);
        self.movieAd?.rootViewController = self;
        
//        self.movieAd?.preload();
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 広告非表示
        self.movieAd?.dismiss()
    }
    
    @IBAction func didTapPreloadButton(_ sender: Any) {
        print("didTapPreloadButton");
        // 広告リクエスト
        self.movieAd?.preload()
    }

    @IBAction func didTapShowButton(_ sender: Any) {
        print("didTapShowButton");
        // 広告表示
        _ = self.movieAd?.show();
    }
}

extension ViewController:ArutanaMovieAdDelegate {
    func arutanaMovieNonad() {
        // 広告なし
        print("NoAd");
    }
    
    func arutanaMovieReceiveAd() {
        // 広告取得完了
        print("Received an ad.");
        // 広告表示
//        _ = self.movieAd?.show();
    }
    
    func arutanaMovieShowAd() {
        // 広告表示
        print("Show ad");
    }
    
    func arutanaMovieDidTapAd() {
        // クリック
        print("Did tap an ad.");
    }
    
    func arutanaMovieClose() {
        // クローズ
        print("Close");
    }
    
    func arutanaMovieStartFull() {
        // 全画面開始（動画）
        print("Movie start full.");
    }
    
    func arutanaMovieEndFull() {
        // 全画面終了（動画）
        print("Movie end full.");
    }
    
//    func arutanaMovieDeinit() {
//        // インスタンス破棄
//        print("Received an ad.");
//    }
    
    func arutanaMovieFailedToReceiveAd(code: kArutanaErrorCode) {
        // 通信エラー
        print("Failed to receive an ad.")
        // エラー時のリトライは特段の理由がない限り必ず記述するようにしてください。
        
        switch code {
        case .arutanaErrorCodeCommunicationError,
                .arutanaErrorCodeExceedLimit,
                .arutanaErrorCodeNoAd:
            break;
        case .arutanaErrorCodeUnknown:
            break;
        case .arutanaErrorCodeReceivedFiller:
            break;
        case .arutanaErrorCodeNeedConnection:
            break;
        case .arutanaErrorCodeTemplateFailed:
            break;
        @unknown default:
            break;
        }
    }
        
}
