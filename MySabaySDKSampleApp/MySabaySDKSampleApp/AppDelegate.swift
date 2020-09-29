//
//  AppDelegate.swift
//  MySabaySDKSampleApp
//
//  Created by Heng Bodyka on 9/29/20.
//  Copyright © 2020 Sabay Digital Corporation. All rights reserved.
//

import UIKit
import MySabaySdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let theme = MSTheme()
        var appearence = MSAppearence()
        appearence.title = "My Sample"
        appearence.theme = theme
        var configure = MSConfigure()
        configure.sandBox = true
        configure.appTheme = .dark
        configure.appearence = appearence
        MSMySabaySDK.configure(configure: configure)
        MSMySabaySDK.shared.addTransactionObserver()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return MSMySabaySDK.shared.handleOpenUrl(url: url)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        MSMySabaySDK.shared.removeTransactionObserver()
    }
}

