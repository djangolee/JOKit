//
//  UIView+Compatible.swift
//  JoUIKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

// Responder

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

    public var viewControllers: [UIViewController]? {
        get {
            var viewControllers: [UIViewController]?
            var next = self.base.next
            while next != nil {
                if let viewController = next as? UIViewController {
                    viewControllers = viewControllers ?? [UIViewController]()
                    viewControllers?.append(viewController)
                }
                next = next?.next
            }
            return viewControllers
        }
    }
    
    public func topViewController(window: UIWindow?) -> UIViewController? {
        var topViewController = window?.rootViewController
        while topViewController?.presentedViewController != nil {
            topViewController = topViewController?.presentedViewController
        }
        return topViewController
    }
    
    public var topViewController: UIViewController? {
        get {
            return topViewController(window: UIApplication.shared.keyWindow)
        }
    }
    
}
