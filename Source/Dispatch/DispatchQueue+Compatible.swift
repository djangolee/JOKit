//
//  DispatchQueue+Compatible.swift
//  JoKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import Dispatch

fileprivate var onceTracker = [Int]()

extension JoUIKit where Base: DispatchQueue {
    
    public func once(token: UnsafePointer<Int>, execute work: @escaping @convention(block) () -> Swift.Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if !onceTracker.contains(token.hashValue) {
            onceTracker.append(token.hashValue)
            work()
        }
    }

}

