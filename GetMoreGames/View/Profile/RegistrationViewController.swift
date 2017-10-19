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
        renderFacebookLoginButton()
    }
    
    func renderFacebookLoginButton() {
        loginButton = LoginButton(readPermissions: [.publicProfile, .email, .userLocation])
        view.addSubview(loginButton)
        
        constrain(loginButton) { view in
            view.centerX == view.superview!.centerX
            view.bottomMargin == view.superview!.bottomMargin - 40
        }
    }
}
