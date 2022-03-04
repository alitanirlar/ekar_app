//
//  MapViewModels.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit
import MapKit

enum MapViewModels {
    
    // MARK: - NearestCar
    
    enum NearestCar {
        
        struct Response {
            let location: MKPointAnnotation
        }
        
        struct ViewModel {
            let location: MKPointAnnotation
        }
    }
    
    // MARK: - CurrentLocation
    
    enum CurrentLocation {
        
        struct Response {
            let region: MKCoordinateRegion
        }
        
        struct ViewModel {
            let region: MKCoordinateRegion
            let animated: Bool
        }
    }
}
