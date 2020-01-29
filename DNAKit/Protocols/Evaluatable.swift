//
//  Evaluatable.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation

import Foundation

// Adopted by String
// Evaluates the condition to return true or false

public protocol Evaluatable {
    associatedtype T
    
    func evaluate(with condition: T) -> Bool
}
