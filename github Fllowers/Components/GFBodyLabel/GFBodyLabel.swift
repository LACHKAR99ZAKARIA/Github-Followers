//
//  GFBodyLabel.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 16/9/2024.
//

import UIKit

class GFBodyLabel: UILabel {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
//        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        configure()
    }
    
    func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
