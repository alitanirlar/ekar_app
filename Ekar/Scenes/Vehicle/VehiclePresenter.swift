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
        let viewModel = VehicleModels.VehicleSpecs.ViewModel(year: "Year - \(response.response.attributes?.year ?? "") ",
                                                             make: response.response.attributes?.make ?? "",
                                                             model: response.response.attributes?.model ?? "",
                                                             logo: UIImage(),
                                                             contractLength: "3",
                                                             basePrice: "1,553",
                                                             priceUnit: "AED / MONTH",
                                                             bookFee: "120",
                                                             bookCurrency: "AED",
                                                             carouselPhotos: [Photo(image: UIImage(named: "carousel") ?? UIImage()) ,
                                                                              Photo(image: UIImage(named: "carousel") ?? UIImage())],
                                                             colors: [.red, .primaryColor,.black])
        viewController?.displayVehicleSpecs(viewModel: viewModel)
    }
    
    func presentError(response: GenericResponseModels.Message.Response) {
        let viewModel = GenericResponseModels.Message.ViewModel(title: "Error", message: response.message)
        viewController?.displayError(viewModel: viewModel)
    }
    
    //
}
