//
//  PhotoCollectionViewCell.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: BaseLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFit
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
    
    func set(title: String? = nil,
                   photo: UIImage? = nil,
                   align: NSTextAlignment = .center,
             backgroundColor: UIColor) {
        titleLabel.isHidden = title == nil
        photoImageView.isHidden = photo == nil
        titleLabel.text = title
        titleLabel.textAlignment = align
        photoImageView.image = photo
        self.backgroundColor = backgroundColor
    }
    
}
