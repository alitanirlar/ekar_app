//
//  OnBoardPresenter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol OnBoardPresentationLogic {
    func presentPhotos(response: OnBoardModels.Photos.Response)
    func presentPostCommentSuccess(response: GenericResponseModels.Message.Response)
    func presentError(response: GenericResponseModels.Message.Response)
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
    
    func presentError(response: GenericResponseModels.Message.Response) {
        let viewModel = GenericResponseModels.Message.ViewModel(title: "Error", message: response.message)
        viewController?.displayError(viewModel: viewModel)
    }
    
    func presentPostCommentSuccess(response: GenericResponseModels.Message.Response) {
        let viewModel = GenericResponseModels.Message.ViewModel(title: "Success",  message: response.message)
        viewController?.displayCommentSuccess(viewModel: viewModel)    }
    //
}
