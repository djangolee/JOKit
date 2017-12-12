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

    static var number = 1
    
    var number: Int = 0 {
        didSet {
            print("\(number) " + #function + "\(self)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let i = ViewController.number % 10
        ViewController.number += 1
        if i < 6 {
            present(ViewController(), animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
        print()
        print()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController " + #function + "\(self)")
        print()
        title = "JoUIKit"
       
        let v = JoView()
        v.frame.size = CGSize(width: 100, height: 200)
        v.center = view.center
        v.layer.borderWidth = 1
        view.addSubview(v)
        
        let v2 = JoView()
        v2.frame.size = CGSize(width: 100, height: 200)
        v2.center = view.center
        v2.layer.borderWidth = 1
        view.addSubview(v2)
        
        let v3 = JoSubView()
        v3.frame.size = CGSize(width: 100, height: 200)
        v3.center = view.center
        v3.layer.borderWidth = 1
        view.addSubview(v3)
        
        let a = JoLayer()
        a.frame.size = CGSize(width: 50, height: 50)
        a.position = view.center
        a.borderWidth = 1
        v.layer.addSublayer(a)
        
        let a2 = JoLayer()
        a2.frame.size = CGSize(width: 50, height: 50)
        a2.position = view.center
        a2.borderWidth = 1
        v.layer.addSublayer(a2)
        
        let a3 = JoSubLayer()
        a3.frame.size = CGSize(width: 50, height: 50)
        a3.position = view.center
        a3.borderWidth = 1
        v.layer.addSublayer(a3)
        
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
        number += 1
        print("ViewController " + #function + "\(self)")
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("ViewController " + #function + "\(self)")
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("ViewController " + #function + "\(self)")
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("ViewController " + #function + "\(self)")
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("ViewController " + #function + "\(self)")
    }
    
    deinit {
        print(#function + " \(self)")
    }
}

class JoView: UIView {
    
    var number: Int = 0 {
        didSet {
            print("\(number) " + #function + "\(self)")
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("JoView " + #function + "\(self)")
        print()
    }
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        number += 1
        print("JoView " + #function + "\(self)")
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoView " + #function + "\(self)")
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoView " + #function + "\(self)")
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoView " + #function + "\(self)")
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("JoView " + #function + "\(self)")
    }
    
    deinit {
        print(#function + " \(self)")
    }
}

class JoSubView: JoView {
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("JoSubView " + #function + "\(self)")
        print()
    }
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("JoSubView " + #function + "\(self)")
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoSubView " + #function + "\(self)")
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoSubView " + #function + "\(self)")
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoSubView " + #function + "\(self)")
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("JoSubView " + #function + "\(self)")
    }
    
    deinit {
        print(#function + " \(self)")
    }
}

class JoLayer: CALayer {
    
    var number: Int = 0 {
        didSet {
            print("\(number) " + #function + "\(self)")
        }
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        print("JoLayer " + #function + "\(self)")
        print()
    }
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        number += 1
        print("JoLayer " + #function + "\(self)")
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoLayer " + #function + "\(self)")
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoLayer " + #function + "\(self)")
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoLayer " + #function + "\(self)")
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("JoLayer " + #function + "\(self)")
    }
    
    deinit {
        print(#function + " \(self)")
    }
}


class JoSubLayer: JoLayer {
    
    override func layoutSublayers() {
        super.layoutSublayers()
        print("JoSubLayer " + #function + "\(self)")
        print()
    }
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("JoSubLayer " + #function + "\(self)")
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("JoSubLayer " + #function + "\(self)")
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("JoSubLayer " + #function + "\(self)")
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("JoSubLayer " + #function + "\(self)")
    }
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        print("JoSubLayer " + #function + "\(self)")
    }
    
    deinit {
        print(#function + " \(self)")
    }
}

