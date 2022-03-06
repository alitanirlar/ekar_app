//
//  BookFeeView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit



@IBDesignable class BookFeeView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var currencyTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var howContractWorksButton: ActionButton!
    
    var didTapAction: (() -> Void)?
    
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
        let view = Bundle(for: BookFeeView.self).loadNibNamed(self.className,
                                                              owner: self,
                                                              options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        
        titleLabel.configure(font: UIFont(name: Font.bold,
                                          size: 12)!,
                             textColor: .black)
        titleLabel.text = "book.fee.title".localized
        currencyTypeLabel.text = ""
        currencyTypeLabel.font = UIFont(name: Font.medium, size: 10)
        
        priceLabel.text = ""
        priceLabel.font = UIFont(name: Font.medium, size: 28)
        
        howContractWorksButton.configure(backgroundColor: .white,
                                         borderWitdth: 1.0, title: "how.contract.works.button.title".localized,
                                        titleColor: .primaryColor,
                                        font: UIFont(name: Font.bold,size: 12)!)
        howContractWorksButton.addTarget(self, action: #selector(didTapHowWorksButton), for: .touchUpInside)
        
        
    }
    
    
    public func setInitValue(currencyType: String, price: String) {
        
        currencyTypeLabel.text = currencyType
        priceLabel.text = price
    }
    
    @objc private func didTapHowWorksButton() {
        if let didTapAction = didTapAction {
            didTapAction()
        }
    }
    
}
