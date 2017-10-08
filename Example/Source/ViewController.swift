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
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let joView = JoSubView()
            joView.didMoveToWindow()
            joView.frame = self.view.bounds
            joView.didMoveToWindow()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 13) {
                print("1")
                joView.removeFromSuperview()
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 23) {
                print("2")
                self.view.addSubview(joView)
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 33) {
                print("3")
                joView.removeFromSuperview()
                joView.frame = self.view.bounds
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 43) {
                print("4")
                self.view.addSubview(joView)
            }
        }
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
