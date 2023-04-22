//
//  ScopeFunctions.swift
//  Pods
//
//  Created by KniGht ThanaKorn on 5/3/22.
//

import Foundation

@inline(__always)
public func run<R>(_ block: () -> R) -> R {
    return block()
}

@inline(__always)
public func with<R>(_ object: R, _ block: (R) -> Void) {
    block(object)
}

public protocol ScopeFunction {}

extension ScopeFunction {
    @inline(__always)
    public func also(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }

    @inline(__always)
    public func takeIf(_ predicate: (Self) -> Bool) -> Self? {
        if predicate(self) {
            return self
        } else {
            return nil
        }
    }

    @inline(__always)
    public func takeUnless(_ predicate: (Self) -> Bool) -> Self? {
        if !predicate(self) {
            return self
        } else {
            return nil
        }
    }

    @inline(__always)
    public func `repeat`(_ times: Int, _ action: (Int) -> Void) {
        for index in (0...times - 1) {
            action(index)
        }
    }
}

extension NSObject: ScopeFunction {}
