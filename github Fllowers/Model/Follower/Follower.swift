//
//  Follower.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 19/9/2024.
//

import Foundation

struct Follower: Codable {
    var login: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
