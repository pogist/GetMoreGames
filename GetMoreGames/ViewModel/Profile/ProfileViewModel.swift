//
//  ProfileViewModel.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FacebookLogin
import FacebookCore

struct ProfileViewModel {
    
    var picture: Observable<URL> {
        return UserProfile.user.map { $0.imageURLWith(.square, size: CGSize(width: 200, height: 200)) }
    }
    
    var name: Observable<String> {
        return UserProfile.user.map { $0.fullName! }
    }
    
    func logOut() -> Observable<Void> {
        return Observable.create { observer in
            observer.onNext(LoginManager().logOut())
            observer.onCompleted()
            
            return Disposables.create()
        }
        .subscribeOn(MainScheduler.asyncInstance)
        .observeOn(MainScheduler.instance)
    }
}
