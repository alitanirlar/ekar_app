//
//  ErrorModels.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation

enum GenericResponseModels {
    enum Message {
        struct Request { }
        struct Response {
            let message: String
        }
        
        struct ViewModel {
            let title: String
            let message: String
        }
    }
    
}
