//
//  ViewController.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 05/05/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import UIKit
import Cartography
import FacebookLogin

class RegistrationViewController: UIViewController {
    var loginButton: LoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        renderFacebookLoginButton()
    }
    
    func renderFacebookLoginButton() {
        loginButton = LoginButton(readPermissions: [.publicProfile, .email, .userLocation])
        loginButton.delegate = self
        
        view.addSubview(loginButton)
        
        constrain(loginButton) { view in
            view.centerX == view.superview!.centerX
            view.bottomMargin == view.superview!.bottomMargin - 40
        }
    }
}

extension RegistrationViewController: LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        let profileViewController = ProfileViewController.create()
        self.navigationController?.setViewControllers([profileViewController], animated: false)
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {}
}

extension RegistrationViewController: ViewControllerFactory {
    static func create() -> RegistrationViewController {
        return RegistrationViewController(nibName: "RegistrationScreen", bundle: Bundle.main)
    }
}
