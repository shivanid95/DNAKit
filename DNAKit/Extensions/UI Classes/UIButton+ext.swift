//
//  UIButton+ext.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.

import UIKit

//MARK: setting background color
extension UIButton {
    
    func imageFromColor(colour: UIColor) -> UIImage?
    {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(colour.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

//Background color
extension UIButton {
    
//MARK: Background Color
    
    @objc open func backgroundColor(for state: UIControl.State) -> UIColor? {
        guard let color = backgroundColors[state.rawValue] else {
            return nil
        }
        return color
    }
    
    @objc open func setBackgroundColor(_ backgroundColor: UIColor?, for state: UIControl.State) {
        guard let backgroundColor = backgroundColor else { return}
        
        backgroundColors[state.rawValue] = backgroundColor
        setBackgroundImage(imageFromColor(colour: backgroundColor), for: state)
        
        if state == .normal {
            super.backgroundColor = backgroundColor
            highlightedBackgroundColor = backgroundColor.darker(0.1)
            
        }
    }
    
    //MARK:- Border Color
    
    @objc open func borderColor(for state: UIControl.State) -> UIColor? {
        guard let color = borderColors[state.rawValue] else {
            return nil
        }
        
        return color
    }
    
    @objc open func setBorderColor(_ borderColor: UIColor?, for state: UIControl.State) {
        borderColors[state.rawValue] = borderColor
   super.layer.borderColor = borderColor?.cgColor
        if state == .normal {
            super.layer.borderColor = borderColor?.cgColor
        }
    }
    
}

//MARK:- Convenience Analysers
extension UIButton {
    /// The image used for the normal state.
    open var image: UIImage? {
        get { return image(for: .normal) }
        set { setImage(newValue, for: .normal) }
    }
    
    /// The image used for the highlighted state.
    open var highlightedImage: UIImage? {
        get { return image(for: .highlighted) }
        set { setImage(newValue, for: .highlighted) }
    }
    
    open var disabledImage: UIImage? {
        get { return image(for: .disabled) }
        set {setImage(newValue, for: .disabled)}
    }
    
    /// The color of the title used for the normal state.
    open var textColor: UIColor? {
        get { return titleColor(for: .normal) }
        set { setTitleColor(newValue, for: .normal) }
    }
    
    /// The color of the title used for the highlighted state.
    open var highlightedTextColor: UIColor? {
        get { return titleColor(for: .highlighted) }
        set { setTitleColor(newValue, for: .highlighted) }
    }
    
    /// The color of the title used for the highlighted state.
    open var disabledTextColor: UIColor? {
        get { return titleColor(for: .disabled) }
        set { setTitleColor(newValue, for: .disabled) }
    }
    
    /// The background color for the normal state.
    @objc open override var backgroundColor: UIColor? {
        get { return backgroundColor(for: .normal) }
        set { setBackgroundColor(newValue, for: .normal) }
    }
    
    /// The background color for the highlighted state.
    @nonobjc open var highlightedBackgroundColor: UIColor? {
        get { return backgroundColor(for: .highlighted) }
        set { setBackgroundColor(newValue, for: .highlighted) }
    }
    
    /// The background color for the disabled state.
    @nonobjc open var disabledBackgroundColor: UIColor? {
        get { return backgroundColor(for: .disabled) }
        set { setBackgroundColor(newValue, for: .disabled) }
    }
    
    /// The border color for the disabled state.
    @nonobjc open var disabledBorderColor: UIColor? {
        get { return borderColor(for: .disabled) }
        set { setBorderColor(newValue, for: .disabled) }
    }
    
    /// The background color for the normal state.
    @nonobjc open var borderColor: UIColor? {
        get { return borderColor(for: .normal) }
        set { setBorderColor(newValue, for: .normal) }
    }
    
}


extension UIButton {
    fileprivate struct AssociatedKey {
        static var backgroundColors = "backgroundColors"
        static var borderColors = "borderColors"
        static var highlightedAnimation = "highlightedAnimation"
        static var adjustsBackgroundColorWhenHighlighted = "adjustsBackgroundColorWhenHighlighted"
        static var heightConstraint = "heightConstraint"
        static var isHeightSetAutomatically = "isHeightSetAutomatically"
        static var observeHeightSetAutomaticallySetter = "observeHeightSetAutomaticallySetter"
    }
    
    private typealias StateType = UInt
    
    private var backgroundColors: [StateType: UIColor] {
        get { return associatedObject(&AssociatedKey.backgroundColors, default: [:]) }
        set { setAssociatedObject(&AssociatedKey.backgroundColors, value: newValue) }
    }
    
    private var borderColors: [StateType: UIColor] {
        get { return associatedObject(&AssociatedKey.borderColors, default: [:]) }
        set { setAssociatedObject(&AssociatedKey.borderColors, value: newValue) }
        
        
    }
}




