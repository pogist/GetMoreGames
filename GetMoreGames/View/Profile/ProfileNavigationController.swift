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
            .subscribe(onNext: presentNextView, onError: errorHandler)
            .disposed(by: disposeBag)
    }
    
    func presentNextView(basedOn userLoginState: Bool) {
        //endhud
        let nextViewController = (userLoginState)
            ? ProfileViewController(nibName: "ProfileScreen", bundle: Bundle.main)
            : RegistrationViewController(nibName: "RegistrationScreen", bundle: Bundle.main)
        
        self.setViewControllers([nextViewController], animated: true)
    }
    
    func errorHandler(error: Error) {
        //TODO
    }
}
