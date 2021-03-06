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
    let picture: [String: Picture]
    
    struct Picture: Codable {
        let isSilhouette: Bool
        let url: URL
        
        enum CodingKeys: String, CodingKey {
            case url
            case isSilhouette = "is_silhouette"
        }
    }
}

extension Profile {
    static func from(jsonData: Data) throws -> Profile {
        return try JSONDecoder().decode(Profile.self, from: jsonData)
    }
}
