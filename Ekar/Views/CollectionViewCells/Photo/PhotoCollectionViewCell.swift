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
    }
    
    func configure(title: String? = nil,
                   photo: UIImage) {
        titleLabel.isHidden = title == nil
        titleLabel.text = title
        titleLabel.set(align: .center)
        photoImageView.image = photo
    }
    
}
