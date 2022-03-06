//
//  VehicleModels.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

enum VehicleModels {
    
    // MARK: - VehicleSpecs
    
    enum VehicleSpecs {
        struct Request {
            let vin: String
        }
        
        struct Response {
            var response: VehicleResponse
        }
        
        struct ViewModel {
            let year: String
            let make: String
            let model: String
            let logo: UIImage
            let style: String
            let contractLength: String
            let contractUnit: String
            let basePrice: String
            let priceUnit: String
            let bookFee: String
            let bookCurrency: String
            let carouselPhotos: [Item]
            let colors: [UIColor]
            let aboutData: [Item]
            let keyFeatures: [String]
            
            
        }
    }
}


