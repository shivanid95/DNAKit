//
//  UIFont+Ext.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

extension UIFont {
    
    
    /// Returns UIfont type from the app Typography (eg. header, body)
    open class func customAppFont(withTypography fontClass: Typography) -> UIFont {
        return fontClass.fontType.of(size: fontClass.fontSize)
    }
    
    /// Returns UIfont for a font type
    open class func customAppFont(ofType font:  DNAFont, size: CGFloat ) -> UIFont  {
        return font.of(size: size)
    }
    
    /**
     Utility method to register custom fonts (not provided by iOS)
     - parameter filenameString: the name of the font file to be registered
     - parameter fontName: Name of the font to be registered (as mentioned in the .tff metadata)
     - parameter familyName: Font family name of which the font is a part of
     - parameter bundle: Bundle of the library/ application in which the font file is present
     */
    public static func registerFont(withFilenameString filenameString: String, fontName: String, familyName: String = "Graphik App", bundle: Bundle) {
        
        let fontFamilyNames = UIFont.fontNames(forFamilyName: familyName )
        if fontFamilyNames.contains(fontName) {
            print("Font already registered")
            return
        }
        
        guard let fontURL = bundle.url(forResource: filenameString, withExtension: "ttf")  else {
            print("UIFont+:  Failed to register font - path for resource not found.")
            return
        }
        
        let didRegister = CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
        print(didRegister)
        
    }
}
