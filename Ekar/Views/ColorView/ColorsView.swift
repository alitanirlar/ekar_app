//
//  ColorsView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

@IBDesignable class ColorsView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewWidth: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var dataSource: CollectionViewDataSource<UIColor, ColorCollectionViewCell>?
    private let compositionalLayout: UICollectionViewCompositionalLayout = {
        let fraction: CGFloat = 1
        let inset: CGFloat = 1
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(8), heightDimension: .absolute(8))
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
    
    private  func commonInit()  {
        let view = Bundle(for: ColorsView.self).loadNibNamed(self.className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        collectionView.registerCustom(customCell: ColorCollectionViewCell.self)
        collectionView.collectionViewLayout = compositionalLayout
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        titleLabel.text = ""
    }
    
    public func setInitValue(data: [UIColor]) {
        displayColors(data: data)
    }
    
    private func displayColors(data: [UIColor]) {
        
        titleLabel.text = "Available colors"
        titleLabel.font = UIFont(name: Font.regular, size: 12)
        dataSource = .make(for: data,
                              reuseIdentifier: String(describing: ColorCollectionViewCell.self))
        collectionView.dataSource = dataSource
        collectionViewWidth.constant = CGFloat(data.count * 12)
        collectionView.reloadData()
    }
}


extension ColorsView: UICollectionViewDelegate {
    
}


