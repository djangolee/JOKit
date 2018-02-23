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
        
        public static var all: UIViewSeparatorPosition {
            return UIViewSeparatorPosition(rawValue: 1 << 4 - 1)
        }
        
        public static var top: UIViewSeparatorPosition {
            return UIViewSeparatorPosition(rawValue: 1 << 0)
        }
        
        public static var leading: UIViewSeparatorPosition {
            return UIViewSeparatorPosition(rawValue: 1 << 1)
        }
        
        public static var bottom: UIViewSeparatorPosition {
            return UIViewSeparatorPosition(rawValue: 1 << 2)
        }
        
        public static var trailing: UIViewSeparatorPosition {
            return UIViewSeparatorPosition(rawValue: 1 << 3)
        }
    }
    
    public var separatorTopLine: UIView? {
        get {
            return base.separatorTopLine
        }
    }
    
    public var separatorLeadingLine: UIView? {
        get {
            return base.separatorLeadingLine
        }
    }
    
    public var separatorBottomLine: UIView? {
        get {
            return base.separatorBottomLine
        }
    }
    
    public var separatorTrailingLine: UIView? {
        get {
            return base.separatorTrailingLine
        }
    }
    
    public func addSeparator(_ position: UIViewSeparatorPosition) {
        
        if position.contains(.top) {
            if base.separatorTopLine == nil {
                base.separatorTopLine = UIView()
            }
            base.separatorTopLine?.isHidden = false
        }
        
        if position.contains(.leading) {
            if base.separatorLeadingLine == nil {
                base.separatorLeadingLine = UIView()
            }
            base.separatorLeadingLine?.isHidden = false
        }
        
        if position.contains(.bottom) {
            if base.separatorBottomLine == nil {
                base.separatorBottomLine = UIView()
            }
            base.separatorBottomLine?.isHidden = false
        }
        
        if position.contains(.trailing) {
            if base.separatorTrailingLine == nil {
                base.separatorTrailingLine = UIView()
            }
            base.separatorTrailingLine?.isHidden = false
        }
    }
    
    public func removeSeparator(_ position: UIViewSeparatorPosition) {
        
        if position.contains(.top) {
            base.separatorTopLine?.isHidden = true
        }
        
        if position.contains(.leading) {
            base.separatorLeadingLine?.isHidden = true
        }
        
        if position.contains(.bottom) {
            base.separatorBottomLine?.isHidden = true
        }
        
        if position.contains(.trailing) {
            base.separatorTrailingLine?.isHidden = true
        }
    }
}

// LayoutConstraint

extension JoUIKit where Base: UIView {
    
    public var topConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .top {
                return true
            }
            return false
        })
    }
    
    public var leadingConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .leading {
                return true
            }
            return false
        })
    }
    
    public var bottomConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .bottom {
                return true
            }
            return false
        })
    }
    
    public var trailingConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .trailing {
                return true
            }
            return false
        })
    }
    
    public var leftConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .left {
                return true
            }
            return false
        })
    }
    
    public var rightConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .right {
                return true
            }
            return false
        })
    }
    
    public var widthConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .width {
                return true
            }
            return false
        })
    }
    
    public var heightConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .height {
                return true
            }
            return false
        })
    }
    
    public var centerXConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .centerX {
                return true
            }
            return false
        })
    }
    
    public var centerYConstraint: [NSLayoutConstraint]? {
        return base.superview?.constraints.filter({ (constraint) -> Bool in
            if let view = constraint.firstItem as? UIView, view == base, constraint.firstAttribute == .centerY {
                return true
            }
            return false
        })
    }
    
}

// Separator Supporting

extension UIView {
    
    private static var separatorTopToken: CChar = 0
    private static var separatorLeadingToken: CChar = 0
    private static var separatorBottomToken: CChar = 0
    private static var separatorTrailingToken: CChar = 0
    
    private static let lineColor = UIColor(red: 213 / 255.0, green: 213 / 255.0, blue: 213 / 255.0, alpha: 1)
    private static let apixel = UIScreen.main.jo.apixel
    
    fileprivate var separatorTopLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorTopToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorTopToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            guard let newValue = newValue else { return }
            newValue.backgroundColor = UIView.lineColor
            addSubview(newValue)
            newValue.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: newValue, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: UIView.apixel).isActive = true
        }
    }
    
    fileprivate var separatorLeadingLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorLeadingToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorLeadingToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            guard let newValue = newValue else { return }
            newValue.backgroundColor = UIView.lineColor
            addSubview(newValue)
            newValue.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: newValue, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: UIView.apixel).isActive = true
        }
    }
    
    fileprivate var separatorBottomLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorBottomToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorBottomToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            guard let newValue = newValue else { return }
            newValue.backgroundColor = UIView.lineColor
            addSubview(newValue)
            newValue.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: newValue, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: UIView.apixel).isActive = true
        }
    }
    
    fileprivate var separatorTrailingLine: UIView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorTrailingToken) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorTrailingToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            guard let newValue = newValue else { return }
            newValue.backgroundColor = UIView.lineColor
            addSubview(newValue)
            newValue.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: newValue, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: newValue, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: UIView.apixel).isActive = true
        }
    }
}
