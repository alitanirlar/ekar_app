//
//  TenureView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

protocol TenureViewDelegate: AnyObject {
    func tenureView(_ sliderValue: Int)
}

@IBDesignable class TenureView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var contractLengthLabel: BaseLabel!
    @IBOutlet weak var saleLabel: BaseLabel!
    @IBOutlet weak var saleContentView: UIView!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var sliderLabels: [BaseLabel]!
    
    weak var delegate: TenureViewDelegate?
    
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
        let view = Bundle(for: TenureView.self).loadNibNamed(self.className,
                                                             owner: self,
                                                             options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        titleLabel.configure(font: UIFont(name: Font.regular, size: 12) ?? UIFont.systemFont(ofSize: 12))
        titleLabel.text = "tenure.title".localized

        
        contractLengthLabel.configure(font: UIFont(name: Font.medium, size: 12) ?? UIFont.systemFont(ofSize: 12))
        contractLengthLabel.text = "contract.legth.title".localized

        
        saleContentView.layer.cornerRadius = saleContentView.frame.height / 2.0
        saleContentView.layer.masksToBounds = true
        
        
        saleLabel.configure(font: UIFont(name: Font.regular,
                                         size: 10) ?? UIFont.systemFont(ofSize: 10),
                            textColor: .white)
        saleLabel.textAlignment = .center
        saleLabel.text = "sample.saving".localized
        
        
        sliderLabels.forEach{
            $0.font = UIFont(name: Font.regular, size: 10)
        }
        
        
        slider.minimumValue = 1
        slider.maximumValue = 9
        
        
    }
    
    @IBAction func didSliderValueChange(_ sender: Any) {
        delegate?.tenureView(Int(slider.value.rounded(.up)))
    }
}
