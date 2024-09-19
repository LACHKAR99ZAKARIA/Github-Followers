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
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
    }
}
