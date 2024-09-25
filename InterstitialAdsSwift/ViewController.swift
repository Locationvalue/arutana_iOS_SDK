//
//  ViewController.swift
//  InterstitialAdsSwift
//
//  Created by ARUTANA.
//

import UIKit
import Arutana

class ViewController: UIViewController {
    
    private var interstitial: ArutanaInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.interstitial = ArutanaInterstitial();
        self.interstitial?.rootViewController = self;
        self.interstitial?.delegate = self;
        self.interstitial?.setLocationId("4"); // 管理画面から払い出された広告枠ID
        self.interstitial?.setUserId("xxxx"); // ログイン中ユーザーの会員ID
        self.interstitial?.setEnableTestMode(true); // テストモードを有効化. 本番リリース時は削除
        self.interstitial?.preload(); // 広告の表示準備を開始
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.interstitial?.preload(); // 画面活性化時に広告の表示準備を開始
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        self.interstitial?.dismiss(); // 画面非活性時には広告を初期化
    }
    
    @IBAction func didTapReloadButton(_ sender: Any) {
        self.interstitial?.preload()
    }
}

extension ViewController:ArutanaInterstitialDelegate {
    func arutanaInterstitialReceiveAd(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Received an ad.");
        _ = self.interstitial?.show(); // 広告の表示準備が完了したら広告を表示する
    }
    
    func arutanaInterstitialShowAd(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Show ad");
    }
    
    func arutanaInterstitialClose(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Close");
    }
    

    func arutanaInterstitialFailedToReceiveAd(arutanaInterstitial: Arutana.ArutanaInterstitial, code: kArutanaErrorCode) {
        print("Failed to receive an ad.:\(code)");
    }
    
    func arutanaInterstitialDidTapAd(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Did tap an ad.");
    }
}
