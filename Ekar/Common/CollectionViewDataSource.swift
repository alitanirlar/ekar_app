//
//  CollectionViewDataSource.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

class CollectionViewDataSource<T>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (T, PhotoCollectionViewCell) -> Void
    
    var models: [T]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    init(models: [T],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(model, cell as! PhotoCollectionViewCell)
        return cell
    }
    
}
