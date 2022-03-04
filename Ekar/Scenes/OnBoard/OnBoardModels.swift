//
//  OnBoardModels.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

enum OnBoardModels {
    
    // MARK: - Photo
    
    enum Photos {
        struct Request {}
        
        struct Response {
            let list: [Photo]
        }
        
        struct ViewModel {
            let list: [Photo]
        }
    }
}
