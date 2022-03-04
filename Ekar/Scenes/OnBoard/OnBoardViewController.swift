//
//  OnBoardViewController.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol OnBoardDisplayLogic: AnyObject {
    func displayPhotos(viewModel: OnBoardModels.Photos.ViewModel)
}

final class OnBoardViewController: BaseViewController {
    
    // MARK: - UI Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var explanationLabel: BaseLabel!
    @IBOutlet weak var photosView: PhotosView!
    @IBOutlet weak var photosViewHeight: NSLayoutConstraint!
    @IBOutlet weak var commentView: CommentView!
    @IBOutlet weak var submitButton: ActionButton!
    
    //
    
    // MARK: - Public Properties
    
    var interactor: OnBoardBusinessLogic?
    var router: (OnBoardRoutingLogic & OnBoardDataPassing)?
    
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
        let interactor = OnBoardInteractor()
        let presenter = OnBoardPresenter()
        let router = OnBoardRouter()
        
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
        setupBackButton()
        interactor?.fetchPhotos(request: OnBoardModels.Photos.Request())
        
    }
    
    
    // MARK: - Public Methods
    
    //
    
    // MARK: - Requests
    
    //
    
    // MARK: - Private Methods
    
    private func configure() {
        photosView.backgroundColor = .white
        photosView.delegate = self
        commentView.backgroundColor = .white
        
        submitButton.configure(title: "Submit")
        explanationLabel.text = "Please upload clear photos of the vehicle to avoid liability of any damages cause before starting reservation"
        
    }
    
    
    // MARK: - UI Actions
    @IBAction func didTapSubmitButton(_ sender: Any) {
        print("Submit")
    }
    
    //
}

// MARK: - Display Logic

extension OnBoardViewController: OnBoardDisplayLogic {
    func displayPhotos(viewModel: OnBoardModels.Photos.ViewModel) {
        photosView.setInitValue(data: viewModel.list)
    }
}

extension OnBoardViewController: PhotosViewDelegate {
    func photosView(_ didSelectItem: IndexPath) {
        ViewUtils.displayMessage(title: "Attention",
                                 message: "Please take a photo",
                                 vc: self) { _ in
            
        }
    }
    
    
    func photosView(_ height: CGFloat) {
        photosViewHeight.constant = height
        scrollView.layoutIfNeeded()
        scrollView.contentSize = CGSize(width: self.view.frame.width,
                                        height: scrollView.frame.size.height)
    }
    
    
}

