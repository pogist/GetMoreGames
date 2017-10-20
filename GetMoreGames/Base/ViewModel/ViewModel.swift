//
//  ViewModel.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 20/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import RxSwift

enum ViewModelState {
    case idle
    case loading(percent: Float)
    case error(Error)
    case success
    
    static let infiniteLoading: ViewModelState = .loading(percent: -1)
}

class ViewModel {
    let currentState = Variable<ViewModelState>(.idle)
}
