//
//  Validitable.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation


//Validation type that would take any type as an argument and return true or false.
public protocol Validatable {
    associatedtype T
    //pass an array of conditions to validate (high to low priority)
    func validate(_ functions: [T]) throws -> Bool
    
}
