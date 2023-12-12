//
//  ExtendView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 06.12.2023.
//

import UIKit
import WebKit

class ExtendView: UIViewController {

    @IBOutlet weak var backgroundExtend: UIImageView!
    @IBOutlet weak var extendSplashView: UIView!
    @IBOutlet weak var navigationView: UIView!
    
    private let iteractor: ExtendIteractor = ExtendIteractor()
    private var customExtend: WKWebView?
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteractExtend()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        iteractor.configureNavigationToMain(self)
        //iteractExtendView()
    }
    
    private func iteractExtend() {
        backgroundExtend.image = iteractor.extend
    }
    
    private func iteractExtendView() {
        iteractor.iteractSignalRequest { signalUrl in
            print("Signal is \(signalUrl)")
            self.iteractor.iteractAncientEgyptGame(signalUrl) { state in
                switch state {
                case .connected:
                    self.iteractor.configureNavigationToMain(self)
                case .failed:
                    self.iteractor.configureNavigationToMain(self)
                case .requested(_):
                    UIView.transition(with: self.view, duration: 1.5, options: .transitionCrossDissolve, animations: {
                        self.iteractor.performCustomWebView(with: self.extendSplashView, signalUrl) { status in
                            self.view.backgroundColor = .lightGray
                            self.navigationView.isHidden = false
                            self.customExtend = status
                        }
                    }, completion: nil)
                }
            }
        }
    }
    
    @IBAction func left(_ sender: UIButton) {
        customExtend?.goBack()
    }
    
    @IBAction func right(_ sender: UIButton) {
        customExtend?.goForward()
    }
}
