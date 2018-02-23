//
//  UIView+Separator.swift
//  JoUIKit
//
//  Created by Panghu Lee on 23/02/2018.
//  Copyright © 2018 Django Lee. All rights reserved.
//


// Separator

extension JoUIKit where Base: UIView {
    
    public struct UIViewSeparatorPosition : OptionSet {
        
        public let rawValue: UInt
        public init(rawValue: UInt) {
            self.rawValue = rawValue
        }
    }
    
    public var separatorTopLine: UIView? {
        return base.separatorTopLine
    }
    
    public var separatorLeadingLine: UIView? {
        return base.separatorLeadingLine
    }
    
    public var separatorBottomLine: UIView? {
        return base.separatorBottomLine
    }
    
    public var separatorTrailingLine: UIView? {
        return base.separatorTrailingLine
    }
    
    public func setSeparator(_ position: UIViewSeparatorPosition) {
        
        if position.contains(.top) {
            if base.separatorTopLine == nil {
                base.separatorTopLine = JoViewSeparatorView()
            }
        } else {
            base.separatorTopLine?.removeFromSuperview()
            base.separatorTopLine = nil
        }
        
        if position.contains(.leading) {
            if base.separatorLeadingLine == nil {
                base.separatorLeadingLine = JoViewSeparatorView()
            }
        } else {
            base.separatorLeadingLine?.removeFromSuperview()
            base.separatorLeadingLine = nil
        }
        
        if position.contains(.bottom) {
            if base.separatorBottomLine == nil {
                base.separatorBottomLine = JoViewSeparatorView()
            }
        } else {
            base.separatorBottomLine?.removeFromSuperview()
            base.separatorBottomLine = nil
        }
        
        if position.contains(.trailing) {
            if base.separatorTrailingLine == nil {
                base.separatorTrailingLine = JoViewSeparatorView()
            }
        } else {
            base.separatorTrailingLine?.removeFromSuperview()
            base.separatorTrailingLine = nil
        }
    }
    
    public func removeSeparator(_ position: UIViewSeparatorPosition) {
        if position.contains(.top) {
            base.separatorTopLine?.removeFromSuperview()
            base.separatorTopLine = nil
        }
        
        if position.contains(.leading) {
            base.separatorLeadingLine?.removeFromSuperview()
            base.separatorLeadingLine = nil
        }
        
        if position.contains(.bottom) {
            base.separatorBottomLine?.removeFromSuperview()
            base.separatorBottomLine = nil
        }
        
        if position.contains(.trailing) {
            base.separatorTrailingLine?.removeFromSuperview()
            base.separatorTrailingLine = nil
        }
    }
}

extension JoUIKit.UIViewSeparatorPosition where Base: UIView {
    
    public static var all: JoUIKit.UIViewSeparatorPosition {
        return JoUIKit.UIViewSeparatorPosition(rawValue: 1 << 4 - 1)
    }
    
    public static var top: JoUIKit.UIViewSeparatorPosition {
        return JoUIKit.UIViewSeparatorPosition(rawValue: 1 << 0)
    }
    
    public static var leading: JoUIKit.UIViewSeparatorPosition {
        return JoUIKit.UIViewSeparatorPosition(rawValue: 1 << 1)
    }
    
    public static var bottom: JoUIKit.UIViewSeparatorPosition {
        return JoUIKit.UIViewSeparatorPosition(rawValue: 1 << 2)
    }
    
    public static var trailing: JoUIKit.UIViewSeparatorPosition {
        return JoUIKit.UIViewSeparatorPosition(rawValue: 1 << 3)
    }
}

private class JoViewSeparatorView: UIView {
    
    var positionItem1: NSLayoutConstraint?
    var positionItem2: NSLayoutConstraint?
    var positionItem3: NSLayoutConstraint?
    var thicknessItem: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 213 / 255.0, green: 213 / 255.0, blue: 213 / 255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Separator Supporting

extension UIView {
    
    private static var separatorTopToken: CChar = 0
    private static var separatorLeadingToken: CChar = 0
    private static var separatorBottomToken: CChar = 0
    private static var separatorTrailingToken: CChar = 0
    
    fileprivate var separatorTopLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorTopToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorTopToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var separatorLeadingLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorLeadingToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorLeadingToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var separatorBottomLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorBottomToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorBottomToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var separatorTrailingLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorTrailingToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorTrailingToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
