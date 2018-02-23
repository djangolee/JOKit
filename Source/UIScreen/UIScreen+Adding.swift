//
//  UIScreen+Compatible.swift
//  JoUIKit
//
//  Created by Panghu Lee on 27/11/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UIScreen {
    
    public var apixel: CGFloat {
        return 1 / base.scale
    }
    
    public var boundsSize: CGSize {
        return base.bounds.size
    }
    
}
