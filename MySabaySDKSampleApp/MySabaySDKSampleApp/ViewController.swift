//
//  ViewController.swift
//  MySabaySDKSampleApp
//
//  Created by Heng Bodyka on 9/29/20.
//  Copyright © 2020 Sabay Digital Corporation. All rights reserved.
//

import UIKit
import MySabaySdk

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonStore: UIButton!
    @IBOutlet weak var buttonLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MSMySabaySDK.shared.logout(all: false).then { message in
            print("\(message)")
        }
        .catch { error in
            print("\(error.localizedDescription)")
        }
    }
    
    @IBAction func buttonLoginTapped(c: UIButton) {
        MSMySabaySDK.shared.logIn { result in
            switch result {
            case .loginSuccess(let refreshToken, let accessToken):
                print("RefreshToken: \(refreshToken.tokenString!)")
                print("AccessToken: \(accessToken.tokenString!)")
                print("AccessToken Expire: \(accessToken.expirationTime!)")
                let message =
                    "RefreshToken: \(refreshToken.tokenString!)" + "\n\n" +
                        "AccessToken: \(accessToken.tokenString!)" + "\n\n" +
                "AccessToken Expire: \(accessToken.expirationTime!)"
                let controller = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                self.present(controller, animated: true) {}
                break
            case .loginFailed(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    @IBAction func buttonProfileTapped(c: UIButton) {
        MSMySabaySDK.shared.getUserProfile().then { profile in
                print("Profile uuid: \(profile.uuid!)")
                print("Profile mySabayUserId: \(profile.mySabayUserId!)")
                print("Profile serviceId: \(profile.serviceId!)")
                print("Profile serviceUserId: \(profile.serviceUserId!)")
                print("Profile lastLogin: \(profile.lastLogin!)")
                print("Profile status: \(profile.status!)")
                print("Profile createdAt: \(profile.createdAt!)")
                print("Profile updatedAt: \(profile.updatedAt!)")
                print("Profile enableLocalPay: \(profile.enableLocalPay!)")
                print("Profile balance \(profile.balance.coin!)SC \(profile.balance.gold!)SG")
                let message =
                    "Profile uuid: \(profile.uuid!)" + "\n" +
                    "Profile mySabayUserId: \(profile.mySabayUserId!)" + "\n" +
                    "Profile serviceId: \(profile.serviceId!)" + "\n" +
                    "Profile serviceUserId: \(profile.serviceUserId!)" + "\n" +
                    "Profile lastLogin: \(profile.lastLogin!)" + "\n" +
                    "Profile status: \(profile.status!)" + "\n" +
                    "Profile createdAt: \(profile.createdAt!)" + "\n" +
                    "Profile updatedAt: \(profile.updatedAt!)" + "\n" +
                    "Profile enableLocalPay: \(profile.enableLocalPay!)" + "\n" +
                    "Profile balance \(profile.balance.coin!)SC \(profile.balance.gold!)SG"
                let controller = UIAlertController(title: "Profile", message: message, preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                self.present(controller, animated: true) {}
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func buttonRefreshTokensTapped(c: UIButton) {
        MSMySabaySDK.shared.refreshTokens().then { (refreshToken, accessToken) in
            print("RefreshToken: \(refreshToken.tokenString!)")
            print("AccessToken: \(accessToken.tokenString!)")
            print("AccessToken Expire: \(accessToken.expirationTime!)")
            let message =
                "RefreshToken: \(refreshToken.tokenString!)" + "\n\n" +
                "AccessToken: \(accessToken.tokenString!)" + "\n\n" +
                "AccessToken Expire: \(accessToken.expirationTime!)"
            let controller = UIAlertController(title: "Refresh", message: message, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self.present(controller, animated: true) {}
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func buttonVerifyTokenTapped(c: UIButton) {
        MSMySabaySDK
            .shared
            .verifyToken()
            .then { status in
                print("Valid: \(status)")
                let message = "Valid: \(status)"
                let controller = UIAlertController(title: "Verify", message: message, preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                self.present(controller, animated: true) {}
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func buttonStoreTapped(c: UIButton) {
        MSMySabaySDK.shared.openStore { result in
            switch result {
            case .purchaseApple(let product, let receiptData):
                print("Product: \(product.productIdentifier)")
                print("ReceiptData: \(receiptData)")
                break
            case .purchaseMySabay(let purchase):
                print("Hash: \(purchase.hash!)")
                print("Amount: \(purchase.amount!)")
                print("AssetCode: \(purchase.assetCode!)")
                print("PackageId: \(purchase.packageId!)")
                print("Bonus: \(purchase.bonus!)")
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
                let cdAction = UIAlertAction(title: "Current Device Only", style: .default) { action in
                    MSMySabaySDK
                    .shared
                    .logout(all: false)
                    .then { message in
                        print("\(message)")
                        let message = "Logout: \(message)"
                        let controller = UIAlertController(title: "Logout", message: message, preferredStyle: .alert)
                        controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                        self.present(controller, animated: true) {}
                    }
                    .catch { error in
                        print("\(error.localizedDescription)")
                    }
                }
                let adAction = UIAlertAction(title: "All Devices", style: .destructive) { action in
                    MSMySabaySDK
                    .shared
                    .logout(all: true)
                    .then { message in
                        print("\(message)")
                        let message = "Logout: \(message)"
                        let controller = UIAlertController(title: "Logout", message: message, preferredStyle: .alert)
                        controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                        self.present(controller, animated: true) {}
                    }
                    .catch { error in
                        print("\(error.localizedDescription)")
                    }
                }
                let controller = UIAlertController(title: "Do you want to logout all devices?", message: "", preferredStyle: .alert)
                controller.addAction(cdAction)
                controller.addAction(adAction)
                self.present(controller, animated: true, completion: nil)
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

