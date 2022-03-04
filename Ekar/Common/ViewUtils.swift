//
//  ViewUtils.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

public typealias UIAlertActionHandler = ((UIAlertAction) -> Void)?

public class ViewUtils {
    
    static func displayMessage(title: String? = "dialog.error.title",
                               message: String,
                               vc: UIViewController,
                               okButtonAction: UIAlertActionHandler = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "dialog.ok.button",
                                      style: UIAlertAction.Style.default,
                                      handler: okButtonAction))
        vc.present(alert, animated: true, completion: nil)
    }
}
