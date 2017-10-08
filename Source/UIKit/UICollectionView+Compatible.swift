//
//  UICollectionView+Compatible.swift
//  JoUIKit
//
//  Created by Django Lee on 08/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UICollectionView {
    
    public func register(_ cellClass: Swift.AnyClass) {
        base.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    public func register(sectionHeader viewClass: Swift.AnyClass, forSupplementaryViewOfKind elementKind: String) {
        base.register(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    public func register(sectionFooter viewClass: Swift.AnyClass, forSupplementaryViewOfKind elementKind: String) {
        base.register(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(viewClass))
    }

    public func dequeueReusableCell(_ cellClass: Swift.AnyClass, for indexPath: IndexPath) -> UICollectionViewCell {
        return base.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cellClass), for: indexPath)
    }
    
    public func dequeueReusableSupplementaryView(sectionHeader viewClass: Swift.AnyClass, for indexPath: IndexPath) -> UICollectionReusableView {
        return base.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(viewClass), for: indexPath)
    }

    public func dequeueReusableSupplementaryView(sectionFooter viewClass: Swift.AnyClass, for indexPath: IndexPath) -> UICollectionReusableView {
        return base.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(viewClass), for: indexPath)
    }
}
