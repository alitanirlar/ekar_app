//
//  BaseLabel.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

class BaseLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.numberOfLines = 0
        configure()
    }
    
    func configure(font: UIFont = UIFont(name: Font.regular,
                                         size: 14)!,
                   textColor: UIColor = .black) {
        self.font = font
        self.textColor = textColor
        
    }
}
