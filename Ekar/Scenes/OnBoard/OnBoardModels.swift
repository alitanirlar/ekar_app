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
    
    enum Comments {
        struct Request {
            let value: String?
        }
        
        struct Response {
            let value: String
        }
        
        struct ViewModel {
            let value: String
        }
    }
}
