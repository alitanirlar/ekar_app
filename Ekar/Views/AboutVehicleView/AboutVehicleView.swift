//
//  AboutVehicleView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit
@IBDesignable class AboutVehicleView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: CollectionViewDataSource<Item, PhotoCollectionViewCell>?
    let compositionalLayout: UICollectionViewCompositionalLayout = {
        let fraction: CGFloat = 1 / 4
        let inset: CGFloat = 2.5
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
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
    }
    
    private  func commonInit()  {
        let view = Bundle(for: CommentView.self).loadNibNamed(self.className,
                                                              owner: self,
                                                              options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        titleLabel.configure(font: UIFont(name: Font.bold, size: 16) ?? UIFont.systemFont(ofSize: 16),
                                            textColor: .black)
        titleLabel.text = "about.the.vehicle.title".localized
        
        collectionView.registerCustom(customCell: PhotoCollectionViewCell.self)
        collectionView.collectionViewLayout = compositionalLayout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
     

    }
    
    
    public func setInitValue(data: [Item]) {
        displayAbout(data: data)
    }
    
    private func displayAbout(data: [Item]) {
        
        dataSource = .make(for: data,
                              reuseIdentifier: String(describing: PhotoCollectionViewCell.self), align: .center)
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }

}

extension AboutVehicleView: UICollectionViewDelegate {
    
}
