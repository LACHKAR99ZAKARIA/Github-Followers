//
//  User.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 19/9/2024.
//

import Foundation

struct User {
    let login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var followers: Int
    var following: Int
    var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case login, name, location, bio, htmlUrl, followers, following
        case avatarUrl = "avatar_url"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case createdAt = "created_at"
    }
}
