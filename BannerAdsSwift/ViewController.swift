//
//  ViewController.swift
//  ArutanaSample
//
//  Created by ARUTANA.
//

import UIKit
import Arutana

class ViewController: UIViewController {
    @IBOutlet weak var adView: UIView!
    private var banner:ArutanaBanner?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.adView.backgroundColor = .brown;
        self.banner = ArutanaBanner(locationID: "1", adType: ArutanaAdType.sp);
        self.banner?.addAdContainerView(self.adView) // 広告Viewを配置するViewを指定
        self.banner?.delegate = self;
        self.banner?.setUserId("1");
        self.banner?.setEnableTestMode(true);
        self.banner?.loadRequest(); // 広告リクエスト
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面復帰時のローテーション再開
        self.banner?.resumeRefresh();
    }
    
    deinit {
        // インスタンスの破棄
        self.banner = nil;
    }
}

extension ViewController:ArutanaBannerDelegate {
    func arutanaBannerReceiveAd() {
        print("Received an ad.");
    }
    
    func arutanaBannerFailedToReceiveAd(code: kArutanaErrorCode) {
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
    
    func arutanaBannerDidTapAd() {
        print("Did tap an ad.");
    }
    
    
}
