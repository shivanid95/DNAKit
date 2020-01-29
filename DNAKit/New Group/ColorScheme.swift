//
//  ColorScheme.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

// https://nshipster.com/dark-mode/

import UIKit
/**
 Defines the color scheme of the application
 - Note: Contains support for dark mode (iOS 13+)

 */
public struct Color {
    
    public static var appPrimary: UIColor {
        //"#151E28"
         return get(regularColor: UIColor(hex: "#5C374C" ), darkColor: UIColor(hex: "#151E28") )
        
    }
    
    public static var backgroundDark : UIColor {
       return get(regularColor: UIColor(hex: "#232d38"), darkColor: UIColor(hex: "#232d38"))
    }
    
    public static var backgroundLight: UIColor {
         return get(regularColor: UIColor(hex: "#F9FAFC"), darkColor: UIColor(hex: "#F9FAFC"))
    }
    
    public static var appWhite: UIColor {
        return get(regularColor: UIColor(hex: "#FFFFFF"), darkColor: UIColor(hex: "#FFFFFF"))
        
    }
    
    public static var borderRegular: UIColor {
        return get(regularColor: UIColor(hex: "#BDC3CB"), darkColor: UIColor(hex: "#BDC3CB"))
        
    }
    
    public static var borderLight: UIColor {
        return get(regularColor: UIColor(hex: "#EEEFF1"), darkColor: UIColor(hex: "#EEEFF1"))
        
    }

    public static var accentDark: UIColor {
         //"#624BFF" //F19A3E
        return get(regularColor: UIColor(hex: "#FF8C61" ), darkColor: UIColor(hex: "#624BFF"))
        
    }

    public static var accentLight: UIColor {
        return get(regularColor: UIColor(hex: "#FAA275"), darkColor: UIColor(hex: "#f0efff"))
        
    }

    public static var link: UIColor {
        return get(regularColor: UIColor(hex: "#1f7ae0"), darkColor: UIColor(hex: "#1f7ae0"))
        
    }

    public static var successGreen: UIColor {
        return get(regularColor: UIColor(hex: "#27BC94"), darkColor: UIColor(hex: "#27BC94"))
        
    }

    public static var dangerRed: UIColor {
        return get(regularColor: UIColor(hex: "#ff5050"), darkColor: UIColor(hex: "#ff5050"))
        
    }

    public static var brandWarning: UIColor {
        return get(regularColor: UIColor(hex: "#FBE283"), darkColor: UIColor(hex: "#FBE283"))
        
    }

    public static var fontDark: UIColor {
        return get(regularColor: UIColor(hex: "#2F363F"), darkColor: UIColor(hex: "#2F363F"))
        
    }

    public static var fontNormal: UIColor {
        return get(regularColor: UIColor(hex: "#525B62"), darkColor: UIColor(hex: "#525B62"))
        
    }

    public static var fontLight: UIColor {
        return get(regularColor: UIColor(hex: "#81878C"), darkColor: UIColor(hex: "#81878C"))
        
    }

    public static var info: UIColor {
        return get(regularColor: UIColor(hex: "F1F2F4"), darkColor: UIColor(hex: "F1F2F4"))
        
    }

    /**
     function to check if the dark mode is supported and return the corressponding color for current UIStyle
     - parameter regularColor: the color to be used for lightMode, or if dark mode is not supported
     - parameter darkColor: the color to be used if dark mode is active
     */
    private static func get(regularColor: UIColor, darkColor: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return darkColor
                }
                else {
                    return regularColor
                }
            }
        }
        else {
            return regularColor
        }
        
    }
    
}
