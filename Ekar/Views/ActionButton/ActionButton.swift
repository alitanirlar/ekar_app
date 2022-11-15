//
//  ActionButton.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

class ActionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure(backgroundColor: UIColor = .primaryColor,
                   cornerRadius: CGFloat = 8.0,
                   borderWitdth: CGFloat = 0.0,
                   borderColor: CGColor = UIColor.primaryColor.cgColor,
                   title: String = "",
                   titleColor: UIColor = .white,
                   font: UIFont = UIFont(name: Font.regular,
                                         size: 20) ?? UIFont.systemFont(ofSize: 20)) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWitdth
        self.layer.borderColor = borderColor
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(titleColor.withAlphaComponent(0.6), for: .highlighted)
        self.titleLabel?.font = font
        
    }
}
