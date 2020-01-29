//
//  TextValidationRules.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation

public enum TextValidationRule {
    
    case noRestriction
    case nonEmpty
    //Regex string
    case string(String)
    case regularExpression(NSRegularExpression)
    case predicate((String) -> Bool)
    
    public func isValid(_ input: String) -> Bool {
        switch self {
        //There are no restrictions, i.e. any input is valid, including the empty string
        case .noRestriction:
            return true
            
        //The input must be non-empty
        case .nonEmpty:
            return !input.isEmpty
            
        //The substring is part of the string being validated
        case .string(let str):
            return input.evaluate(with: str)
            
        //You can specify a regular expression the input string must match
        case .regularExpression(let regex):
            let fullNSRange = NSRange(input.startIndex..., in: input)
            return regex.rangeOfFirstMatch(in: input, options: .anchored, range: fullNSRange) == fullNSRange
            
        //Yu can pass in a predicate function that determines if the input is valid
        case .predicate(let p):
            return p(input)
        }
    }
    
}
