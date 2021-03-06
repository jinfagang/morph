//
//  YuanCollectionViewFlowLayout.swift
//  Morph
//
//  Created by JinTian on 5/15/16.
//  Copyright © 2016 JinTian. All rights reserved.
//

import UIKit

class YuanCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let kFlickVelocity : CGFloat = 0.5
    let kMinimumLineSpacing : CGFloat = 6
    let kViewSizeWidth : CGFloat = 250
    let kViewSizeHeight : CGFloat = 130
    
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     This method sets up various properties of the horizontal collection view
     */
    override func prepare() {
        if let collectionView = self.collectionView {
            collectionView.isPagingEnabled = false
            self.minimumLineSpacing = self.kMinimumLineSpacing
            self.scrollDirection = .horizontal
            
            self.sectionInset = UIEdgeInsets(top: 0, left: minimumLineSpacing, bottom: 0, right: minimumLineSpacing)
            
            let viewSize = CGSize(width: self.kViewSizeWidth, height: self.kViewSizeHeight);
            setItemSize(viewSize)
        }
    }
    
    /**
     This method defines the size of each item in the horizontal collection view
     
     - parameter viewSize:
     */
    fileprivate func setItemSize(_ viewSize: CGSize){
        let itemSize = CGSize(width: viewSize.width - minimumLineSpacing, height: viewSize.height)
        self.itemSize = itemSize
    }
    
    /**
     This method defines the flick velocity
     
     - returns:
     */
    func flickVelocity() -> CGFloat{
        return self.kFlickVelocity
    }
    
    /**
     This method defines the size of each page needed for the  targetContentOffsetForProposedContentOffset
     
     - returns:
     */
    func pageWidth() ->CGFloat{
        return self.itemSize.width + self.minimumLineSpacing;
    }
    
    /**
     This method defines the behavior of how many cells the collectionview scrolls past when the user flicks the horizontal collection view.
     */
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity  velocity: CGPoint) -> CGPoint {
        
        var proposedContentOffset_after: CGPoint = CGPoint(x: 0, y: 0)
        let rawPageValue : CGFloat = self.collectionView!.contentOffset.x / self.pageWidth();
        let currentPage : CGFloat = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
        let nextPage : CGFloat = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
        
        let pannedLessThanAPage : Bool = fabs(1 + currentPage - rawPageValue) > 0.5;
        let flicked : Bool = fabs(velocity.x) > self.flickVelocity();
        if (pannedLessThanAPage && flicked) {
            proposedContentOffset_after.x = nextPage * self.pageWidth();
        } else {
            proposedContentOffset_after.x = (round(rawPageValue) * self.pageWidth());
        }
        
        return proposedContentOffset_after;
    }
    
}

