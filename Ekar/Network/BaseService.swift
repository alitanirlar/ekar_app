//
//  BaseService.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Alamofire
import UIKit

public class BaseService {
    class func responseService<T: Codable>(_ url: URL,
                                           method: HTTPMethod = .get,
                                           params: Parameters? = nil,
                                           completion: @escaping (Result<T, AFError>) -> Void) {
        ApiManager.sharedInstance.manager.request(url,
                                                  method: method,
                                                  parameters: params,
                                                  encoding: URLEncoding.default)
            .validate(statusCode: 200..<299).responseDecodable(of: T.self) { response in
//                NetworkLogger.log(data: response.data, response: response.response, error: response.error)

                switch response.result {
                case .success(let results):
                    completion(.success(results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

}

