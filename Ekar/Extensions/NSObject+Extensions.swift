//
//  NSObject+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import Foundation

public extension NSObject {
    
    var className: String {
        return type(of: self).className
    }
    
    static var className: String {
        return stringFromClass(aClass: self)
    }
}

public func stringFromClass(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last ?? ""
}
