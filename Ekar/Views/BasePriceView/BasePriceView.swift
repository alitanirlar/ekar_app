//
//  BasePriceView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

@IBDesignable class BasePriceView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var baseTitleLabel: BaseLabel!
    @IBOutlet weak var contractTitleLabel: BaseLabel!
    @IBOutlet weak var priceLabel: BaseLabel!
    @IBOutlet weak var currencyTypeLabel: BaseLabel!
    @IBOutlet weak var contractUnitLabel: BaseLabel!
    @IBOutlet weak var contractLengthLabel: BaseLabel!
    
    
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
        let view = Bundle(for: BasePriceView.self).loadNibNamed(self.className,
                                                                owner: self,
                                                                options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        baseTitleLabel.text = ""
        baseTitleLabel.font = UIFont(name: Font.bold, size: 14)
        
        priceLabel.text = ""
        priceLabel.font = UIFont(name: Font.bold, size: 28)
        
        currencyTypeLabel.text = ""
        currencyTypeLabel.font = UIFont(name: Font.bold, size: 14)
        
        contractTitleLabel.text = ""
        contractTitleLabel.font = UIFont(name: Font.bold, size: 14)
        
        contractUnitLabel.text = ""
        contractUnitLabel.font = UIFont(name: Font.bold, size: 14)
        
        contractLengthLabel.text = ""
        contractLengthLabel.font = UIFont(name: Font.bold, size: 28)

    }
    
    
    public func setInitValue(price: String, currencyType: String, contractUnit: String, contractLenght: String) {
        baseTitleLabel.text = "base.price.title".localized
        contractTitleLabel.text = "contract.length.title".localized
        priceLabel.text = price
        currencyTypeLabel.text = currencyType
        contractUnitLabel.text = contractUnit
        contractLengthLabel.text = contractLenght
        
    }
    
    func setContract(length: String) {
        contractLengthLabel.text = length
    }
    
    
}
