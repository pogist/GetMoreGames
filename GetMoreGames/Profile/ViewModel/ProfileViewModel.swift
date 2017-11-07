//
//  ProfileViewModel.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import FacebookLogin

final class ProfileViewModel: ViewModel {
    
    let facebookProvider = MoyaProvider<Facebook>()
    let facebookProfile = Variable<Profile?>(nil)
    
    override init() {
        super.init()
        
        self.currentState.value = ViewModelState.infiniteLoading
        
        self.facebookProvider.request(.userProfile) { [weak self] response in
            switch response {
            case .success(let json):
                self?.currentState.value = .success
                self?.facebookProfile.value = try! Profile.from(jsonData: json.data)
                
            case .failure(let error):
                self?.currentState.value = .error(error)
            }
        }
    }
    
    var picture: Observable<URL?> {
        return facebookProfile.asObservable().flatMap { profile -> Observable<URL?> in
            guard let profile = profile else { return .just(nil) }
            return .just(profile.picture["data"]!.url)
        }
    }
    
    var name: Observable<String?> {
        return facebookProfile.asObservable().flatMap { profile -> Observable<String?> in
            guard let profile = profile else { return .just(nil) }
            return .just(profile.name)
        }
    }
    
    func logOut() {
        LoginManager().logOut()
    }
}
