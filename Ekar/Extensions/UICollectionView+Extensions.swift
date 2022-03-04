//
//  UICollectionView+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

extension UICollectionView {
    
    func registerCustom<CustomCellType>(customCell: CustomCellType.Type) where CustomCellType: UICollectionViewCell {
        
        let nib = UINib(nibName: String(describing: customCell.self), bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: String(describing: customCell.self))
    }
}
