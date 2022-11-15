//
//  TagFollowLayout.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 6.03.2022.
//

import UIKit

class TagFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
         let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
         var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
         var leftMargin: CGFloat = 0.0
        guard let attributesForElementsInRect else { return nil }
         for attributes in attributesForElementsInRect {
             if (attributes.frame.origin.x == self.sectionInset.left) {
                 leftMargin = self.sectionInset.left
             } else {
                 var newLeftAlignedFrame = attributes.frame
                 newLeftAlignedFrame.origin.x = leftMargin
                 attributes.frame = newLeftAlignedFrame
             }
             leftMargin += attributes.frame.size.width + 8
             newAttributesForElementsInRect.append(attributes)
         }
         
         return newAttributesForElementsInRect
     }
}
