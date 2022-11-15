//
//  KeyFeaturesView.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit
@IBDesignable class KeyFeaturesView: UIView {
    
    //    MARK: - Outlets
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: CollectionViewDataSource<String, TagCollectionViewCell>?
    private let layout: TagFlowLayout = {
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 24)
        return layout
        
    }()
    
    private var keyFeatures = [String]()
    
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
        
        titleLabel.configure(font: UIFont(name: Font.bold, size: 12)!,
                                            textColor: .black)
        titleLabel.text = "key.features".localized
        
        collectionView.registerCustom(customCell: TagCollectionViewCell.self)
        collectionView.collectionViewLayout = layout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
     

    }
    
    
    public func setInitValue(data: [String]) {
        displayAbout(data: data)
        keyFeatures = data
    }
    
    private func displayAbout(data: [String]) {
        
        dataSource = .make(for: data,
                              reuseIdentifier: String(describing: TagCollectionViewCell.self))
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }

}

extension KeyFeaturesView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = keyFeatures[indexPath.row]
        let font = UIFont(name: Font.regular, size: 12)!
        let size = tag.size(withAttributes: [NSAttributedString.Key.font: font])
        let dynamicCellWidth = size.width

        /*
          The "+ 20" gives me the padding inside the cell
        */
        return CGSize(width: dynamicCellWidth + 20, height: 24)
    }
    
    // Space between rows
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
