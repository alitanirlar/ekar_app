//
//  LocationAnnotationView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit
import MapKit

final class LocationAnnotationView: MKAnnotationView {
    
    // MARK: Init
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        canShowCallout = true
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        backgroundColor = .clear
        let view = UIView()
        addSubview(view)
        view.frame = bounds
    }
    
    func setImage(named: String) {
        self.image = UIImage(named: named)
    }
}
