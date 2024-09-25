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
        self.banner = ArutanaBanner(locationId: "1", adType: ArutanaAdType.sp); // 広告枠IDを指定して初期化
        self.banner?.addAdContainerView(self.adView) // 広告Viewを配置するViewを指定
        self.banner?.delegate = self;
        self.banner?.setUserId("1"); // ログイン中のユーザーの会員ID
        self.banner?.setEnableTestMode(true); // テストモードを有効化. 本番リリース時は削除
        self.banner?.loadRequest(); // 広告を表示
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面復帰時に広告を再表示する
        self.banner?.loadRequest();
    }
    
    deinit {
        // インスタンスを破棄する
        self.banner = nil;
    }
}

extension ViewController:ArutanaBannerDelegate {
    func arutanaBannerReceiveAd() {
        print("Received an ad.");
    }
    
    func arutanaBannerFailedToReceiveAd(code: kArutanaErrorCode) {
        print("Failed to receive an ad.:\(code)");
    }
    
    func arutanaBannerDidTapAd() {
        print("Did tap an ad.");
    }
}
