//
//  AppDelegate.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 01.12.2023.
//

import UIKit
import OneSignalFramework
import AppsFlyerLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        iteractPrimaryLibraries(launchOptions)
        return true
    }

    func iteractPrimaryLibraries(_ options: [UIApplication.LaunchOptionsKey: Any]?) {
        OneSignal.initialize("e592eb94-1538-4945-8301-68c252026113", withLaunchOptions: options)
        AudioService.audioSharedInstance.audioServiceOn()
        AppsFlyerLib.shared().appsFlyerDevKey = "2mrmboBoMtfwk4EeCSYhGa"
        AppsFlyerLib.shared().appleAppID = "6463219684"
        AppsFlyerLib.shared().isDebug = true
        AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
//        // Configure AppsFlyer and OneSignal
//        AppsFlyerLib.shared().appsFlyerDevKey = "2mrmboBoMtfwk4EeCSYhGa"
//        AppsFlyerLib.shared().appleAppID = "6463219684"
//        AppsFlyerLib.shared().isDebug = true
//        AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
//        AppsFlyerLib.shared().start()
//        
//        // Set the delegate for AppsFlyer
//        AppsFlyerLib.shared().delegate = self
    }
}

// MARK: - AppsFlyer Delegate Methods

extension AppDelegate: AppsFlyerLibDelegate {
    func onConversionDataSuccess(_ installData: [AnyHashable: Any]) {
        if let status = installData["af_status"] as? String {
            if (status == "Non-organic") {
                // Business logic for Non-organic install scenario is invoked
                if let sourceID = installData["media_source"],
                   let campaign = installData["campaign"] {
                    print("This is a Non-organic install. Media source: \(sourceID)  Campaign: \(campaign)")
                }
            } else {
                if let sourceID = installData["media_source"],
                   let campaign = installData["campaign"] {
                    print("This is a Non-organic install. Media source: \(sourceID)  Campaign: \(campaign)")
                }
                // Business logic for organic install scenario is invoked
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

