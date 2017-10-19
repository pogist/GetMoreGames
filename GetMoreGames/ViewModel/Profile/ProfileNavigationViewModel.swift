//
//  ProfileNavigationViewModel.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import RxSwift
import FacebookCore

struct ProfileNavigationViewModel {
    
    func checkUserLoginState() -> Observable<Bool> {
        return Observable.create { observer in
            let loginState = (AccessToken.current == nil) ? false : true
            observer.onNext(loginState)
            observer.onCompleted()
            
            return Disposables.create()
        }
        .subscribeOn(MainScheduler.asyncInstance)
        .observeOn(MainScheduler.instance)
    }
}
