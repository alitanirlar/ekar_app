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
    
    //
    
    // MARK: - Public Properties
    
    var interactor: VehicleBusinessLogic?
    var router: (VehicleRoutingLogic & VehicleDataPassing)?
    
    // MARK: - Private Properties
    var proceedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryColor
        button.setTitle("Proceed with your selection", for: .normal)
        button.titleLabel?.font = UIFont(name: Font.medium, size: 14)
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(didTapProceedButton), for: .touchUpInside)
        return button
    }()
    
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
        
        yearLabel.text = ""
        yearLabel.font = UIFont(name: Font.regular, size: 12)
        
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
