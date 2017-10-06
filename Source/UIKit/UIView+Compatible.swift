//
//  UIView+Compatible.swift
//  JoKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UIView {
    
    public var viewController: UIViewController? {
        get {
            var next = self.base.next
            while next != nil {
                if next is UIViewController {
                    break
                }
                next = next?.next
            }
            return next as? UIViewController
        }
    }
    
}
