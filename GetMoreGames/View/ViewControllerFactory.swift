//
//  ViewControllerFactory.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 19/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import UIKit

protocol ViewControllerFactory {
    associatedtype ViewControllerType = Self where Self: UIViewController
    
    static func create() -> ViewControllerType
}
