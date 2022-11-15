//
//  TextTableViewCell.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

class TextTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var messageLabel: BaseLabel!
    func set(text: String) {
        messageLabel.text = text
    }
}
