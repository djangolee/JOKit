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
        print("ViewController " + #function)
        
        title = "JoUIKit"
       
        let v = JoView()
        v.frame.size = CGSize(width: 100, height: 200)
        v.center = view.center
        v.layer.borderWidth = 1
        view.addSubview(v)
        
        let a = JoLayer()
        a.frame.size = CGSize(width: 50, height: 50)
        a.position = view.center
        a.borderWidth = 1
        v.layer.addSublayer(a)
        
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
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("ViewController " + #function)
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("ViewController " + #function)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("ViewController " + #function)
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("ViewController " + #function)
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("ViewController " + #function)
    }
}

class JoView: UIView {
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("JoView " + #function)
    }
    
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
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("JoView " + #function)
    }
}

class JoLayer: CALayer {
    
    override func layoutSublayers() {
        super.layoutSublayers()
        print("JoLayer " + #function)
    }
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("JoLayer " + #function)
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoLayer " + #function)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoLayer " + #function)
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoLayer " + #function)
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("JoLayer " + #function)
    }
}

