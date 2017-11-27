//
//  ViewController.swift
//  Example
//
//  Created by Django Lee on 05/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import UIKit
import JoUIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "JoUIKit"
       
        let v = JoView()
        v.frame.size = CGSize(width: 100, height: 200)
        v.center = view.center
        v.layer.borderWidth = 1
        view.addSubview(v)
        
        v.jo.addSeparator(.trailing)
        v.jo.separatorTrailingLine?.jo.trailingConstraint?.first?.constant = -15
        v.jo.separatorTrailingLine?.jo.topConstraint?.first?.constant = 15
        v.jo.separatorTrailingLine?.jo.bottomConstraint?.first?.constant = -15
        
        v.jo.addSeparator(.top)
        v.jo.separatorTopLine?.jo.trailingConstraint?.first?.constant = -15
        v.jo.separatorTopLine?.jo.topConstraint?.first?.constant = 15
        v.jo.separatorTopLine?.jo.leadingConstraint?.first?.constant = 15
        
        v.jo.addSeparator(.leading)
        v.jo.separatorLeadingLine?.jo.bottomConstraint?.first?.constant = -15
        v.jo.separatorLeadingLine?.jo.topConstraint?.first?.constant = 15
        v.jo.separatorLeadingLine?.jo.leadingConstraint?.first?.constant = 15
        
        v.jo.addSeparator(.bottom)
        v.jo.separatorBottomLine?.jo.bottomConstraint?.first?.constant = -15
        v.jo.separatorBottomLine?.jo.trailingConstraint?.first?.constant = -15
        v.jo.separatorBottomLine?.jo.leadingConstraint?.first?.constant = 15
    }
}

class JoView: UIView {
    
    override func didMoveToWindow() {
        print("JoView 1")
        super.didMoveToWindow()
        print("JoView 2")
    }
}

extension JoView {
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("JoView " + #function)
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoView " + #function)
    }

    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoView " + #function)
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoView " + #function)
    }
    
}

class JoSubView: JoView {
    
    override func didMoveToWindow() {
        print("JoSubView 1")
        super.didMoveToWindow()
        print("JoSubView 2 \n")
    }
    
    override func layoutSubviews() {
        print("layoutSubviews 1")
        super.layoutSubviews()
        print("layoutSubviews 2")
    }
}

extension JoSubView {
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("JoSubView " + #function)
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoSubView " + #function)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoSubView " + #function)
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoSubView " + #function)
        
        
    }
    
}
