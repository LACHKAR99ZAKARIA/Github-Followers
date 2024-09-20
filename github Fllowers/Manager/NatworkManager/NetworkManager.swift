//
//  NetworkManager.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 19/9/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL: String = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Follower]?, GFError?) -> Void) {
        let endpont = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        print(endpont)
        
        guard let url = URL(string: endpont) else {
            completion(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, .invalidData)
                return
            }
            
            do {
                let followers = try JSONDecoder().decode([Follower].self, from: data)
                completion(followers, nil)
            } catch {
                completion(nil, .invalidData)
                return
            }
        }
        
        task.resume()
    }
}
