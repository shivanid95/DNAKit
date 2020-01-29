//
//  UITextField+ext.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

extension UITextField : Validatable {
    
    // public typealias T = Rule
    public func validate(_ functions: [TextValidationRuleType]) throws -> Bool {
        
        var isSuccess = true
        
        for condition in functions {
            if !condition.rule.isValid(self.text ?? "") {
                isSuccess = false
                throw condition.error
                
            }
        }
        
        return isSuccess
    }
    
}
