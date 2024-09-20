//
//  UIViewController.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 17/9/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String, action: @escaping () -> Void = {}) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle, dismissAction: action)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
