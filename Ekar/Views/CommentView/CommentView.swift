//
//  CommentView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

@IBDesignable class CommentView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var bottomLineView: UIView!
    
    
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
    }
    
    
    public func setInitValue(title: String,
                             placeholder: String = "",
                             lineColor: UIColor = .systemGray5) {
        titleLabel.text = title
        commentTextField.placeholder = placeholder
        bottomLineView.backgroundColor = lineColor
        
    }
    
}
