//
//  Slider.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

class Slider : UISlider {
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        let imageTint = UIImage(named: "slider_thumb_icon")
        self.minimumTrackTintColor = .primaryColor
        self.maximumTrackTintColor = .white
        self.setThumbImage(imageTint, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if #available(iOS 14.0, *) {
                self.subviews.first?.subviews[0].layer.borderWidth = 1
                self.subviews.first?.subviews[0].layer.borderColor = UIColor.primaryColor.cgColor
                self.subviews.first?.subviews[0].layer.cornerRadius = 4.0
                
            }
            else{
                self.subviews[0].layer.borderWidth = 1
                self.subviews[0].layer.borderColor = UIColor.primaryColor.cgColor
                self.subviews.first?.subviews[0].layer.cornerRadius = 4.0
            }
        }
        
        
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()
        super.layer.cornerRadius = self.frame.height/2
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect
    {
        let bounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 8))
        super.trackRect(forBounds: bounds)
        return bounds
    }
    
    
    
    
}
