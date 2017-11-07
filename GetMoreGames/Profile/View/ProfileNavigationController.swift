//
//  ProfileNavigationController.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ProfileNavigationController: UINavigationController {
    let profileNavigationViewModel = ProfileNavigationViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //starthud
        
        profileNavigationViewModel
            .checkUserLoginState()
            .subscribe(onNext: presentNextView)
            .disposed(by: disposeBag)
    }
    
    func presentNextView(userLoginState: Bool) {
        //endhud
        let nextViewController = (userLoginState)
            ? "gmg://profile"
            : "gmg://registration"

        navigator.push(nextViewController, animated: false)
    }
}
