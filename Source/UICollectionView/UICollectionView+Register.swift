//
//  UICollectionView+Compatible.swift
//  JoUIKit
//
//  Created by Django Lee on 08/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UICollectionView {
    
    public func register(_ cellClass: UICollectionViewCell.Type) {
        base.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    public func register(sectionHeader viewClass: UICollectionReusableView.Type, forSupplementaryViewOfKind elementKind: String) {
        base.register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    public func register(sectionFooter viewClass: UICollectionReusableView.Type, forSupplementaryViewOfKind elementKind: String) {
        base.register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(viewClass))
    }

    public func dequeueReusableCell(_ cellClass: UICollectionViewCell.Type, for indexPath: IndexPath) -> UICollectionViewCell {
        return base.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cellClass), for: indexPath)
    }
    
    public func dequeueReusableSupplementaryView(sectionHeader viewClass: UICollectionReusableView.Type, for indexPath: IndexPath) -> UICollectionReusableView {
        return base.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(viewClass), for: indexPath)
    }

    public func dequeueReusableSupplementaryView(sectionFooter viewClass: UICollectionReusableView.Type, for indexPath: IndexPath) -> UICollectionReusableView {
        return base.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(viewClass), for: indexPath)
    }
}
