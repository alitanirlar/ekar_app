//
//  TagCollectionViewCell.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagLabel: BaseLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .secondaryColor
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
    func set(tag: String) {
        tagLabel.configure(font: UIFont(name: Font.regular, size: 12)!, textColor: .black)
        tagLabel.text = tag
        tagLabel.textAlignment = .center
    }
    
    
}
