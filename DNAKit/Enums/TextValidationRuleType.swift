//
//  TextValidationType.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation


public enum TextValidationRuleType {
    
    case email
    case phoneNumber
    case nonEmpty
    case name
    case lessThan(maxValue: Int)
    case greaterThan(minValue: Int)
    case custom(TextValidationRule, ValidationError?)
    
    public var rule: TextValidationRule {
        switch self {
        case .nonEmpty:
            return .nonEmpty
        case .email:
            let regexp =  "[A-Z0-9a-z._]+@([\\w\\d]+[\\.\\w\\d]*)"
            return TextValidationRule.string(regexp)
            
        case .phoneNumber:
            let regexp = "^[0-9]{10}$"
            return TextValidationRule.string(regexp)
            
        case .name:
            let regex = "^[a-zA-Z ]{2,}$"
            return TextValidationRule.string(regex)
            
        case .custom(let rule, _):
            return rule
        case .lessThan(let maxValue):
            return TextValidationRule.predicate({ (str) -> Bool in
                return str.count < maxValue
            })
            
        case .greaterThan(let minValue):
            return TextValidationRule.predicate({ (str) -> Bool in
                return str.count > minValue
            })
            
            
            
        }
    }
    
    public var error: ValidationError {
        switch self {
        case .nonEmpty:
            return .emptyValue
            
        case .name:
            return .invalidName
            
        case .greaterThan(_):
            return .valueTooLow
            
        case .lessThan(_):
            return .valueTooHigh
            
        case .email:
            return .invalidEmail
            
        case .phoneNumber:
            return .invalidPhoneNumber
            
        case .custom(_, let error):
            return error ?? .custom("Invalid value")
            
        }
    }
}
