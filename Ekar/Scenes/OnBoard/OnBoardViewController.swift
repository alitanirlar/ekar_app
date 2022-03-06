//
//  OnBoardViewController.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 3.03.2022.
//

import UIKit

protocol OnBoardDisplayLogic: AnyObject {
    func displayPhotos(viewModel: OnBoardModels.Photos.ViewModel)
    func displayCommentSuccess(viewModel: GenericResponseModels.Message.ViewModel)
    func displayError(viewModel: GenericResponseModels.Message.ViewModel)
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
    private var comment: String?
    
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
        commentView.delegate = self
        
        submitButton.configure(title: "submit.button.title".localized)
        explanationLabel.text = "explanation.message".localized
        
    }
    
    
    // MARK: - UI Actions
    @IBAction func didTapSubmitButton(_ sender: Any) {
        let request = OnBoardModels.Comments.Request(value: comment)
        interactor?.sendComment(request: request)
    }
    
    @objc override func didTapBackButton() {
        router?.routeToVehicle()
    }
    
    //
}

// MARK: - Display Logic

extension OnBoardViewController: OnBoardDisplayLogic {
    func displayPhotos(viewModel: OnBoardModels.Photos.ViewModel) {
        photosView.setInitValue(data: viewModel.list)
    }
    
    func displayCommentSuccess(viewModel: GenericResponseModels.Message.ViewModel) {
        self.display(title: viewModel.message, message: viewModel.message)
        self.comment = nil
        self.commentView.clear(with: "comment.placeholder".localized )
    }
    
    func displayError(viewModel: GenericResponseModels.Message.ViewModel) {
        self.display(title: viewModel.title,
                     message: viewModel.message)
        
    }
}

extension OnBoardViewController: PhotosViewDelegate {
    func photosView(_ didSelectItem: IndexPath) {
        ViewUtils.displayMessage(title: "attention.dialog.title".localized,
                                 message: "take.photo.message".localized,
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


extension OnBoardViewController: CommentViewDelegate {
    func commentView(_ message: String?) {
        comment = message
    }
}

