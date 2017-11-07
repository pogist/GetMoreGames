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
    
    let profileViewModel: ProfileViewModel
    let disposeBag = DisposeBag()
    
    init() {
        self.profileViewModel = ProfileViewModel()
        super.init(nibName: R.nib.profileScreen.name, bundle: R.nib.profileScreen.bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Coder not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.profilePicture.kf.setImage(with: nil, placeholder: R.image.placeholder())
        
        profileViewModel.currentState.asObservable()
            .subscribe(onNext: { [weak self] state in
                switch state {
                case .success:
                    self?.bindViewModel()
                    
                case .loading(_):
                    print("Loading...")
                    
                case .idle:
                    print("idle")
                    
                case .error(let error):
                    print(error)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func bindViewModel() {
        self.profileViewModel.name.bind(to: welcomeLabel.rx.text)
            .disposed(by: disposeBag)
        
        self.profileViewModel.picture.subscribe(onNext: { [weak self] url in
            self?.profilePicture.kf.setImage(with: url)
        })
        .disposed(by: disposeBag)
    }
    
    @IBAction func didTapLogOut(_ sender: UIButton) {
        self.profileViewModel.logOut()
        navigator.push("gmg://registration", animated: false)
    }
}

