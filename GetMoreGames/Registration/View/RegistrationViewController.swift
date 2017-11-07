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
import URLNavigator

class RegistrationViewController: UIViewController {
    var loginButton: LoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
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
        switch result {
        case .success(_, _, _):
            navigator.push("gmg://profile", animated: false)
            
        case .cancelled:
            break
            
        case .failed(let error):
            print(error)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {}
}
