//
//  ViewController.swift
//  MovieAdsSwift
//
//  Created by MacBookPro002 on 2024/05/28.
//

import UIKit
import Arutana

class ViewController: UIViewController {
    
//    @IBOutlet private weak var adWrapperView: UIView!
//    
//    private var manager:ArutanaVIAdManager?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.manager = ArutanaVIAdManager(pubId: "1", delegate: self);
//        self.manager?.preloadType = .Arutana_PRELOAD_ALL;
//        
//        self.manager?.load();
    }


}

/*
extension ViewController:ArutanaVIAdManagerDelegate {
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
        self.manager?.showAdForView(view: adWrapperView);
    }

    func onCloseAd() {
        self.manager?.removeAd()
    }
}
*/
