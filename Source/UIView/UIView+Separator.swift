//
//  UIView+Separator.swift
//  JoUIKit
//
//  Created by Panghu Lee on 23/02/2018.
//  Copyright © 2018 Django Lee. All rights reserved.
//


// Separator

extension JoUIKit where Base: UIView {
    
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
    
    public func setSeparator(_ position: JoViewSeparatorPosition) {
        
        if position.contains(.top) {
            if base.separatorTopLine == nil {
                base.separatorTopLine = JoViewSeparatorView(position: .top, toView: base)
            }
        } else {
            base.separatorTopLine?.removeFromSuperview()
            base.separatorTopLine = nil
        }
        
        if position.contains(.leading) {
            if base.separatorLeadingLine == nil {
                base.separatorLeadingLine = JoViewSeparatorView(position: .leading, toView: base)
            }
        } else {
            base.separatorLeadingLine?.removeFromSuperview()
            base.separatorLeadingLine = nil
        }
        
        if position.contains(.bottom) {
            if base.separatorBottomLine == nil {
                base.separatorBottomLine = JoViewSeparatorView(position: .bottom, toView: base)
            }
        } else {
            base.separatorBottomLine?.removeFromSuperview()
            base.separatorBottomLine = nil
        }
        
        if position.contains(.trailing) {
            if base.separatorTrailingLine == nil {
                base.separatorTrailingLine = JoViewSeparatorView(position: .trailing, toView: base)
            }
        } else {
            base.separatorTrailingLine?.removeFromSuperview()
            base.separatorTrailingLine = nil
        }
    }
    
    public func removeSeparator(_ position: JoViewSeparatorPosition) {
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
    
    public func setSeparatorToplineCorner(_ corner: JoViewSeparatorCorner, animated: Bool = false) {
        base.separatorTopLine?.corner = corner
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.base.layoutIfNeeded()
            })
        }
    }
    
    public func setSeparatorLeadinglineCorner(_ corner: JoViewSeparatorCorner, animated: Bool = false) {
        base.separatorLeadingLine?.corner = corner
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.base.layoutIfNeeded()
            })
        }
    }
    
    public func setSeparatorBottomlineCorner(_ corner: JoViewSeparatorCorner, animated: Bool = false) {
        base.separatorBottomLine?.corner = corner
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.base.layoutIfNeeded()
            })
        }
    }
    
    public func setSeparatorTrailinglineCorner(_ corner: JoViewSeparatorCorner, animated: Bool = false) {
        base.separatorTrailingLine?.corner = corner
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.base.layoutIfNeeded()
            })
        }
    }
}

private class JoViewSeparatorView: UIView {
    
    var topLayout = NSLayoutConstraint()
    var leadingLayout = NSLayoutConstraint()
    var bottomLayout = NSLayoutConstraint()
    var trailingLayout = NSLayoutConstraint()
    var thicknessItem = NSLayoutConstraint()
    
    let position: JoViewSeparatorPosition
    var corner: JoViewSeparatorCorner = .zero {
        didSet { didSetCorner() }
    }
    
    required init(position: JoViewSeparatorPosition, toView: UIView) {
        self.position = position
        super.init(frame: CGRect.zero)
        
        let thickness: NSLayoutAttribute = position.contains(.top) || position.contains(.bottom) ? .height : .width
        toView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        topLayout = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: toView, attribute: .top, multiplier: 1, constant: 0)
        leadingLayout = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: toView, attribute: .leading, multiplier: 1, constant: 0)
        bottomLayout = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: toView, attribute: .bottom, multiplier: 1, constant: 0)
        trailingLayout = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: toView, attribute: .trailing, multiplier: 1, constant: 0)
        thicknessItem = NSLayoutConstraint(item: self, attribute: thickness, relatedBy: .equal, toItem: nil, attribute: thickness, multiplier: 1, constant: 0)
        
        backgroundColor = UIColor(red: 213 / 255.0, green: 213 / 255.0, blue: 213 / 255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func didSetCorner() {
        guard let _ = superview else { return }
        
        topLayout.constant = corner.top
        leadingLayout.constant = corner.leading
        bottomLayout.constant = -corner.bottom
        trailingLayout.constant = -corner.trailing
        thicknessItem.constant = corner.thickness
        
        thicknessItem.isActive = true
        if position.contains(.top) {
            topLayout.isActive = true
            leadingLayout.isActive = true
            trailingLayout.isActive = true
        } else if position.contains(.leading) {
            topLayout.isActive = true
            leadingLayout.isActive = true
            bottomLayout.isActive = true
        } else if position.contains(.bottom) {
            leadingLayout.isActive = true
            bottomLayout.isActive = true
            trailingLayout.isActive = true
        } else if position.contains(.trailing) {
            topLayout.isActive = true
            bottomLayout.isActive = true
            trailingLayout.isActive = true
        }
    }
    
    override func jo_makeSubviewsLayout() {
        super.jo_makeSubviewsLayout()
        didSetCorner()
    }
}

// Separator Supporting

extension UIView {
    
    private static var separatorTopToken: CChar = 0
    private static var separatorLeadingToken: CChar = 0
    private static var separatorBottomToken: CChar = 0
    private static var separatorTrailingToken: CChar = 0
    
    fileprivate var separatorTopLine: JoViewSeparatorView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorTopToken) as? JoViewSeparatorView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorTopToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var separatorLeadingLine: JoViewSeparatorView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorLeadingToken) as? JoViewSeparatorView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorLeadingToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var separatorBottomLine: JoViewSeparatorView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorBottomToken) as? JoViewSeparatorView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorBottomToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var separatorTrailingLine: JoViewSeparatorView? {
        get {
            return objc_getAssociatedObject(self, &UIView.separatorTrailingToken) as? JoViewSeparatorView
        }
        set {
            objc_setAssociatedObject(self, &UIView.separatorTrailingToken, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public struct JoViewSeparatorPosition : OptionSet {
    
    public let rawValue: UInt
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    public static var all: JoViewSeparatorPosition {
        return JoViewSeparatorPosition(rawValue: 1 << 4 - 1)
    }
    
    public static var top: JoViewSeparatorPosition {
        return JoViewSeparatorPosition(rawValue: 1 << 0)
    }
    
    public static var leading: JoViewSeparatorPosition {
        return JoViewSeparatorPosition(rawValue: 1 << 1)
    }
    
    public static var bottom: JoViewSeparatorPosition {
        return JoViewSeparatorPosition(rawValue: 1 << 2)
    }
    
    public static var trailing: JoViewSeparatorPosition {
        return JoViewSeparatorPosition(rawValue: 1 << 3)
    }
}

public struct JoViewSeparatorCorner {
    
    public let top: CGFloat
    public let leading: CGFloat
    public let bottom: CGFloat
    public let trailing: CGFloat
    public let thickness: CGFloat
    
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat, thickness: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.thickness = thickness
    }
    public static var zero: JoViewSeparatorCorner {
        return JoViewSeparatorCorner(top: 0, leading: 0, bottom: 0, trailing: 0, thickness: UIScreen.main.jo.apixel)
    }
}
