//
//  MapViewRouter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol MapViewRoutingLogic {
    
    func routeToOnBoard()
}

protocol MapViewDataPassing {
    var dataStore: MapViewDataStore? { get }
}

final class MapViewRouter: MapViewRoutingLogic, MapViewDataPassing {
    
    // MARK: - Public Properties
    
    weak var viewController: MapViewViewController?
    var dataStore: MapViewDataStore?
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Routing Logic
    
    //
    
    // MARK: - Navigation
    func routeToOnBoard() {
        let destination = UIStoryboard().onBoard.instantiateViewController(withIdentifier: OnBoardViewController.self)
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
    //
    
    // MARK: - Passing data
    
    //
}
