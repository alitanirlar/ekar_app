//
//  OnBoardRouter.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol OnBoardRoutingLogic {

}

protocol OnBoardDataPassing {
  var dataStore: OnBoardDataStore? { get }
}

final class OnBoardRouter: OnBoardRoutingLogic, OnBoardDataPassing {

  // MARK: - Public Properties

  weak var viewController: OnBoardViewController?
  var dataStore: OnBoardDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
  
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
