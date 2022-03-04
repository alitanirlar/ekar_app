//
//  UITableView+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit
extension UITableView {
    
    func registerCustom<CustomCellType>(customCell: CustomCellType.Type) where CustomCellType: UITableViewCell {
        let nib = UINib(nibName: String(describing: customCell.self), bundle: nil)
        self.register(nib, forCellReuseIdentifier: String(describing: customCell.self))
    }
}
