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
        ViewUtils.showHud()
        let queue = DispatchQueue(label: "com.kodworks.queue", qos: .background, attributes: .concurrent)
        queue.async {  [weak self ] in
            self?.worker.getVehicleSpecs(request: request) { response in
                DispatchQueue.main.async {
                    ViewUtils.hideHud()
                }
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
    }
    //
    
    // MARK: - Business Logic
    
    //
}
