//
//  DNAButtonHeight.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit
/**
 Sizes and corresponding scaled font size and spacing insets for DNABaseButton
 */
public enum DNAButtonHeight {
    

    case small
    case medium
    case large
    case extraLarge
    case custom(Int)
    
    ///height of the button
   public var value: Int {
        switch self {
        case .small:
            return 24
        case .medium:
            return 34
        case .large:
            return 40
        case .extraLarge:
            return 50
        case .custom(let val):
            return val
            
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .small:
            return CGFloat(11)
        case .medium:
            return CGFloat(14)
        case .large:
            return CGFloat(14)
        case .extraLarge:
            return CGFloat(14)
        case .custom:
            return CGFloat(14)
            
        }
    }
    
    var imageInsets: UIEdgeInsets {
        switch self {
            
        case .small:
            return UIEdgeInsets(top: 6, left: 5, bottom: 6, right: 4)
        case .medium:
            return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        case .large:
            return UIEdgeInsets(top: 12, left: 5, bottom: 12, right: 5)
        case .extraLarge:
            return UIEdgeInsets(top: 16, left: 5, bottom: 16, right: 5)
        case .custom(_):
            return UIEdgeInsets(top: 16, left: 5, bottom: 16, right: 5)
        }
    }
    
    var buttonInsets: UIEdgeInsets {
        switch self {
        case .small:
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        case .medium:
            return UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        case .large:
            return UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
        case .extraLarge:
            return UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        case.custom(let size):
            return UIEdgeInsets(top: CGFloat(size) * 0.8 , left: 8, bottom: CGFloat(size) * 0.8, right: 8)
            
        }
    }
    
    var cornerRadius: CGFloat {
        return 4
    }
}
