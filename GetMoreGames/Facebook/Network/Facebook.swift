//
//  Facebook.swift
//  GetMoreGames
//
//  Created by Murilo da Paixão on 20/10/17.
//  Copyright © 2017 Murilo da Paixão. All rights reserved.
//

import Foundation
import FacebookCore
import Moya

enum Facebook {
    case userProfile
    
    var fields: String {
        switch self {
        case .userProfile:
            return ["id", "name", "email", "picture"].joined(separator: ",")
        }
    }
    
    var accessToken: String {
        switch self {
        case .userProfile:
            return AccessToken.current!.authenticationToken
        }
    }
}

extension Facebook: TargetType {
    var baseURL: URL {
        return URL(string: "https://graph.facebook.com")!
    }
    
    var path: String {
        switch self {
        case .userProfile:
            return "me"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userProfile:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .userProfile:
            return ["Content-Type": "application/json"]
        }
    }
    
    var task: Task {
        switch self {
        case .userProfile:
            return .requestParameters(parameters: ["fields": fields, "access_token": accessToken], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .userProfile:
            let sampleData: String = """
            {
                \"id\": \"000000000000000\",
                \"name\": \"Murilo Paixão\",
                \"email\": \"murilo.paixao.2@gmail.com\",
                \"picture\": {
                    \"data\": {
                        \"is_silhouette\": false,
                        \"url\": \"https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/12208330_101012863597460_6721017170494333119_n.jpg?oh=baa502c2febd1263bd4ebbb9aee77898&oe=5A774A2C\"
                    }
                }
            }
            """
            
            return sampleData.data(using: .utf8)!
        }
    }
}
