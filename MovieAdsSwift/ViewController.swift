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
        self.movieAd?.delegate = self;
        self.movieAd?.rootViewController = self;
        self.movieAd?.setLocationId("6"); // 管理画面から払い出された広告枠ID
        self.movieAd?.setUserId("1"); // ログイン中ユーザーの会員ID
        self.movieAd?.setEnableTestMode(true); // テストモードを有効化. 本番リリース時は削除
        self.movieAd?.preload(); // 広告の表示準備を開始
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.movieAd?.preload(); // 画面活性化時に広告の表示準備を開始
    }
    
    @IBAction func didTapReloadButton(_ sender: Any) {
        self.movieAd?.preload()
    }
}

extension ViewController:ArutanaMovieAdDelegate {
    
    func arutanaMovieReceiveAd() {
        print("Received an ad.");
        _ = self.movieAd?.show(); // 広告の表示準備が完了したら広告を表示する
    }
    
    func arutanaMovieShowAd() {
        print("Show ad");
    }
    
    func arutanaMovieDidTapAd() {
        print("Did tap an ad.");
    }
    
    func arutanaMovieClose() {
        print("Close");
    }
    
    func arutanaMovieStartFull() {
        print("Start fullscreen");
    }
    
    func arutanaMovieEndFull() {
        print("End fullscreen");
    }
    
    func arutanaMovieFailedToReceiveAd(code: kArutanaErrorCode) {
        print("Failed to receive an ad.")
    }

}
