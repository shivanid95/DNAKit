//
//  DNATextInputState.swift
//  DNAKit
//
//  Created by Shivani on 27/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public enum DNATextInputState {
    
    case normal
    case disabled
    case error
    case focused
    
    var borderColor: UIColor {
        switch self {
            
        case .normal:
            return Color.borderRegular
        case .disabled:
            return Color.borderLight
        case .error:
            return Color.dangerRed
        case .focused:
            return Color.link
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .normal:
            return Color.fontNormal
        case .disabled:
            return Color.fontLight
        case .error:
            return Color.dangerRed
        case .focused:
            return Color.link
        }
    }
}
