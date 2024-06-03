//
//  ViewController.swift
//  ArutanaSample
//
//  Created by MacBookPro002 on 2024/05/16.
//

import UIKit
import Arutana

class ViewController: UIViewController {
    @IBOutlet weak var adView: UIView!
    private var arutana:ArutanaManagerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.arutana = ArutanaManagerViewController(locationID: "test", adType: ArutanaAdType.sp, rootViewController: self);
        self.arutana?.addAdContainerView(adContainerView: self.adView) // 広告Viewを配置するViewを指定
        self.arutana?.delegate = self
        self.arutana?.setEnableTestMode(isTestMode: true);
        self.arutana?.loadRequest() // 広告リクエスト
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面復帰時のローテーション再開
        self.arutana?.resumeRefresh()
    }
    
    deinit {
        // インスタンスの破棄
        self.arutana = nil
    }
}

extension ViewController:ArutanaManagerViewControllerDelegate {
    func arutanaManagerViewControllerReceiveAd(arutanaManagerViewController: Arutana.ArutanaManagerViewController) {
        print("Received an ad.");
    }
    
    func arutanaManagerViewControllerFailedToReceiveAd(arutanaManagerViewController: Arutana.ArutanaManagerViewController, code: kArutanaErrorCode) {
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
        /*
        switch code {
        case .arutanaErrorCode_CommunicationError
        case .adgErrorCodeNeedConnection, // ネットワーク不通
            .adgErrorCodeExceedLimit, // エラー多発
            .adgErrorCodeNoAd: // 広告レスポンスなし
            break
        default:
            adgManagerViewController.loadRequest()
        }
        */
    }
    
    func arutanaManagerViewControllerDidTapAd(arutanaManagerViewController: Arutana.ArutanaManagerViewController) {
        print("Did tap an ad.");
    }
    
    
}

