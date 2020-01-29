//
//  ExtensibleByAssociatedObjects.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation


public protocol ExtensibleByAssociatedObject { }

extension ExtensibleByAssociatedObject {
    /// Returns the value associated with a given object for a given key.
    ///
    /// - Parameter key: The key for the association.
    /// - Returns: The value associated with the key for object.
    
    public func associatedObject<T>(_ key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }
    
    /// Returns the value associated with a given object for a given key.
    ///
    /// - Parameters:
    ///   - key: The key for the association.
    ///   - defaultValue: The default value to return if the no associated value is found.
    ///   - defaultValueAssociationPolicy: An optional value to save the `defaultValue` so the next call
    ///                                    will have the associated object.
    /// - Returns: The value associated with the key for object.
    public func associatedObject<T>(_ key: UnsafeRawPointer, default defaultValue: @autoclosure () -> T, policy defaultValueAssociationPolicy: AssociatedObjectPolicy? = nil) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            let defaultValue = defaultValue()
            
            if let associationPolicy = defaultValueAssociationPolicy {
                setAssociatedObject(key, value: defaultValue, policy: associationPolicy)
            }
            
            return defaultValue
        }
        
        return value
    }
    
    /// Sets an associated value for a given object using a given key and association policy.
    ///
    /// - Parameters:
    ///   - key: The key for the association.
    ///   - value: The value to associate with the key for object. Pass `nil` to clear an existing association.
    ///   - policy: The policy for the association. The default value is `.strong`.
    public func setAssociatedObject<T>(_ key: UnsafeRawPointer, value: T?, policy: AssociatedObjectPolicy = .strong) {
        objc_setAssociatedObject(self, key, value, policy.rawValue)
    }
}

public enum AssociatedObjectPolicy {
    /// Specifies a weak reference to the associated object.
    case weak
    
    /// Specifies a strong reference to the associated object.
    ///
    /// The association is not made atomically.
    case strong
    
    /// Specifies a strong reference to the associated object.
    ///
    /// The association is made atomically.
    case strongAtomic
    
    /// Specifies that the associated object is copied.
    ///
    /// The association is not made atomically.
    case copy
    
    /// Specifies that the associated object is copied.
    ///
    /// The association is made atomically.
    case copyAtomic
    
    fileprivate var rawValue: objc_AssociationPolicy {
        switch self {
        case .weak:
            return .OBJC_ASSOCIATION_ASSIGN
        case .strong:
            return .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        case .strongAtomic:
            return .OBJC_ASSOCIATION_RETAIN
        case .copy:
            return .OBJC_ASSOCIATION_COPY_NONATOMIC
        case .copyAtomic:
            return .OBJC_ASSOCIATION_COPY
        }
    }
}

extension NSObject: ExtensibleByAssociatedObject { }
