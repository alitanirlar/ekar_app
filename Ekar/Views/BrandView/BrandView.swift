//
//  BrandView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

@IBDesignable class BrandView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var makeLabel: BaseLabel!
    @IBOutlet weak var modelLabel: BaseLabel!
    @IBOutlet weak var styleLabel: BaseLabel!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private  func commonInit()  {
        let view = Bundle(for: CommentView.self).loadNibNamed(self.className,
                                                              owner: self,
                                                              options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        logoImageView.layer.cornerRadius = logoImageView.layer.frame.height / 2.0
        logoImageView.layer.masksToBounds = true
        
        makeLabel.text = ""
        makeLabel.configure(font: UIFont(name: Font.bold, size: 24)!, textColor: .black)
        
        
        modelLabel.text = ""
        modelLabel.configure(font: UIFont(name: Font.medium, size: 20)!, textColor: .darkGray)
        
        styleLabel.text = ""
        styleLabel.configure(font: UIFont(name: Font.regular, size: 14)!, textColor: .black)
        
        
        
        
    }
    
    public func setInitValue(logo: UIImage,
                             make: String, model: String,
                             style: String ) {
        logoImageView.image = logo
        makeLabel.text = make
        modelLabel.text = model
        styleLabel.text = style
    }
    
    
}
