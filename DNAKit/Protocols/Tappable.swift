//
//  Tappable.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit


public protocol Tappable : class {
    
    associatedtype TappableType
    
    typealias Action = (TappableType) -> Void
    
    func action(_ closure: @escaping Action)
    
}


