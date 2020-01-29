//
//  DNANumberType.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public enum DNANumberType {
    /**
     Percentage: Appends % sign at the end of the value
     - color :
     - font : font for the number labbel
     - signed : if true appends + / - sign before number value
     */
    case percentage(_ color: Color, font: Font, signed: Bool = false)
    
    /**
     Prepends amount with rupee sign
     - color: option to show positive / negetive values in different colors
     - font: font of the value to display
     - unit: appended to the value eg: "cr"
     */
    case amount(_ color: Color, font: Font, unit: String? = nil)
    
    /**
        shows a number value
        - color: option to show positive / negetive values in different colors
        - font: font of the value to display
        - signed : if true appends + / - sign before number value
        */
    case number(_ color: Color, font: Font, signed: Bool = false)
    
    /**
    Shows a up(🔼) image if value is positive and (🔽) if value is negetive
    - color: option to show positive / negetive values in different colors
    - font: font of the value to display
    - signed : if true appends + / - sign before number value
    */
    case change(_ color: Color, font: Font, signed: Bool = false)
    
    
    public enum Color {
        
        // text color positive numbers are set to green, negetive values are set to red
        case colored
        
        // all values set to the label's text color
        case uncolored
        
    }
    
    public enum Font {
        
        case normal(_ weight: DNAFont)
        case small(_ weight: DNAFont)
        case large(_ weight: DNAFont)
        case custom(size: CGFloat, weight: DNAFont)
        
        var size: CGFloat {
            switch self {
            case .small:
                return 12
            case .large:
                return 17
            case .normal:
                return 15
            case .custom(let size, _):
                return size
            }
        }
        var weight: DNAFont {
            switch self {
            case let .normal(weight):
                return weight
                
            case let .small(weight):
                return weight
                
            case let .large(weight):
                return weight
                
            case let .custom(_, weight):
                return weight
                
            }
        }
    }
}
