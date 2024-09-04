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
        self.interstitial?.setLocationId("4");    // 管理画面から払い出された広告枠ID
        self.interstitial?.delegate = self;
        self.interstitial?.setEnableTestMode(true);
        self.interstitial?.setUserId(nil);
        self.interstitial?.setTopMargin(100);
        self.interstitial?.rootViewController = self;
        
        self.interstitial?.setAdTextColor(.blue);
        self.interstitial?.setAdBackgroundColor(.brown);
        
        //モーダルが見やすいようにライトグレーの背景にする
//        self.view.backgroundColor = .lightGray;
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 広告非表示
        self.interstitial?.dismiss()
    }
    
    @IBAction func didTapPreloadButton(_ sender: Any) {
        print("didTapPreloadButton");
        // 広告リクエスト
        self.interstitial?.preload()
    }

    @IBAction func didTapShowButton(_ sender: Any) {
        print("didTapShowButton");
        // 広告表示
        _ = self.interstitial?.show();
    }

    @IBAction func tap(_ sender: Any) {
        print("tap");
    }
}

extension ViewController:ArutanaInterstitialDelegate {
    func arutanaInterstitialNonad(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("NoAd");
    }
    
    func arutanaInterstitialShowAd(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Show ad");
    }
    
    func arutanaInterstitialClose(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Close");
    }
    
    func arutanaInterstitialReceiveAd(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Received an ad.");
        // 広告表示
//        _ = self.interstitial?.show();
    }
    
    func arutanaInterstitialFailedToReceiveAd(arutanaInterstitial: Arutana.ArutanaInterstitial, code: kArutanaErrorCode) {
        print("Failed to receive an ad.");
        // エラー時のリトライは特段の理由がない限り必ず記述するようにしてください。
        switch code {
        case .arutanaErrorCodeNeedConnection,
                .arutanaErrorCodeExceedLimit,
                .arutanaErrorCodeNoAd:
            break;
        case .arutanaErrorCodeUnknown:
            break;
        case .arutanaErrorCodeCommunicationError:
            break;
        case .arutanaErrorCodeReceivedFiller:
            break;
        case .arutanaErrorCodeTemplateFailed:
            break;
        @unknown default:
            break;
        }
    }
    
    func arutanaInterstitialDidTapAd(arutanaInterstitial: Arutana.ArutanaInterstitial) {
        print("Did tap an ad.");
    }
}
