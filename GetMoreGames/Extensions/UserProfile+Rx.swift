//
//  UserProfile+Rx.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import RxSwift
import FacebookCore

extension UserProfile {
    
    static var user: Observable<UserProfile> {
        return Observable.create { observer in
            
            UserProfile.loadCurrent { result in
                switch result {
                    
                case .success(let user):
                    observer.onNext(user)
                    observer.onCompleted()
                    
                case .failed(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
        .subscribeOn(MainScheduler.asyncInstance)
        .observeOn(MainScheduler.instance)
        .share()
    }
}
