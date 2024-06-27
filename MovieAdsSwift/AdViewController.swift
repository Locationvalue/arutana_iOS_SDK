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
    
    private var manager:ArutanaVIAdManager?;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.manager = ArutanaVIAdManager(pubId: "1", delegate: self);
        self.manager?.setPreloadType(.arutanaVPreloadTypeAll);
        
        self.manager?.load();
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
        self.manager?.showAdForView(view: self.adWrapperView);
    }

    func onCloseAd() {
        self.manager?.removeAd()
    }
}
