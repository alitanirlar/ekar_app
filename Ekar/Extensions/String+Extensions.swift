//
//  String+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import Foundation
extension String {
    public var localized: String {
        
        var language = Locale.current.languageCode
        if language != "en" || language != "ar" {
        language = "en"
        }
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
