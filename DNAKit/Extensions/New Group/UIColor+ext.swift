//
//  UIColoe+ext.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation

import UIKit
// MARK: Hex Support

extension UIColor {

    public convenience init(hex: Int64) {
        let (r, g, b, a) = UIColor.components(hex: hex)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    public convenience init(hex: Int64, alpha: CGFloat) {
        let (r, g, b, a) = UIColor.components(hex: hex, alpha: alpha)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    @nonobjc
    public convenience init(hex: String) {
        self.init(hex: UIColor.components(hex: hex))
    }
    
    @nonobjc
    public convenience init(hex: String, alpha: CGFloat) {
        self.init(hex: UIColor.components(hex: hex), alpha: alpha)
    }
    
    public var hex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return "#000000"
        }
        
        func round(_ value: CGFloat) -> Int {
            return lround(Double(value) * 255)
        }
        
        if alpha == 1 {
            return String(format: "#%02lX%02lX%02lX", round(red), round(green), round(blue))
        } else {
            return String(format: "#%02lX%02lX%02lX%02lX", round(red), round(green), round(blue), round(alpha))
        }
    }
    
    private static func components(hex: Int64, alpha: CGFloat? = nil) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let preferredAlpha = alpha
        
        let r: CGFloat
        let g: CGFloat
        let b: CGFloat
        let a: CGFloat
        
        let isRGBA = CGFloat(hex & 0xFF000000) != 0
        
        if isRGBA {
            r = CGFloat((hex & 0xFF000000) >> 24) / 255
            g = CGFloat((hex & 0xFF0000)   >> 16) / 255
            b = CGFloat((hex & 0xFF00)     >>  8) / 255
            a = preferredAlpha ?? CGFloat((hex & 0xFF)) / 255
        } else {
            r = CGFloat((hex & 0xFF0000)   >> 16) / 255
            g = CGFloat((hex & 0xFF00)     >>  8) / 255
            b = CGFloat((hex & 0xFF)            ) / 255
            a = preferredAlpha ?? 1
        }
        
        return (r, g, b, a)
    }
    
    private static func components(hex: String) -> Int64 {
        var hexString = hex
        
        if hexString.hasPrefix("#"), let cleanString = hexString.stripPrefix("#") {
            hexString = cleanString
        }
        
        return Int64(hexString, radix: 16) ?? 0x000000
    }
}


extension UIColor {
    public var alpha: CGFloat {
        get { return cgColor.alpha }
        set { withAlphaComponent(newValue) }
    }
    
    public func alpha(_ value: CGFloat) -> UIColor {
        return withAlphaComponent(value)
    }
    
    // Credit: http://stackoverflow.com/a/31466450
    
    public func lighter(_ amount: CGFloat = 0.25) -> UIColor {
        return hueColorWithBrightness(1 + amount)
    }
    
    public func darker(_ amount: CGFloat = 0.25) -> UIColor {
        return hueColorWithBrightness(1 - amount)
    }
    
    private func hueColorWithBrightness(_ amount: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * amount, alpha: alpha)
        } else {
            return self
        }
    }
    
    /// A convenience method to return default system tint color.
    ///
    /// - Returns: The default tint color.
    public static var systemTint: UIColor {
        struct Static {
            static let tintColor = UIView().tintColor ?? .blue
        }
        
        return Static.tintColor
    }
    
    public static func randomColor() -> UIColor {
        let hue = CGFloat(arc4random() % 256) / 256
        let saturation = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness = CGFloat(arc4random() % 128) / 256 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
