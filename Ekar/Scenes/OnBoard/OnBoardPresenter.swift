//
//  OnBoardPresenter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol OnBoardPresentationLogic {
    func presentPhotos(response: OnBoardModels.Photos.Response)
}

final class OnBoardPresenter: OnBoardPresentationLogic {
    
    // MARK: - Public Properties
    
    weak var viewController: OnBoardDisplayLogic?
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Presentation Logic
    func presentPhotos(response: OnBoardModels.Photos.Response) {
        let viewModel = OnBoardModels.Photos.ViewModel(list: response.list)
        viewController?.displayPhotos(viewModel: viewModel)
    }
    //
}
