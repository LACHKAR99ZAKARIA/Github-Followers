//
//  GFUIButton.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 15/9/2024.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImageName: systemImageName)
        configure()
    }
    
    private func configure() {
//        configuration = .tinted()
//        configuration?.cornerStyle = .medium
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String, systemImageName: String) {
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
//        self.setImage(UIImage(systemName: systemImageName), for: .normal)
        
        
//        configuration?.baseBackgroundColor = color
//        configuration?.baseForegroundColor = color
//        configuration?.title = title
        
//        configuration?.image = UIImage(systemName: systemImageName)
//        configuration?.imagePadding = 6
//        configuration?.imagePlacement = .leading
    }
}
