//
//  UIView+Extensions.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

extension UIView {
    func addConstraint(top: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingBottom: CGFloat? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                paddingLeft: CGFloat? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingRight: CGFloat? = nil,
                width: CGFloat? = nil,
                height: CGFloat? = nil ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top, let paddingTop = paddingTop {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom, let paddingBottom = paddingBottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right, let paddingRight = paddingRight {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left, let paddingLeft = paddingLeft {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
