//
//  DNAButtonType.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

/**
 Types supported by DNABaseButton, along with visual design properties for each type
 */

public enum DNAButtonType: String, CaseIterable {

    case primaryRegular
    case primaryAccent
    case secondaryRegular
    case secondaryAccent
    case link
    case disable
    case primaryDanger
    case secondaryDanger
    case info
    
    public var tintColor: UIColor {
        switch self {
            
        case .primaryRegular:
            return Color.appWhite
        case .primaryAccent:
            return Color.appPrimary
        case .secondaryRegular:
            return Color.appPrimary
        case .secondaryAccent:
            return Color.accentDark
        case .link:
            return Color.link
        case .secondaryDanger:
            return Color.dangerRed
        case .primaryDanger:
            return Color.appWhite
        case .disable:
            return Color.appPrimary
        case .info:
            return Color.appPrimary
        }
    }
    
    public var backgroundColor: UIColor {
        switch self {
        case .primaryRegular:
            return Color.appPrimary
        case .primaryAccent:
            return Color.accentDark
        case .primaryDanger:
            return Color.dangerRed

        
        case .secondaryRegular:
            return Color.appWhite
            
        case .secondaryAccent:
            return Color.appWhite
        case .link:
            return Color.appWhite
        case .secondaryDanger:
               return Color.appWhite
        case .disable:
            return Color.borderLight
        case .info:
            return Color.info
        }
        
    }
    
    var borderColor: UIColor {
        switch self {
        case .primaryRegular:
            return Color.appPrimary
        case .primaryAccent:
            return Color.accentDark
        case .secondaryRegular:
            return Color.appPrimary
        case .secondaryAccent:
            return Color.accentDark
        case .link:
            return Color.link
        case .secondaryDanger:
            return Color.dangerRed
        case .primaryDanger:
            return Color.dangerRed
        case .disable:
            return Color.borderLight
        case .info:
            return Color.info
        }
    }
    
    var disableBorderColor: UIColor {
        switch self {
            
        case .primaryRegular:
            return UIColor(hex: "886D7C")
            
        case .primaryAccent:
             return UIColor(hex: "FFB59A")
            
        case .primaryDanger:
             return UIColor(hex: "F4C1C7")
            
        case .secondaryRegular:
            return UIColor(hex: "886D7C")
            
        case .secondaryAccent:
           return UIColor(hex: "E9E6FF")
            
        case .link:
           return UIColor(hex: "F2F3F4")
            
        case .secondaryDanger:
            return UIColor(hex: "F5CBD0")
            
        case .disable:
            return Color.borderLight
            
        case .info:
            return UIColor(hex: "FBFCFC")
        }
    }
    
    var disableTintColor: UIColor {
        switch self {
        case .primaryRegular:
            return Color.appWhite
            
        case .primaryAccent:
            return Color.appWhite
            
        case .primaryDanger:
            return Color.appWhite
            
        case .secondaryRegular:
            return UIColor(hex: "B9BCBE")
            
        case .secondaryAccent:
              return UIColor(hex: "FFB59A")
            
        case .link:
            return UIColor(hex: "BCD7F6")
            
        case .secondaryDanger:
            return UIColor(hex: "F4C1C7")
            
        case .disable:
            return Color.borderLight
            
        case .info:
            return UIColor(hex: "B9BCBE")        }
    }
    
    var disableBackgroundColor: UIColor {
        switch self {
        case .primaryRegular:
            return UIColor(hex: "886D7C")

          //  return UIColor(hex: "B9BCBE")
            
        case .primaryAccent:
           // return UIColor(hex: "D0C9FF")
             return UIColor(hex: "FFB59A")
            
        case .primaryDanger:
            return UIColor(hex: "F4C1C7")
            
        case .info:
            return UIColor(hex: "FBFCFC")
            
        case .secondaryRegular, .secondaryAccent, .secondaryDanger, .link:
            return Color.appWhite
            
        case .disable:
            return Color.borderLight
        
        }
        
    }
    
    var highlightedBackgroundColor: UIColor {
        switch self {
        case .primaryRegular:
            return Color.backgroundDark
            
        case .primaryAccent:
            return Color.accentDark.darker(0.09)
            
        case .secondaryRegular:
            return UIColor(hex: "F0ECEE")
            
        case .secondaryAccent:
            return UIColor(hex: "FFEAE2")
            
        case .link:
            return UIColor(hex: "ECF3FC")
            
        case .secondaryDanger:
            return UIColor(hex: "FCF0F2")
            
        case .primaryDanger:
            return Color.dangerRed.darker(0.09)
        case .disable:
            return Color.link
        case .info:
            return Color.info.darker(0.09)
        }
    }
    
}


