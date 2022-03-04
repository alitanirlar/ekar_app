//
//  PhotosView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 4.03.2022.
//

import UIKit

protocol PhotosViewDelegate: AnyObject {
    func photosView(_  height: CGFloat)
    func photosView(_  didSelectItem: IndexPath)
}

@IBDesignable class PhotosView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: PhotosViewDelegate?
    
    
    
    private var dataSource: CollectionViewDataSource<Photo>?
    private let compositionalLayout: UICollectionViewCompositionalLayout = {
        let fraction: CGFloat = 1 / 2
        let inset: CGFloat = 2.5
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset + 20, trailing: inset)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if collectionView.collectionViewLayout.collectionViewContentSize.height > 0.0 {
            delegate?.photosView(collectionView.collectionViewLayout.collectionViewContentSize.height)
        }
        
    }
    
    private  func commonInit()  {
        let view = Bundle(for: PhotosView.self).loadNibNamed(self.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = true
        
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        collectionView.registerCustom(customCell: PhotoCollectionViewCell.self)
        collectionView.collectionViewLayout = compositionalLayout
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
    }
    
    public func setInitValue(data: [Photo]) {
        displayPhotos(data: data)
    }
    
    private func displayPhotos(data: [Photo]) {
        dataSource = .make(for: data,
                              reuseIdentifier: String(describing: PhotoCollectionViewCell.self),
                              align: .center)
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
}


extension PhotosView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.photosView(indexPath)
    }
}


