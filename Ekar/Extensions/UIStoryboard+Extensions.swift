//
//  UIStoryboard+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

extension UIStoryboard {
  
    public var mapView: UIStoryboard {
        return UIStoryboard(name: "MapView", bundle: nil)
    }
    
    public var onBoard: UIStoryboard {
        return UIStoryboard(name: "OnBoard", bundle: nil)
    }
    
    public var vehicle: UIStoryboard {
        return UIStoryboard(name: "Vehicle", bundle: nil)
    }
    
    
    public func instantiateViewController<T>(withIdentifier identifier: T.Type) -> T where T: UIViewController {
        let className = String(describing: identifier)
        guard let vc =  self.instantiateViewController(withIdentifier: className) as? T else {
            fatalError("Cannot find controller with identifier \(className)")
        }
        return vc
    }
}
