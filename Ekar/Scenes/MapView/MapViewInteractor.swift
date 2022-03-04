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
    private var currentLatitude: Double = 25.23183
    private var currentLongitude: Double = 55.323976
    private let delta = 0.01
    
    private var nearestCarLatitude: Double = 25.23183
    private var nearestCarLongitude: Double = 55.323976
    
    //
    
    // MARK: - Business Logic
    
    func fetchCurrentLocation() {
        let center = CLLocationCoordinate2D(latitude: currentLatitude,
                                            longitude: currentLongitude)
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: center, span: span)
        let response = MapViewModels.CurrentLocation.Response(region: region)
        presenter?.presentCurrentLocation(response: response)
        
    }
    
    func fetchNearestCar() {
        let currentAnnotation = MKPointAnnotation()
        currentAnnotation.coordinate = CLLocationCoordinate2D(latitude: nearestCarLatitude,
                                                              longitude: nearestCarLongitude )
        
        let response = MapViewModels.NearestCar.Response(location: currentAnnotation)
        presenter?.presentNearestCar(response: response)
        
    }
    
    //
}
