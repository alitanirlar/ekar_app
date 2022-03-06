//
//  VehicleInteractor.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation

protocol VehicleBusinessLogic {
    func getVehicleSpecs(request: VehicleModels.VehicleSpecs.Request)
}

protocol VehicleDataStore {
    
}

final class VehicleInteractor: VehicleBusinessLogic, VehicleDataStore {
    
    // MARK: - Public Properties
    
    var presenter: VehiclePresentationLogic?
    lazy var worker = VehicleWorker()
    
    // MARK: - Private Properties
    func getVehicleSpecs(request: VehicleModels.VehicleSpecs.Request) {
        worker.getVehicleSpecs(request: request) { [weak self ] response in
            switch response {
            case .success(let result):
                let response = VehicleModels.VehicleSpecs.Response(response: result)
                self?.presenter?.presentVehicleSpecs(response: response)
            case .failure(let error):
                let response = GenericResponseModels.Message.Response(message: error.localizedDescription)
                self?.presenter?.presentError(response: response)
            }
        }
        
    }
    //
    
    // MARK: - Business Logic
    
    //
}


/*
 
 basePriceView.setInitValue(price: viewModel.basePrice,
                            currencyType: viewModel.priceUnit,
                            contractUnit: "Month",
                            contractLenght: viewModel.contractLength)
 bookFeeView.setInitValue(currencyType: "AED", price: "120")
 
 
 let data = [Photo(title: "3L Engine", image: UIImage(named: "engine_icon")),Photo(title: "2 Seats", image: UIImage(named: "seat_icon")),Photo(title: "Manual", image: UIImage(named: "gear_icon")!),Photo(title: "Petrol", image: UIImage(named: "petrol_icon"))]
 
 aboutVehicleView.setInitValue(data: data)
 

 let data2 = [ "3L Engine 3L Engine", "2 Seats 3L Engine", "Manual","Petrol","Petrol","Petrol","Petrol"]
 keyFeaturesView.setInitValue(data: data2)
 
 brandView.setInitValue(logo: UIImage(named: "engine_icon")!, make: "Nissan", model: "Micra", style: "HATCHBACK")
 */
