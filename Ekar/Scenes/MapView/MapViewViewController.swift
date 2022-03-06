//
//  MapViewViewController.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit
import MapKit

protocol MapViewDisplayLogic: AnyObject {
    
    func displayCurrentLocation(viewModel: MapViewModels.CurrentLocation.ViewModel)
    func displayNearestCar(viewModel: MapViewModels.NearestCar.ViewModel)
    
}

final class MapViewViewController: BaseViewController {
    
    // MARK: - UI Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    //
    
    // MARK: - Public Properties
    
    var interactor: MapViewBusinessLogic?
    var router: (MapViewRoutingLogic & MapViewDataPassing)?
    
    // MARK: - Private Properties
    private let locationManager = CLLocationManager()
    private let annotationIdentifier = "Annotation"
    //
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let interactor = MapViewInteractor()
        let presenter = MapViewPresenter()
        let router = MapViewRouter()
        
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupNavigationBar()
        requestLocationAccess()
        interactor?.fetchCurrentLocation()
        interactor?.fetchNearestCar()
    }
    
    // MARK: - Public Methods
    
    //
    
    // MARK: - Requests
    
    //
    
    // MARK: - Private Methods
    
    private func configure() {
        
        mapView.delegate = self
    }
    
    private func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    // MARK: - UI Actions
    
    //
}

// MARK: - Display Logic

extension MapViewViewController: MapViewDisplayLogic {
    func displayCurrentLocation(viewModel: MapViewModels.CurrentLocation.ViewModel) {
        mapView.setRegion(viewModel.region, animated: viewModel.animated)
    }
    
    func displayNearestCar(viewModel: MapViewModels.NearestCar.ViewModel) {
        mapView.addAnnotation(viewModel.location)
    }
    
}

// MARK: - MKMapViewDelegate

extension MapViewViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? LocationAnnotationView
        
        if annotationView == nil {
            annotationView = LocationAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        } else {
            annotationView!.annotation = annotation
        }
        annotationView?.setImage(named: interactor!.locationMark)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        router?.routeToOnBoard()
        mapView.selectedAnnotations.removeAll()
    }
    
    
}
