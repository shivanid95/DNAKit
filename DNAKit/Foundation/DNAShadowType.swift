//
//  DNAShadowType.swift
//  DNAKit
//
//  Created by Shivani on 23/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public enum DNAShadowType {
    
    case button
    case modal
    case overflow
    case medium
    case light
    case heavyBottom
    
    public var shadowColor: UIColor {
        switch self {
        default:
            return UIColor.black
        }
    }
    
    public var shadowOpacity: Float {
        switch self {
        case .button: return 0.06
        default:
            return 0.05
        }
        
    }
    
    public var blur: CGFloat {
        switch self {
        case .button:
            return 2
        default:
            return 10
        }
    }
    
    public var spread: CGFloat {
        return 0
    }
    
    public var x: CGFloat {
       return 0
    }
    
    public var y: CGFloat {
        return 1
    }
    
}
