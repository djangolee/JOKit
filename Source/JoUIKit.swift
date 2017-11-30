//
//  JoUIKit.swift
//  JoUIKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

public struct JoUIKit<Base> {

    public let base: Base

    public init(_ base: Base) {
        self.base = base
    }
    
    public static func initializeJoUIKit() {
        UIResponder.methodExchangeImplementations()
        CALayer.methodExchangeImplementations()
    }
}

public protocol JoUIKitCompatible {
    
    associatedtype CompatibleType
    
    static var jo: JoUIKit<CompatibleType>.Type { get set }
    
    var jo: JoUIKit<CompatibleType> { get set }
}

extension JoUIKitCompatible {
    
    public static var jo: JoUIKit<Self>.Type {
        get {
            return JoUIKit<Self>.self
        }
        set {
        }
    }
    
    public var jo: JoUIKit<Self> {
        get {
            return JoUIKit(self)
        }
        set {
        }
    }
}

import class Foundation.NSObject

extension NSObject: JoUIKitCompatible { }
