//
//  DNAAttributedString.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

/**
 - References for string Inerpolation
    - https://ilya.puchka.me/swift5-string-interpolation/
    - https://www.hackingwithswift.com/articles/178/super-powered-string-interpolation-in-swift-5-0
    - https://alisoftware.github.io/swift/2018/12/15/swift5-stringinterpolation-part1/
    - https://nshipster.com/expressiblebystringinterpolation/
 
 */

import UIKit

/**
 Custom Attributed string supporting utility based functionalities for reducing redundancy and easing development process.
 - Note: - Supports String interpolation
 
*/
public struct DNAAttributedString {
    public var attributedString: NSAttributedString
}

//MARK: - Initialization

extension DNAAttributedString: ExpressibleByStringLiteral {
    
    public init(stringLiteral: String) {
        self.attributedString = NSAttributedString(string: stringLiteral)
    }
}

extension DNAAttributedString: CustomStringConvertible {
    public var description: String {
        return String(describing: self.attributedString)
    }
}

//MARK: - String Interpolation

extension DNAAttributedString: ExpressibleByStringInterpolation {
    public init(stringInterpolation: StringInterpolation) {
        self.attributedString = NSAttributedString(attributedString: stringInterpolation.attributedString)
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        var attributedString: NSMutableAttributedString
        
        public init(literalCapacity: Int, interpolationCount: Int) {
            self.attributedString = NSMutableAttributedString()
        }
        
        public func appendLiteral(_ literal: String) {
            let astr = NSAttributedString(string: literal)
            self.attributedString.append(astr)
        }
        
        public func appendInterpolation(_ string: String, attributes: [NSAttributedString.Key: Any]) {
            let astr = NSAttributedString(string: string, attributes: attributes)
            self.attributedString.append(astr)
        }
    }
    
}

//MARK:- Style convenience methods

public extension DNAAttributedString {
    
    struct Style {
        let attributes: [NSAttributedString.Key: Any]
       /// returns attributes coreesponding to the typography
        public static func typography(_ typography: Typography) -> Style {
            return Style(attributes: typography.stringAttributes)
        }
        /// returns attributes dictionary for a  custom font
        public static func font(_ font: DNAFont, size: CGFloat) -> Style {
            return Style(attributes: [.font: font.of(size: size)])
        }
        
        /// returns attribute dictionary with text color
        public static func color(_ color: UIColor) -> Style {
            return Style(attributes: [.foregroundColor: color])
        }
        
        /// returns attribute dictionary with background color
        public static func bgColor(_ color: UIColor) -> Style {
            return Style(attributes: [.backgroundColor: color])
        }
         /// returns attribute dictionary for a url string
        public static func link(_ link: String) -> Style {
            return .link(URL(string: link)!)
        }
        
        /// returns attribute dictionary for a url link
        public static func link(_ link: URL) -> Style {
            return Style(attributes: [.link: link])
        }
        /// Adds strikethrough attributes to the text (line crossing through center of the text)
        public static func strikethrough(color: UIColor) -> Style {
            return Style(attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                      .strikethroughColor: color]
            )
        }
        
        public static let oblique = Style(attributes: [.obliqueness: 0.1])
        
        public static func underline(_ color: UIColor, _ style: NSUnderlineStyle) -> Style {
    
            return Style(attributes: [
                .underlineColor: color,
                .underlineStyle: style.union(.single).rawValue
                ])
        }
        public static func lineSpacing(_ lineSpacing: CGFloat) -> Style {
            let ps = NSMutableParagraphStyle()
            ps.lineSpacing = lineSpacing
            return Style(attributes: [.paragraphStyle: ps])
        }
        
        public static func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Style {
            let ps = NSMutableParagraphStyle()
            ps.lineBreakMode = lineBreakMode
            return Style(attributes: [.paragraphStyle: ps])
        }
        
        public static func characterSpacing(_ charSpacing: CGFloat) -> Style {
            return Style(attributes: [NSAttributedString.Key.kern: charSpacing])
        }
        
        public static func alignment(_ alignment: NSTextAlignment) -> Style {
            let ps = NSMutableParagraphStyle()
            ps.alignment = alignment
            return Style(attributes: [.paragraphStyle: ps])
        }
        
        public static func paraStyles(alignment: NSTextAlignment, lineSpacing: CGFloat) -> Style {
            let ps = NSMutableParagraphStyle()
            ps.alignment = alignment
            ps.lineSpacing = lineSpacing
            return Style(attributes: [.paragraphStyle: ps])
        }
    }
    
    mutating func append(_ atrString: DNAAttributedString) {
        let newAttributedString = NSMutableAttributedString(attributedString: self.attributedString)
        newAttributedString.append(atrString.attributedString)
        self.attributedString = newAttributedString

    }
    
}


public extension DNAAttributedString.StringInterpolation {
    
    func appendInterpolation(_ string: String, _ style: DNAAttributedString.Style...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach { attrs.merge($0.attributes, uniquingKeysWith: {$1}) }
        let astr = NSAttributedString(string: string, attributes: attrs)
        self.attributedString.append(astr)
    }
    
    /**
     - description: Applies styles to the attributed string
     - NOTE: Uses variadic params as input (style variable)
     */
    func appendInterpolation(wrap string: DNAAttributedString, _ style: DNAAttributedString.Style...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach { attrs.merge($0.attributes, uniquingKeysWith: {$1}) }
        let mas = NSMutableAttributedString(attributedString: string.attributedString)
        let fullRange = NSRange(mas.string.startIndex..<mas.string.endIndex, in: mas.string)
        mas.addAttributes(attrs, range: fullRange)
        self.attributedString.append(mas)
    }
    
    /**
      For wrapping images in text string
     - parameter image: UIImage to be wrapped in the text
     - parameter scaleFactor: the variable by which the image should be scaled.
     */
    
    func appendInterpolation(image: UIImage, scaleFactor: CGFloat = 1.0) {
        let attachment = NSTextAttachment()
    
        attachment.image = UIImage(cgImage: image.cgImage!, scale: scaleFactor, orientation: .up)
        self.attributedString.append(NSAttributedString(attachment: attachment))

    }
    
    /**
     For wrapping images in text string
    - parameter image: UIImage to be wrapped in the text
    - parameter scaleFactor: the variable by which the image should be scaled.
    - parameter size: the size of the image 
    */
    func appendInterpolation(image: UIImage, size: CGSize, scaleFactor: CGFloat = 1.0) {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(cgImage: image.cgImage!, scale: scaleFactor, orientation: .up)
        attachment.bounds = CGRect(origin: .zero, size: size)
        self.attributedString.append(NSAttributedString(attachment: attachment))
    }
    
    
}

extension NSAttributedString.Key {
    static let imagePath = NSAttributedString.Key(rawValue: "imagePath")
    
    
}
