//
//  CollectionViewDataSource+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation
import UIKit

extension CollectionViewDataSource where T == Photo {
    static func make(for photos: [Photo], reuseIdentifier: String, align: NSTextAlignment = .left) -> CollectionViewDataSource {
        return CollectionViewDataSource( models: photos, reuseIdentifier: reuseIdentifier ) { (photo, cell) in
            if let cell = cell as? PhotoCollectionViewCell {
                
                cell.configure(title: photo.title,
                               photo: photo.image,
                               align: align)
                
            }
            cell.layoutIfNeeded()
            
        }
    }
}


extension CollectionViewDataSource where T == UIColor {
    static func make(for colors: [UIColor], reuseIdentifier: String) -> CollectionViewDataSource {
        
        return CollectionViewDataSource( models: colors, reuseIdentifier: reuseIdentifier) { (color, cell) in
            if let cell = cell as? ColorCollectionViewCell {
                cell.set(color: color)
            }
            cell.layoutIfNeeded()
            
        }
    }
    
}
