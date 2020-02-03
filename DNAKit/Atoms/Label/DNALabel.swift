//
//  DNALabel.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

/**
 Custom label class which supports typography
 - Note: Donot use this class if the label containes multiple text formatting
 - Parameter type: Typography the label uses to create the text string
 */

public class DNALabel: UILabel, Tappable {
    
    
    public typealias TappableType = DNALabel
    
    fileprivate var actionOnTouch: Action?
    
    public override var textColor: UIColor! {
        didSet {
            if textColor == oldValue { return }
            else {
               setAttributedText(string: text, type: type)
            }
        }
    }
    
    
    //MARK: - Public Variables
    
    public var customAttributedText: DNAAttributedString? {
        didSet {
            self.attributedText = customAttributedText?.attributedString
        }
    }
    
    override public var text: String? {
        get { return self.attributedText?.string }
        set { setAttributedText(string: newValue, type: type) }
    }
    
    public var type: Typography? {
        didSet {
            setAttributedText(string: text, type: type)
        }
    }
    
    // MARK: - Utility
    /**
     sets label's attributed text whenever there is a change in text or typography
     */
    private func setAttributedText(string: String?, type: Typography?) {
        
        if let labeltype = type {
            customAttributedText = "\(string ?? "", .typography(labeltype), .color(self.textColor), .alignment(textAlignment))"
            return
        }
        self.attributedText = NSAttributedString(string: string ?? "")
    }
    
    public func setLineBreakMode(_ lineBreakMode: NSLineBreakMode) {
        self.lineBreakMode = lineBreakMode
        customAttributedText = "\(text ?? "", .lineBreakMode(lineBreakMode))"
    }
    
    //MARK: - Initialisers
    /**
     Initialize a DNALabel
     - parameter type: Typography of the text
     - parameter text: text string for the label
     */
    
    public init(withType type: Typography, text: String?) {
        
        super.init(frame: .zero)
        self.type = type
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    /**
     Initialize text without typography
     */
    public init() {
        
        super.init(frame: .zero)
        self.text = nil
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var a: String  = "A"
        var b: String! = "B"
        var c: String? = "C"
        b = nil
        a = b
        c = b
        b = a
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public func action(_ closure: @escaping Action) {
      
        if actionOnTouch == nil {
            let gesture = UITapGestureRecognizer(
                target: self,
                action: #selector(DNALabel.actionOnTouchUpInside))
            gesture.numberOfTapsRequired = 1
            gesture.numberOfTouchesRequired = 1
            self.addGestureRecognizer(gesture)
            self.isUserInteractionEnabled = true
        }
        self.actionOnTouch = closure
    }
    
    @objc internal func actionOnTouchUpInside() {
        actionOnTouch?(self)
    }
    
}
