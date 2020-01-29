//
//  DNAButtonState.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation

/**
 States of DNABaseButton 
 */
public enum DNAButtonState: String, CaseIterable {

    case normal
    case disabled
    case loading
    case highlighted
    case error
    
    
    var isInteractive: Bool {
        switch  self {
        case .disabled, .loading:
            return false
        default:
            return true
        }
    }

}
