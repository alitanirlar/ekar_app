//
//  VehiclePresenter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

protocol VehiclePresentationLogic {
    func presentVehicleSpecs(response: VehicleModels.VehicleSpecs.Response)
    func presentError(response: GenericResponseModels.Message.Response)
}

final class VehiclePresenter: VehiclePresentationLogic {
    
    // MARK: - Public Properties
    
    weak var viewController: VehicleDisplayLogic?
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Presentation Logic
    
    func presentVehicleSpecs(response: VehicleModels.VehicleSpecs.Response) {
        
        let aboutData =  [Photo(title: "3L Engine", image: UIImage(named: "engine_icon")),Photo(title: "2 Seats", image: UIImage(named: "seat_icon")),Photo(title: "Manual", image: UIImage(named: "gear_icon")!),Photo(title: "Petrol", image: UIImage(named: "petrol_icon"))]
        
        let keyFeatues = [ "3L Engine 3L Engine", "2 Seats 3L Engine", "Manual","Petrol","Petrol","Petrol","Petrol", "3L Engine 3L Engine", "2 Seats 3L Engine",]
        
        let viewModel = VehicleModels.VehicleSpecs.ViewModel(year: "Year - \(response.response.attributes?.year ?? "") ",
                                                             make: response.response.attributes?.make ?? "",
                                                             model: response.response.attributes?.model ?? "",
                                                             logo: UIImage(named: "toyota_logo")!, style: response.response.attributes?.style ?? "",
                                                             contractLength: "3",
                                                             contractUnit: "MONTH",
                                                             basePrice: "1,553",
                                                             priceUnit: "AED / MONTH",
                                                             bookFee: "120",
                                                             bookCurrency: "AED",
                                                             carouselPhotos: [Photo(image: UIImage(named: "carousel") ?? UIImage()) ,
                                                                              Photo(image: UIImage(named: "carousel") ?? UIImage())],
                                                             colors: [.red, .primaryColor,.black],
                                                             aboutData: aboutData,
                                                             keyFeatures: keyFeatues
                                                             
        )
        viewController?.displayVehicleSpecs(viewModel: viewModel)
    }
    
    func presentError(response: GenericResponseModels.Message.Response) {
        let viewModel = GenericResponseModels.Message.ViewModel(title: "Error", message: response.message)
        viewController?.displayError(viewModel: viewModel)
    }
    
    //
}


