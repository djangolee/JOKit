//
//  Window.swift
//  Example
//
//  Created by Django Lee on 07/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import UIKit

class Window: UIWindow {
    
    override func didMoveToWindow() {
        print("Window 1")
        super.didMoveToWindow()
        print("Window 2 \n")
    }
    
    override func makeKeyAndVisible() {
        print("Window 1 makeKeyAndVisible \n")
        super.makeKeyAndVisible()
        print("Window 2 makeKeyAndVisible \n")
    }
    
    override func layoutSubviews() {
        print("Window layoutSubviews 1")
        super.layoutSubviews()
        print("Window layoutSubviews 2")
    }
    
}

extension Window {
    
    override func jo_prepareLoadView() {
        super.jo_prepareLoadView()
        print("Window " + #function)
    }
    
    override func jo_setupUI() {
        super.jo_setupUI()
        print("Window " + #function)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        print("Window " + #function)
    }
    
    override func jo_bindingSubviewsLayout() {
        super.jo_bindingSubviewsLayout()
        print("Window " + #function)
    }
    
}
