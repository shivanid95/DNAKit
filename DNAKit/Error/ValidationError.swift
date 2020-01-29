//
//  ValidationError.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation
/**
 Possible error states for text input
 */
public enum ValidationError: Error {
    
    case invalidEmail
    case invalidPhoneNumber
    case invalidName
    case emptyValue
    case valueTooLow
    case valueTooHigh
    case custom(String)
    
    
    public var message: String {
        switch self {
            
        case .emptyValue: return "Input value cannot be empty"
        case .invalidEmail: return "Please enter valid email"
        case .invalidName: return "Invalid name"
        case .invalidPhoneNumber: return  "Please enter valid phone number"
        case .valueTooLow: return "Invalid input, Enter more characters"
        case .valueTooHigh: return "Enter fewer characters"
        case .custom(let str): return str
        }
    }
}
