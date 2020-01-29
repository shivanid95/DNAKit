//
//  DNAAlertType.swift
//  DNAKit
//
//  Created by Shivani on 21/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public enum DNAAlertType {
    
    case message(title: String?, message: String?, actions: [UIAlertAction])
    case textInput(title: String?, message: String?, input: DNATextField, actions: [UIAlertAction])
   
}
