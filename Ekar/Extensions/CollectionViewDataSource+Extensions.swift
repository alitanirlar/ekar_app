//
//  CollectionViewDataSource+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation
import UIKit

extension CollectionViewDataSource where T == Photo {
    static func make(for photos: [Photo],
                     reuseIdentifier: String,
                     align: NSTextAlignment = .left) -> CollectionViewDataSource {
        return CollectionViewDataSource(
            models: photos,
            reuseIdentifier: reuseIdentifier
        ) { (photo, cell) in
            
            cell.titleLabel.set(text: photo.title)
            cell.titleLabel.set(align: align)
            cell.photoImageView.image = photo.image
        }
    }
}
