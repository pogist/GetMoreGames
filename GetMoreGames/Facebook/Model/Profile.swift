//
//  Profile.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 20/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let id: String
    let name: String
    let email: String
    let picture: URL
}
