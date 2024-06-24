//
//  ViewController.swift
//  InterstitialAdsSwift
//
//  Created by MacBookPro002 on 2024/05/28.
//

import UIKit
import Arutana

class ViewController: UIViewController {
    
    private var interstitial: ArutanaInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.interstitial = ArutanaInterstitial()
        self.interstitial?.setLocationId("48549");    // 管理画面から払い出された広告枠ID
        self.interstitial?.delegate = self
        self.interstitial?.setEnableTestMode(true);
        self.interstitial?.rootViewController = self;
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
        _ = self.interstitial?.show()
    }

    @IBAction func tap(_ sender: Any) {
        print("tap");
    }
}

extension ViewController:ArutanaInterstitialDelegate {
    func arutanaManagerViewControllerReceiveAd(arutanaManagerViewController: Arutana.ArutanaManagerViewController) {
        print("Received an ad.")
    }
    
    func arutanaManagerViewControllerFailedToReceiveAd(arutanaManagerViewController: Arutana.ArutanaManagerViewController, code: kArutanaErrorCode) {
        print("Failed to receive an ad.")
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
    
    func arutanaManagerViewControllerDidTapAd(arutanaManagerViewController: Arutana.ArutanaManagerViewController) {
        print("Did tap an ad.")
    }
    
    func arutanaInterstitialClose() {
        print("Closed interstitial ads")
    }
    
}

