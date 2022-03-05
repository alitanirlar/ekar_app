//
//  ApiManager.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation
import Alamofire

open class ApiManager {
    
    struct Shared {
        static var instance: ApiManager?
    }
    open class var sharedInstance: ApiManager {
        if Shared.instance == nil {
            Shared.instance = ApiManager()
        }
        return Shared.instance!
    }
    
    let manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = Constants.Network.timeoutInterval
        configuration.timeoutIntervalForRequest  =  Constants.Network.timeoutInterval
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        return Alamofire.Session(configuration: configuration, serverTrustManager: nil)
    }()
}
