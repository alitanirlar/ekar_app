//
//  CarouselView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

@IBDesignable class CarouselView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var dataSource: CollectionViewDataSource<Photo>?
    
    func generateLayout() -> UICollectionViewCompositionalLayout {
        let width: CGFloat = 1
        let height: CGFloat = 1
        let inset: CGFloat = 2.5
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width),
                                              heightDimension: .fractionalHeight(height))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset + 20, trailing: inset)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width),
                                               heightDimension: .fractionalWidth(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        section.orthogonalScrollingBehavior = .paging
        section.visibleItemsInvalidationHandler = { [weak self] visibleItems, point, environment in
            self?.pageControl.currentPage = visibleItems.last!.indexPath.row
        }
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
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
    
    private  func commonInit()  {
        let view = Bundle(for: CarouselView.self).loadNibNamed(self.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        collectionView.registerCustom(customCell: PhotoCollectionViewCell.self)
        collectionView.collectionViewLayout = generateLayout()
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        
        pageControl.numberOfPages = 0
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .primaryColor
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
        pageControl.numberOfPages = data.count
    }
}


extension CarouselView: UICollectionViewDelegate {
    
}



