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
