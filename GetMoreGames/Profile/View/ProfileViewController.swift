//
//  ProfileViewController.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import UIKit
import Cartography
import RxSwift
import RxCocoa
import Kingfisher

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    let profileViewModel = ProfileViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindTo(viewModel: profileViewModel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindTo(viewModel: profileViewModel)
    }
    
    func bindTo(viewModel: ProfileViewModel) {
        logOutButton.rx.tap.flatMap { Void -> Observable<Void> in
            return viewModel.logOut()
        }
        .subscribe(onNext: { [weak self] in
            let registrationViewController = RegistrationViewController.create()
            self?.navigationController?.setViewControllers([registrationViewController], animated: true)
        })
        .disposed(by: disposeBag)
        
        viewModel.name
            .bind(to: welcomeLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.picture
            .subscribe(onNext: { [weak self] url in
                self?.profilePicture.kf.setImage(with: url)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}

extension ProfileViewController: ViewControllerFactory {
    static func create() -> ProfileViewController {
        return ProfileViewController(nibName: "ProfileScreen", bundle: Bundle.main)
    }
}
