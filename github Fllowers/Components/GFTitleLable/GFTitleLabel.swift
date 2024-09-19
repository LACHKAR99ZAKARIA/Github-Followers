//
//  GFTitleLable.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 16/9/2024.
//

import UIKit

class GFTitleLabel: UILabel {
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, fontWeight: UIFont.Weight = .bold) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        configure()
    }
    
    func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
