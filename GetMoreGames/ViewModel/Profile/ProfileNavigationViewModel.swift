//
//  ProfileNavigationViewModel.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import RxSwift

struct ProfileNavigationViewModel {
    func checkUserLoginState() -> Observable<Bool> {
        //TODO: Implement real logic
        return Observable<Bool>.just(false)
    }
}
