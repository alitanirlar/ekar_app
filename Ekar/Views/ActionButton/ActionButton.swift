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
                   title: String = "") {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(UIColor.init(white: 1.0, alpha: 0.6), for: .highlighted)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
}
