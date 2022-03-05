//
//  Constants.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation

enum Constants {
    struct Network {
        static let timeoutInterval: TimeInterval = 150
        static let baseUrl = "https://api.carsxe.com"
        static let key = "tha91z6lv_j8u1nv4xs_ilfswb1e3"
    }
    
    enum UrlPath: String {
        case specs = "/specs"
        case images = "/images"
        case pic = "/pic"
        var fullUrl: String {
            return Constants.Network.baseUrl + self.rawValue
        }
    }
    
}
