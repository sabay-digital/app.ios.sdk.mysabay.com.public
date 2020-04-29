//
//  ViewController.swift
//  SabaySDKExampleApp
//
//  Created by Lay Channara on 1/20/20.
//  Copyright © 2020 Sabay Digital Corporation. All rights reserved.
//

import UIKit
import MySabaySdk

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonLoginTapped(c: UIButton) {
        MSMySabaySDK.shared.logIn(fromController: self) { result in
            switch result {
            case .loginSuccess(let refreshToken, let accessToken):
                print("RefreshToken: \(refreshToken.tokenString!)")
                print("AccessToken: \(accessToken.tokenString!)")
                print("AccessToen Expire: \(accessToken.expirationTime!)")
                break
            case .loginFailed(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    @IBAction func buttonProfileTapped(c: UIButton) {
        MSMySabaySDK.shared.getUserProfile { result in
            switch result {
            case .fetchSuccess(let profile):
                print("Profile uuid: \(profile.uuid!)")
                print("Profile mySabayUserId: \(profile.mySabayUserId!)")
                print("Profile serviceId: \(profile.serviceId!)")
                print("Profile serviceUserId: \(profile.serviceUserId!)")
                print("Profile lastLogin: \(profile.lastLogin!)")
                print("Profile status: \(profile.status!)")
                print("Profile createdAt: \(profile.createdAt!)")
                print("Profile updatedAt: \(profile.updatedAt!)")
                break
            case .fetchFailed(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    @IBAction func buttonRefreshTokensTapped(c: UIButton) {
        MSMySabaySDK.shared.refreshTokens { result in
            switch result {
            case .refreshSuccess(let refreshToken, let accessToken):
                print("RefreshToken: \(refreshToken.tokenString!)")
                print("AccessToken: \(accessToken.tokenString!)")
                print("AccessToen Expire: \(accessToken.expirationTime!)")
                break
            case .refreshFailed(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    @IBAction func buttonStoreTapped(c: UIButton) {
        MSMySabaySDK.shared.openStore(fromController: self) { result in
            switch result {
            case .purchaseMySabay(let purchase):
                print("Hash: \(purchase.purchaseHash!)")
                print("Amount: \(purchase.amount!)")
                print("AssetCode: \(purchase.assetCode!)")
                break
            case .purchaseApple(let product):
                print("Product: \(product.productIdentifier)")
                break
            case .purchaseFailed(let error):
                print("\(error.localizedDescription)")
                break
            }
        }
    }
    
    @IBAction func buttonLogoutTapped(c: UIButton) {
        if MSAccessToken.isValid {
            let noAction = UIAlertAction(title: "Cancel", style: .default) { action in }
            let yesAction = UIAlertAction(title: "Logout", style: .destructive) { action in
                MSMySabaySDK.shared.logout { result in
                    switch result {
                    case .logoutSuccess(let message):
                        print("\(message)")
                        break
                    case .logoutFailed(let error):
                        print("\(error.localizedDescription)")
                        break
                    }
                }
            }
            let controller = UIAlertController(title: "Are you sure you want to logout?", message: "", preferredStyle: .alert)
            controller.addAction(noAction)
            controller.addAction(yesAction)
            self.present(controller, animated: true, completion: nil)
        } else {
            let closeAction = UIAlertAction(title: "Close", style: .cancel) { action in }
            let controller = UIAlertController(title: "You are not logged in yet.", message: "", preferredStyle: .alert)
            controller.addAction(closeAction)
            self.present(controller, animated: true, completion: nil)
        }
    }
}

