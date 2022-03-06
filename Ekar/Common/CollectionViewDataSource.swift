//
//  CollectionViewDataSource.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import UIKit

class CollectionViewDataSource<T, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (T, Cell) -> Void
    
    var models: [T] = []
    
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
        let cell: Cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Cell
        cellConfigurator(model, cell)
        return cell
    }
    
}
