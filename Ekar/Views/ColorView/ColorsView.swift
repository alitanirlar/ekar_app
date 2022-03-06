//
//  ColorsView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

@IBDesignable class ColorsView: UIView {
    
    //    MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.commonInit()
    }
    
    private  func commonInit()  {
        let view = Bundle(for: ColorsView.self).loadNibNamed(self.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        stackView.spacing = 4.0
        stackView.distribution = .fillEqually
        
        titleLabel.text = ""
    }
    
    public func setInitValue(data: [UIColor]) {
        displayColors(data: data)
    }
    
    private func displayColors(data: [UIColor]) {
        
        titleLabel.text = "Available colors"
        titleLabel.font = UIFont(name: Font.regular, size: 12)
        stackViewWidth.constant = CGFloat((data.count - 1) * 16)
        data.forEach {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
            view.backgroundColor = $0
            view.layer.cornerRadius = 4
            stackView.addArrangedSubview(view)
        }
    }
}

