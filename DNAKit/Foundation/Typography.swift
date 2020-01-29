//
//  Typography.swift
//  DNAKit
//
//  Created by Shivani on 16/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation
import UIKit

public enum ContentType {
    case blog
    case product
}

public enum BodyType {
    case small(ContentType)
    case regular(ContentType)
    case large(ContentType)
    case numHighlight(ContentType, CGFloat)
}

/**
 Typography defines the characteristics of font type, size, spacing color, and other attributes of different categories of text, which will be used in the scope of the application.
 
 */
public enum Typography {
    case h1(ContentType)
    case h2(ContentType)
    case h3(ContentType)
    case body(BodyType)
    case caption
    
    var fontSize: CGFloat {
        switch self {
        case .h1(.blog):
            return CGFloat(28)
        case .h2(.blog):
            return CGFloat(24)
        case .h3(.blog):
            return CGFloat(20)
        case .h1(.product):
            return CGFloat(21)
        case .h2(.product):
            return CGFloat(18)
        case .h3(.product):
            return CGFloat(16)
        case .body(.large):
            return CGFloat(16)
        case .body(.regular):
            return CGFloat(15)
        case .body(.small), .body(.numHighlight):
            return CGFloat(14)
        case .caption:
            return CGFloat(12)
            
        }
    }
    
    var fontType: DNAFont {
        switch self {
        case .h1(.blog), .h2(.blog), .h3(.blog):
            return .semibold
        case .h1(.product), .h2(.product), .h3(.product):
            return .medium
        default:
            return .regular
        }
    }
    
    var lineHeight: CGFloat{
        switch self {
        case .h1(.blog):
            return CGFloat(1)
        case .h2(.blog):
            return CGFloat(1.25)
        case .h3(.blog):
            return CGFloat(1)
        case .h1(.product):
            return CGFloat(1)
        case .h2(.product):
            return CGFloat(1.4)
        case .h3(.product):
            return CGFloat(1.5)
        case .body(.large):
            return CGFloat(1.5)
        case .body(.regular):
            return CGFloat(1.5)
        case .body(.small):
            return CGFloat(1.5)
        case .body(.numHighlight):
            return CGFloat(1.2)
        case .caption:
            return 1.3
            
        }
    }
    
    var letterSpacing: CGFloat {
        switch self {
        case .h1(.blog):
            return CGFloat(-0.6)
        case .h2(.blog):
            return CGFloat(-0.51)
        case .h3(.blog):
            return CGFloat(-0.22)
        case .h1(.product):
            return CGFloat(-0.12)
        case .h2(.product):
            return CGFloat(-0.24)
        case .h3(.product):
            return CGFloat(0)
        case .body(.large):
            return CGFloat(0)
        case .body(.regular):
            return CGFloat(0)
        case .body(.small), .body(.numHighlight):
            return CGFloat(0)
        case .caption:
            return CGFloat(0)
            
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .body(_), .caption:
            return Color.fontNormal
        default:
            return Color.fontDark
        }
    }
    
    var stringAttributes: [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = fontSize * lineHeight - fontSize
        return [
            NSAttributedString.Key.font: UIFont.customAppFont(withTypography: self),
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.kern: letterSpacing
            
        ]
    }
    
}
