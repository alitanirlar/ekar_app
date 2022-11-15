//
//  MapViewInteractor.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import Foundation
import MapKit

protocol MapViewBusinessLogic {
    func fetchNearestCar()
    func fetchCurrentLocation()
    var locationMark: String { get }
}

protocol MapViewDataStore {
    
}

final class MapViewInteractor: MapViewBusinessLogic, MapViewDataStore {
    
    // MARK: - Public Properties
    
    var presenter: MapViewPresentationLogic?
    lazy var worker = MapViewWorker()
    var locationMark: String = "location_mark"
    
    // MARK: - Private Properties
    private var currentLocation = CLLocationCoordinate2D(latitude: 25.23183,
                                                         longitude: 55.323976)
    private let delta = 0.01
    
    private var nearestCarLocation = CLLocationCoordinate2D(latitude: 25.23183,
                                                            longitude: 55.323976 )
    //
    
    // MARK: - Business Logic
    
    func fetchCurrentLocation() {
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        let response = MapViewModels.CurrentLocation.Response(region: region)
        presenter?.presentCurrentLocation(response: response)
        
    }
    
    func fetchNearestCar() {
        let currentAnnotation = MKPointAnnotation()
        currentAnnotation.coordinate = nearestCarLocation
        
        let response = MapViewModels.NearestCar.Response(location: currentAnnotation)
        presenter?.presentNearestCar(response: response)
        
    }
    
    //
}
