//
//  DispatchQueue+Compatible.swift
//  JoKit
//
//  Created by Django Lee on 06/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import Dispatch

fileprivate var onceTracker = [UnsafeRawPointer]()

extension JoUIKit where Base: DispatchQueue {
    
    public func once(token: UnsafeRawPointer, execute work: @escaping @convention(block) () -> Swift.Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if onceTracker.contains(token) {
            return
        }
        onceTracker.append(token)
        work()
    }
    
    
}

