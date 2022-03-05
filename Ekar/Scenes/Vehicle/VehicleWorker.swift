//
//  VehicleWorker.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation
import Alamofire

final class VehicleWorker {
  
  // MARK: - Private Properties
  
  //

  // MARK: - Working Logic
    func getVehicleSpecs(request: VehicleModels.VehicleSpecs.Request,
                         completion: @escaping(Result<VehicleResponse, AFError>) -> Void) {
        guard let url = URL(string: Constants.UrlPath.specs.fullUrl) else { return }
        
        let params = ["key": Constants.Network.key,
                      "vin": request.vin ]
        BaseService.responseService(url, method: .get, params: params, completion: completion)
    }
  //
}
