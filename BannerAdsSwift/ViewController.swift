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
    // true にすると、dev 環境の Fluct 確認用の枠（1132）を表示する。この枠は Arutana の広告を返さず、Fluct の広告を表示する
    private static let useFluctTestPlacement = false

    override func viewDidLoad() {
        super.viewDidLoad()
        if Self.useFluctTestPlacement {
            self.banner = ArutanaBanner(locationId: "1132", adType: ArutanaAdType.sp); // Fluct 確認用の広告枠ID
            self.banner?.setEnableDevMode(true); // dev 環境に接続する
        } else {
            self.banner = ArutanaBanner(locationId: "1", adType: ArutanaAdType.sp); // 広告枠IDを指定して初期化
        }
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

extension ViewController:@MainActor ArutanaBannerDelegate {
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
