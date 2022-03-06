//
//  VehicleViewController.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

protocol VehicleDisplayLogic: AnyObject {
    func displayVehicleSpecs(viewModel: VehicleModels.VehicleSpecs.ViewModel)
    func displayError(viewModel: GenericResponseModels.Message.ViewModel)
}

final class VehicleViewController: UIViewController {
    
    // MARK: - UI Outlets
    @IBOutlet weak var upContentView: UIView!
    @IBOutlet weak var carouselView: CarouselView!
    @IBOutlet weak var yearLabel: BaseLabel!
    @IBOutlet weak var colorsView: ColorsView!
    @IBOutlet weak var basePriceView: BasePriceView!
    @IBOutlet weak var tenureView: TenureView!
    @IBOutlet weak var bookFeeView: BookFeeView!
    @IBOutlet weak var aboutVehicleView: AboutVehicleView!
    @IBOutlet weak var keyFeaturesView: KeyFeaturesView!
    @IBOutlet weak var brandView: BrandView!
    @IBOutlet weak var proceedButton: ActionButton!
    
    //
    
    // MARK: - Public Properties
    
    var interactor: VehicleBusinessLogic?
    var router: (VehicleRoutingLogic & VehicleDataPassing)?
    
    // MARK: - Private Properties
    
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
        let interactor = VehicleInteractor()
        let presenter = VehiclePresenter()
        let router = VehicleRouter()
        
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
        let request = VehicleModels.VehicleSpecs.Request(vin: "JTDZN3EU0E3298500")
        interactor?.getVehicleSpecs(request: request)
    }
    
    // MARK: - Public Methods
    
    //
    
    // MARK: - Requests
    
    //
    
    // MARK: - Private Methods
    
    private func configure() {
        setupNavigationBar()
        setupBackButton()
        carouselView.backgroundColor = .clear
        colorsView.backgroundColor = .clear
        basePriceView.backgroundColor = .clear
        tenureView.backgroundColor = .clear
        tenureView.delegate = self
        bookFeeView.backgroundColor = .clear
        bookFeeView.didTapAction = {
            ViewUtils.displayMessage(title: "How Works?",
                                     message: "toast messages", vc: self)
        }
        
        yearLabel.text = ""
        yearLabel.configure(font: UIFont(name: Font.regular, size: 12)!,
                            textColor: .black)
        aboutVehicleView.backgroundColor = .clear
        keyFeaturesView.backgroundColor = .clear
        brandView.backgroundColor = .clear
        proceedButton.configure(title: "Proceed with your selection", titleColor: .white, font: UIFont(name: Font.bold, size: 14)!)
 
    }
    
    
    // MARK: - UI Actions
    
    @objc func didTapProceedButton() {
        router?.routeToMapView()
    }
    //
}

// MARK: - Display Logic

extension VehicleViewController: VehicleDisplayLogic {
    
    func displayVehicleSpecs(viewModel: VehicleModels.VehicleSpecs.ViewModel) {
        upContentView.backgroundColor = .secondaryColor
        carouselView.setInitValue(data: viewModel.carouselPhotos)
        colorsView.setInitValue(data: viewModel.colors)
        yearLabel.text = viewModel.year
        basePriceView.setInitValue(price: viewModel.basePrice,
                                   currencyType: viewModel.priceUnit,
                                   contractUnit: "Month",
                                   contractLenght: viewModel.contractLength)
        bookFeeView.setInitValue(currencyType: "AED", price: "120")
        
        
        let data = [Photo(title: "3L Engine", image: UIImage(named: "engine_icon")),Photo(title: "2 Seats", image: UIImage(named: "seat_icon")),Photo(title: "Manual", image: UIImage(named: "gear_icon")!),Photo(title: "Petrol", image: UIImage(named: "petrol_icon"))]
        
        aboutVehicleView.setInitValue(data: data)
        

        let data2 = [ "3L Engine 3L Engine", "2 Seats 3L Engine", "Manual","Petrol","Petrol","Petrol","Petrol"]
        keyFeaturesView.setInitValue(data: data2)
        
        brandView.setInitValue(logo: UIImage(named: "engine_icon")!, make: "Nissan", model: "Micra", style: "HATCHBACK")
        
        
    }
    
    func displayError(viewModel: GenericResponseModels.Message.ViewModel) {
        display(title: viewModel.title, message: viewModel.message)
    }
}

extension VehicleViewController: TenureViewDelegate {
    func tenureView(_ sliderValue: Int) {
        basePriceView.setContract(length: sliderValue.description)
    }
    
    
}
