//
//  ProfileViewController.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import UIKit
import Cartography

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constrain(welcomeLabel) { view in
            view.width == view.superview!.width/2
            view.height == 21
            view.center == view.superview!.center
        }
    }
}
