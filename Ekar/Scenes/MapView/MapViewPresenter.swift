//
//  MapViewPresenter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol MapViewPresentationLogic {
    func presentCurrentLocation(response: MapViewModels.CurrentLocation.Response)
    func presentNearestCar(response: MapViewModels.NearestCar.Response)
}

final class MapViewPresenter: MapViewPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: MapViewDisplayLogic?

  // MARK: - Private Properties
  
  //

  // MARK: - Presentation Logic
    
    func presentCurrentLocation(response: MapViewModels.CurrentLocation.Response) {
        let viewModel = MapViewModels.CurrentLocation.ViewModel(region: response.region,
                                                                animated: true)
        viewController?.displayCurrentLocation(viewModel: viewModel)
        
    }
    
    func presentNearestCar(response: MapViewModels.NearestCar.Response) {
        let viewModel = MapViewModels.NearestCar.ViewModel(location: response.location)
        viewController?.displayNearestCar(viewModel: viewModel)
    }
  
  //
}
