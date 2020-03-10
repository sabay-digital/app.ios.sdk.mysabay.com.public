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
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonStore: UIButton!
    @IBOutlet weak var buttonLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonLoginTapped(c: UIButton) {
        MSMySabayManager.shared.logIn(fromController: self) { result in
            switch result {
            case .loginSuccess(let token):
                print("\(token.tokenString!)")
                break
            case .loginFailed(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    @IBAction func buttonStoreTapped(c: UIButton) {
        MSMySabayManager.shared.openStore(fromController: self) { result in
            switch result {
            case .purchaseMySabay(let hash):
                print("\(hash)")
                break
            case .purchaseApple(let product):
                print("\(product.productIdentifier)")
                break
            case .purchaseFailed(let error):
                print("\(error.localizedDescription)")
                break
            }
        }
    }
    
    @IBAction func buttonLogoutTapped(c: UIButton) {
        if MSToken.isValid {
            let noAction = UIAlertAction(title: "Cancel", style: .default) { action in }
            let yesAction = UIAlertAction(title: "Logout", style: .destructive) { action in MSMySabayManager.shared.logOut() }
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

