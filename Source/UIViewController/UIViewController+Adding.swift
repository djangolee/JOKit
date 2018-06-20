//
//  UIViewController+Compatible.swift
//  JoUIKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UIViewController {
    
    public func addChildViewController(_ childController: UIViewController, toView: UIView? = nil, frame: CGRect? = nil) {
        base.addChild(childController)
        if let toView = toView {
            toView.addSubview(childController.view)
        }
        if let frame = frame {
            childController.view.frame = frame
        }
        childController.didMove(toParent: base)
    }

    public func removeFromParentViewController() {
        base.willMove(toParent: nil)
        base.view.removeFromSuperview()
        base.removeFromParent()
    }
}
