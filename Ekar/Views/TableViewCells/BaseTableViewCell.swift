//
//  BaseTableViewCell.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle  = .none
    }
    
}
