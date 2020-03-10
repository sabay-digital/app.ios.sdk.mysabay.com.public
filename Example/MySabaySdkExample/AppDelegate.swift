//
//  AppDelegate.swift
//  SabaySDKExampleApp
//
//  Created by Lay Channara on 1/20/20.
//  Copyright © 2020 Sabay Digital Corporation. All rights reserved.
//

import UIKit
import MySabaySdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MSMySabayManager.shared.addTransactionObserver()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return MSMySabayManager.shared.handleOpenUrl(url: url)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        MSMySabayManager.shared.removeTransactionObserver()
    }
}
