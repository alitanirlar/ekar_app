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
        
        let aboutData =  [Item(title: "3L Engine", image: UIImage(named: "engine_icon")),
                          Item(title: "2 Seats", image: UIImage(named: "seat_icon")),
                          Item(title: response.response.attributes?.transmissionShort ?? "", image: UIImage(named: "gear_icon") ?? UIImage()),
                          Item(title: "Petrol", image: UIImage(named: "petrol_icon"))]
        
        let keyFeatues = [ "Keyless Entry", "Bluetooth", "Power Windows","ABS Break with EBD","AUX / USB Jack","AM / FM"]
        
        let viewModel = VehicleModels.VehicleSpecs.ViewModel(year: "Year - \(response.response.attributes?.year ?? "") ",
                                                             make: response.response.attributes?.make ?? "",
                                                             model: response.response.attributes?.model ?? "",
                                                             logo: UIImage(named: "toyota_logo") ?? UIImage(),
                                                             style: response.response.attributes?.style ?? "",
                                                             contractLength: "3",
                                                             contractUnit: "MONTH",
                                                             basePrice: "1,553",
                                                             priceUnit: "AED / MONTH",
                                                             bookFee: "120",
                                                             bookCurrency: "AED",
                                                             carouselPhotos: [Item(image: UIImage(named: "carousel") ?? UIImage()) ,
                                                                              Item(image: UIImage(named: "carousel") ?? UIImage())],
                                                             colors: [.red, .primaryColor,.black],
                                                             aboutData: aboutData,
                                                             keyFeatures: keyFeatues
                                                             
        )
        viewController?.displayVehicleSpecs(viewModel: viewModel)
    }
    
    func presentError(response: GenericResponseModels.Message.Response) {
        let viewModel = GenericResponseModels.Message.ViewModel(title: "dialog.error.title".localized, message: response.message)
        viewController?.displayError(viewModel: viewModel)
    }
    
    //
}


