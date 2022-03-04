//
//  OnBoardInteractor.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import Foundation
import UIKit

protocol OnBoardBusinessLogic {
    func fetchPhotos(request: OnBoardModels.Photos.Request)
}

protocol OnBoardDataStore {
    
}

final class OnBoardInteractor: OnBoardBusinessLogic, OnBoardDataStore {
    
    // MARK: - Public Properties
    
    var presenter: OnBoardPresentationLogic?
    lazy var worker = OnBoardWorker()
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Business Logic
    func fetchPhotos(request: OnBoardModels.Photos.Request) {
        let data = [Photo(title: "FRONT/LEFT", image: UIImage(named: "front_left_icon")!),
                    Photo(title: "FRONT/RIGHT", image: UIImage(named: "front_right_icon")!),
                    Photo(title: "BACK/LEFT", image: UIImage(named: "back_left_icon")!),
                    Photo(title: "BACK/RIGHT", image: UIImage(named: "back_right_icon")!)]
        
        let response = OnBoardModels.Photos.Response(list: data)
        presenter?.presentPhotos(response: response)
    }
    //
}