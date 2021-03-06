//
//  CollectionViewDataSource+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation
import UIKit

extension CollectionViewDataSource where T == Item {
    static func make(for photos: [Item], reuseIdentifier: String, align: NSTextAlignment = .left, backgroundColor: UIColor = .white) -> CollectionViewDataSource {
        return CollectionViewDataSource( models: photos, reuseIdentifier: reuseIdentifier ) { (photo, cell) in
            if let cell = cell as? PhotoCollectionViewCell {
                
                cell.set(title: photo.title,
                         photo: photo.image,
                         align: align,
                         backgroundColor: backgroundColor)
                
            }
            cell.layoutIfNeeded()
            
        }
    }
}

extension CollectionViewDataSource where T == String {
    static func make(for tags: [String], reuseIdentifier: String) -> CollectionViewDataSource {
        
        return CollectionViewDataSource( models: tags, reuseIdentifier: reuseIdentifier) { (tag, cell) in
            if let cell = cell as? TagCollectionViewCell {
                cell.set(tag: tag)
            }
            cell.layoutIfNeeded()
            
        }
    }
    
}
