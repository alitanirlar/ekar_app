//
//  OnBoardWorker.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import Foundation

final class OnBoardWorker {
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Working Logic
    func postComment(request: OnBoardModels.Comments.Request, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(true)
        }
    }
    //
}
