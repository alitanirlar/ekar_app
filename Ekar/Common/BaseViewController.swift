//
//  BaseViewController.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let logoFrame = CGRect(x: 0, y: 0, width: 74, height: 30)
    private let backButtonFrame = CGRect(x: 0, y: 0, width: 80, height: 30)
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupNavigationBar() {
        
        let logoContainer = UIView(frame: logoFrame)
        
        let imageView = UIImageView(frame: logoFrame)
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
    }
    
    func setupBackButton() {
        let backChevron = UIImage(named: "back_icon")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:backChevron,
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(self.popViewController))
    }
    
    @objc private func popViewController()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    func display(title: String,
                 message: String) {
        
        ViewUtils.displayMessage(title: title,
                                 message: message,
                                 vc: self)
    }
    
}
