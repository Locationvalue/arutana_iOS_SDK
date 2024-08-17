//
//  AdViewController.swift
//  MovieAdsSwift
//
//  Created by MacBookPro002 on 2024/06/27.
//

import UIKit
import Arutana

class AdViewController: UIViewController {
    @IBOutlet private weak var adWrapperView: UIView!
    
    @IBOutlet weak var adView: UIView!
    //    private var manager:ArutanaVIAdManager?;
    private var movieAd:ArutanaMovieAd?;

    /*
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.manager = ArutanaVIAdManager(pubId: "1", delegate: self);
//        self.manager?.setPreloadType(.arutanaVPreloadTypeAll);
//        
//        self.manager?.load();
        
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.movieAd = ArutanaMovieAd();
        self.movieAd?.setLocationID("48549");    // 管理画面から払い出された広告枠ID
//        self.movieAd?.delegate = self
        self.movieAd?.setEnableTestMode(true);
        self.movieAd?.rootViewController = self;
//        self.movieAd?.setAdShowView(view: self.adView);
        
        //
        
        self.movieAd?.preload();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 広告非表示
//        self.movieAd?.dismiss()
    }
    
    @IBAction func onClick(_ sender: Any) {
        print("click");
        // 広告リクエスト
        self.movieAd?.show();
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*
extension AdViewController:ArutanaVIAdManagerDelegate {
    /*
    private func requestAppVador() {
        if appVadorManager.isReady {
            appVadorManager.removeAd()
        }
        appVadorManager.load()
    }
    */
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }

    func onReadyToPlayAd() {
//        self.manager?.showAdForView(view: self.adWrapperView);
    }

    func onCloseAd() {
//        self.manager?.removeAd()
    }
}
*/
