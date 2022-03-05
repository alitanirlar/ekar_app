//
//  VehicleRouter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

protocol VehicleRoutingLogic {
    func routeToMapView()
}

protocol VehicleDataPassing {
    var dataStore: VehicleDataStore? { get }
}

final class VehicleRouter: VehicleRoutingLogic, VehicleDataPassing {
    
    // MARK: - Public Properties
    
    weak var viewController: VehicleViewController?
    var dataStore: VehicleDataStore?
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Routing Logic
    
    //
    
    // MARK: - Navigation
    
    func routeToMapView() {
        _ = viewController?.navigationController?.popToRootViewController(animated: true)
    }
    //
    
    // MARK: - Passing data
    
    //
}
