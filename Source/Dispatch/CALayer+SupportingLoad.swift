//
//  CALayer+SupportingLoad.swift
//  JoUIKit
//
//  Created by Panghu Lee on 30/11/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import Foundation

extension CALayer {
    
    private static var exOnceToken: Int = 0
    private static var loadOnceToken: Int = 0
    private static var supportingLoadViewToken: CChar = 0
    
    internal class func methodExchangeImplementations() {
        
        DispatchQueue.main.jo.once(token: &exOnceToken) {
            if let oldMethod = class_getInstanceMethod(CALayer.self, #selector(CALayer.layoutSublayers)),
                let newMethod = class_getInstanceMethod(CALayer.self, #selector(CALayer.jo_supportingLoadView)) {
                method_exchangeImplementations(newMethod, oldMethod)
            }
        }
    }
    
    @objc internal func jo_supportingLoadView() {
        jo_supportingLoadView()
        
        guard Thread.main == Thread.current else { return }
        
        let initializationCompletion = objc_getAssociatedObject(self, &CALayer.supportingLoadViewToken) as? Bool
        guard superlayer != nil, bounds.size != CGSize.zero, initializationCompletion == nil else { return }
        objc_setAssociatedObject(self, &CALayer.supportingLoadViewToken, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        self.jo_prepareLoadView()
        self.jo_setupUI()
        self.jo_setupSubviews()
        self.jo_bindingSubviewsLayout()
        self.jo_viewDidLoad()
    }
}

extension CALayer: JoSupportingLoadView {
    
    @objc open func jo_viewDidLoad() {
        
    }
    
    @objc open func jo_prepareLoadView() {
        
    }
    
    @objc open func jo_setupSubviews() {
        
    }
    
    @objc open func jo_bindingSubviewsLayout() {
        
    }
    
    @objc open func jo_setupUI() {
        
    }
}
