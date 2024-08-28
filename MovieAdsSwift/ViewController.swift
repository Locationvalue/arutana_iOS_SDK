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
        self.movieAd?.setLocationID("6");// 管理画面から払い出された広告枠ID
        self.movieAd?.delegate = self;
        self.movieAd?.setEnableTestMode(true);
        self.movieAd?.setUserId("1");
        self.movieAd?.setPositionY(pos: -100);
        self.movieAd?.rootViewController = self;
        
        self.movieAd?.preload();
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 広告非表示
        self.movieAd?.dismiss()
    }
    
    @IBAction func onClick(_ sender: Any) {
        print("click");
        // 広告リクエスト
        self.movieAd?.show();
    }
}

extension ViewController:ArutanaMovieAdDelegate {
    func arutanaMovieNonad() {
        // 広告なし
    }
    
    func arutanaMovieReceiveAd() {
        // 広告取得完了
    }
    
    func arutanaMovieShowAd() {
        // 広告表示
    }
    
    func arutanaMovieDidTapAd() {
        // クリック
    }
    
    func arutanaMovieClose() {
        // クローズ
    }
    
    func arutanaMovieStartFull() {
        // 全画面開始（動画）
    }
    
    func arutanaMovieEndFull() {
        // 全画面終了（動画）
    }
    
    func arutanaMovieDeinit() {
        // インスタンス破棄
    }
    
    func arutanaMovieFailedToReceiveAd(code: kArutanaErrorCode) {
        // 通信エラー
    }
        
}
