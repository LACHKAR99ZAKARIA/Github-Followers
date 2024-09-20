//
//  FollowerListVC.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 16/9/2024.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initNavigationBar()
        
//        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
//            guard let followers = followers else {
//                self.presentGFAlertOnMainThread(title: "Api Error", message: errorMessage!.rawValue, buttonTitle: "Ok")
//                return
//            }
//            
//            print("followers: \(followers)")
//        }
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
                case .success(let followers):
                print("followers: \(followers)")
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Api Error", message: error.rawValue, buttonTitle: "Ok", action: dismissView)
            }
        }
        
        func dismissView() {
            self.dismiss(animated: true)
        }
    }
    
    func initNavigationBar() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
    }
}
