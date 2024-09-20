//
//  GFAvatarImageView.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 20/9/2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeeholder: UIImage = UIImage(resource: .emptyStateLogo)

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeeholder
        translatesAutoresizingMaskIntoConstraints = false
    }
}
