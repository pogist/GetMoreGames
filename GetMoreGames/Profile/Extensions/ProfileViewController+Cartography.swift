//
//  ProfileViewController+Cartography.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 07/11/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import Cartography

extension ProfileViewController {
    func setupConstraints() {
        
        constrain(welcomeLabel, profilePicture) { view1, view2 in
            view1.width == view1.superview!.width/2
            view1.height == 21
            view1.centerX == view1.superview!.centerX
            
            view2.width == 200
            view2.height == 200
            view2.centerX == view2.superview!.centerX
            
            view2.topMargin == view2.superview!.topMargin + 50
            view1.topMargin == view2.bottomMargin + 40
        }
        
        constrain(logOutButton) { view in
            view.centerX == view.superview!.centerX
            view.bottomMargin == view.superview!.bottomMargin - 50
        }
    }
}
