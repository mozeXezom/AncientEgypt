//
//  ExtendIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 06.12.2023.
//

import UIKit
import WebKit
import AdSupport
import AppsFlyerLib
import OneSignalFramework
import AppTrackingTransparency

final class ExtendIteractor: NSObject {
    private let appNavigationService = AppNavigationService()
    private let connectionService = AppConnectionService()
    private let extendDef = UserDefaults.standard
    
    var extend: UIImage {
        return UIImage(named: "extendImage")!
    }
    
    var infoAdditionUrl: String {
        return "&push_id="
    }
    
    var infoStartUrl: String {
        return "https://playvecc.com/Superball?subid="
    }
    
    var mainBoard: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    func configureNavigationToMain(_ view: UIViewController) {
        if let mainView = mainBoard.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            mainView.modalPresentationStyle = .fullScreen
            mainView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, mainView)
        }
    }
    
    func iteractAncientEgyptGame(_ ancientUrl: String, _ handler: @escaping (ConnectionState) -> Void) {
//        let appsFlyerId = extendDef.string(forKey: "UserAppsFlyerId")
//        let onGameUrlString = "\(infoStartUrl)\(appsFlyerId ?? "")\(infoAdditionUrl)\(appsFlyerId ?? "")"
        guard let newUrl = URL(string: ancientUrl) else {
            return handler(.failed)
        }
        
        connectionService.prepareContributionRequest(forURL: newUrl) { requested, urlToRequest, error in
            if error != nil {
                handler(.failed)
            } else {
                if requested, let requestedUrl = urlToRequest {
                    handler(.requested(requestedUrl))
                } else {
                    handler(.connected)
                }
            }
        }
    }
}

extension ExtendIteractor: WKNavigationDelegate {
    func performCustomWebView(with view: UIView, _ url: String, completion: @escaping (WKWebView?) -> Void) {
        guard let infoURL = URL(string: url) else {
            return
        }

        let webView = WKWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.allowsBackForwardNavigationGestures = true
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.load(URLRequest(url: infoURL))
        completion(webView)
    }
    
    func getUserAppsFlyerId(_ completion: @escaping (String) -> ()) {
        if AppsFlyerLib.shared().getAppsFlyerUID() != nil {
            let appsFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
            extendDef.setValue(appsFlyerId, forKey: "UserAppsFlyerId")
            print("AppsFlyer ID: \(appsFlyerId)")
            completion(appsFlyerId)
        } else {
            print("Unable to retrieve AppsFlyer ID")
        }
    }
    
    func iteractTrackingRequest(_ completion: @escaping (String?) -> ()) {
        AppsFlyerLib.shared().start()
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { requestStatus in
                switch requestStatus {
                case .authorized:
                    let advId = ASIdentifierManager.shared().advertisingIdentifier
                    let stringId = advId.uuidString
                    completion(stringId)
                case .denied, .notDetermined, .restricted:
                    print("Permission is not set!")
                    completion("")
                @unknown default:
                    break
                }
            }
        } else {
            completion(nil)
        }
    }

    func iteractSignalRequest(_ completion: @escaping (String) -> ()) {
        OneSignal.Notifications.requestPermission({ accepted in
            if accepted {
                print("User accepted notifications: \(accepted)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.iteractTrackingRequest { idfaId in
                        self.getUserAppsFlyerId { appsFlyerId in
                            print("Flyeris is \(appsFlyerId)")
                            AppsFlyerLib.shared().delegate = self
                            OneSignal.login(appsFlyerId)
                            let customUrl: String
                            if let idfa = idfaId, !idfa.isEmpty {
                                customUrl = "\(self.infoStartUrl)\(idfa)\(self.infoAdditionUrl)\(idfa)&uuid=\(appsFlyerId)"
                            } else {
                                // Handle the case where idfaId is nil or empty
                                customUrl = "\(self.infoStartUrl)\(appsFlyerId)\(self.infoAdditionUrl)\(appsFlyerId)"
                            }
                            
                            print("Custom url is \(customUrl)")
                            completion(customUrl)
                        }
                    }
                }
            } else {
                print("User did not accept notifications: \(accepted)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.iteractTrackingRequest { idfaId in
                        self.getUserAppsFlyerId { appsFlyerId in
                            print("Flyeris is \(appsFlyerId)")
                            OneSignal.login(appsFlyerId)
                            let customUrl: String
                            if let idfa = idfaId, !idfa.isEmpty {
                                customUrl = "\(self.infoStartUrl)\(idfa)\(self.infoAdditionUrl)\(idfa)&uuid=\(appsFlyerId)"
                            } else {
                                // Handle the case where idfaId is nil or empty
                                customUrl = "\(self.infoStartUrl)\(appsFlyerId)\(self.infoAdditionUrl)\(appsFlyerId)"
                            }
                            
                            print("Custom url is \(customUrl)")
                            completion(customUrl)
                        }
                    }
                }
            }
        }, fallbackToSettings: true)
    }
}

extension ExtendIteractor: AppsFlyerLibDelegate {
    func onConversionDataSuccess(_ installData: [AnyHashable: Any]) {
        if let status = installData["af_status"] as? String {
            if status == "Non-organic" {
                // Non-organic install logic
                if let sourceID = installData["media_source"], let campaign = installData["campaign"] {
                    print("Non-organic install. Media source: \(sourceID), Campaign: \(campaign)")
                }
            }
        }
    }

    func onConversionDataFail(_ error: Error!) {
        // Logic for when conversion data resolution fails
        if let err = error {
            print(err)
        }
    }
}
