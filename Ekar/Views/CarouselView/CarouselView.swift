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
    
    private var dataSource: CollectionViewDataSource<Item, PhotoCollectionViewCell>?
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
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
    
    private  func commonInit()  {
        let view = Bundle(for: CarouselView.self).loadNibNamed(self.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        collectionView.registerCustom(customCell: PhotoCollectionViewCell.self)
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        pageControl.numberOfPages = 0
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .primaryColor
    }
    
    public func setInitValue(data: [Item]) {
        displayPhotos(data: data)
    }
    
    private func displayPhotos(data: [Item]) {
        dataSource = .make(for: data,
                              reuseIdentifier: String(describing: PhotoCollectionViewCell.self),
                              align: .center,
                              backgroundColor: .secondaryColor)
        collectionView.dataSource = dataSource
        collectionView.reloadData()
        pageControl.numberOfPages = data.count
    }
}

// MARK: - UICollectionViewDelegate
extension CarouselView: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension CarouselView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 1
        let spacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let height = collectionView.bounds.height - spacing * (numberOfItemsPerRow + 1)
        return CGSize(width: width, height: height);

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
    
}
