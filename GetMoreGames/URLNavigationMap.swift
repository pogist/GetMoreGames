//
//  URLNavigationMap.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 07/11/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import URLNavigator

struct URLNavigationMap {
    static func initialize(navigator: NavigatorType) {
        
        navigator.register("gmg://profile") { url, values, context in
            return ProfileViewController()
        }
        
        navigator.register("gmg://registration") { url, values, context in
            return RegistrationViewController(nib: R.nib.registrationScreen)
        }
    }
}
