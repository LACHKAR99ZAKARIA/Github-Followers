//
//  Follower.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 19/9/2024.
//

import Foundation

struct Follower: Codable, Hashable, Identifiable {
    var id = UUID()
    var login: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(login)
//    }
}
