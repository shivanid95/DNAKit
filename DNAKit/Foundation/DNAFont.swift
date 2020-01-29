//
//  DNAFont.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public enum DNAFont: String, CaseIterable {
    
    
    case light = "Graphik-Light-App"
    case regular = "Graphik-Regular-App"
    case medium = "Graphik-Medium-App"
    case semibold = "Graphik-Semibold-App"
    case bold = "Graphik-Bold-App"
    case regularItalic = "Graphik-RegularItalic-App"
    case mediumItalic = "Graphik-MediumItalic-App"
    
    public var fontName: String {
        switch self {
        case .bold: return "GraphikApp-Bold"
        case .semibold: return "GraphikApp-Semibold"
        case .medium: return "GraphikApp-Medium"
        case .light: return "GraphikApp-Light"
        case .regular: return "GraphikApp-Regular"
        case .regularItalic: return "GraphikApp-RegularItalic"
        case .mediumItalic: return "GraphikApp-MediumItalic"
        }
    }
    
    
    private var weight: UIFont.Weight {
        switch self {
        case .light:
            return .light
            
        case .semibold:
            return .semibold
            
        case .bold:
            return .bold
            
        case .medium:
            return .medium
            
        case .regular:
            return .regular
            
        case .regularItalic:
            return .regular
            
        case .mediumItalic:
            return .medium
            
        }
    }
    
    /// returns registered font of the variable size
    public func of(size: CGFloat) -> UIFont {
        
        if let font = UIFont(name: self.fontName, size: size) {
            return font
        }
        else {
            if #available(iOS 13, *) {
                if let roundedDescriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(.rounded) {
                    return  UIFont(descriptor: roundedDescriptor, size: size)
                }
                else {
                    return UIFont.systemFont(ofSize: size, weight: weight)
                }
            }
            else {
                return UIFont.systemFont(ofSize: size, weight: weight)
            }
        }
    }
}
