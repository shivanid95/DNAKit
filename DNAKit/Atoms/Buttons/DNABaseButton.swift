//
//  DNABaseButton.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

/**
 DNABaseButton is a custom UIButton, which de
 */
public class DNABaseButton: UIButton, Loadable, Tappable {
  
    
    public typealias TappableType = DNABaseButton
    
    
    public typealias Action = (DNABaseButton) -> Void
    
    
    //MARK: - Properties
    
    /// sets The height of the button
    open var buttonHeight: DNAButtonHeight? {
        didSet {
            if  buttonHeight == nil || buttonHeight?.value == oldValue?.value { return }
            setupButton()
        }
    }
    
    open var type: DNAButtonType? {
        didSet {
            setupButton()
            setNeedsDisplay()
        }
    }
    
    open var buttonState: DNAButtonState? {
        didSet {
            guard let bstate = buttonState else { return }
            if !isLoading && oldValue == .loading {
                isLoading = false
            }
            setButtonState(bstate)
            setNeedsDisplay()
            
        }
    }
    
    open var title : String? {
        
        get { return title(for: .normal) }
        
        set { self.setTitle(newValue, for: .normal) }
    }
    
    fileprivate var actionOnTouch: Action?
    
    
    fileprivate var loadingIndicatorView: UIActivityIndicatorView?
    
    
    //MARK:- Initializers
    /**
     initialize button with image icon
     - parameter title: title of the button
     - parameter image: image icon for button
     - parameter type: DNAButtonType type of the custom button
     - parameter height: height of the button
     */
    public init(title: String?, image: UIImage, type: DNAButtonType, height: DNAButtonHeight) {
        super.init(frame: .zero)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .normal)
        
        self.buttonHeight = height
        self.type = type
        
       
        
        let enabledColor = type.tintColor
        
        self.setImage(image.maskWithColor(color: enabledColor), for: .normal)
        self.setImage(image.maskWithColor(color: type.disableTintColor ), for: .disabled)
        
        setupButton()
        
        
    }
    
    /**
     initialize button (without image icon)
     - parameter title: title of the button
     - parameter type: DNAButtonType type of the custom button
     - parameter height: height of the button
     */
    
    public init(title: String, type: DNAButtonType, height: DNAButtonHeight) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        
        self.buttonHeight = height
        self.type = type
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Utility
    
    private(set) var isLoading: Bool {
        get { return buttonState == .loading }
        set { newValue ? showLoader() : hideLoader() }
    }
    
    private func setupButton() {
        // Font
        titleLabel?.font = DNAFont.medium.of(size: buttonHeight?.fontSize ?? 16)
        
        // Color
        backgroundColor = type?.backgroundColor
        textColor = type?.tintColor
        
        disabledTextColor = Color.appPrimary
        
        self.setBorderColor(type?.borderColor, for: .normal)
        
        // Border
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = buttonHeight?.cornerRadius ?? 4
        self.clipsToBounds = true
        if let insets = buttonHeight?.buttonInsets {
            self.contentEdgeInsets = insets
        }
        
        //Image
        self.imageView?.contentMode = .scaleAspectFit
        self.imageView?.clipsToBounds = true
        self.setBackgroundColor(type?.highlightedBackgroundColor, for: .highlighted)
        self.setBackgroundColor(type?.disableBackgroundColor, for: .disabled)
        self.disabledTextColor = type?.disableTintColor
        
        self.disabledBorderColor = type?.disableBorderColor
       // self.setBorderColor(type?.disableBorderColor, for: .disabled)
        borderColor = type?.borderColor
        
      
    }
    
    func setButtonState(_ buttonState: DNAButtonState) {
        
        switch buttonState {
        case .disabled:
            self.isEnabled = false
            self.borderColor = type?.disableBorderColor
            
        case .highlighted:
            self.isHighlighted = true
            self.borderColor = type?.borderColor
        case .loading:
            self.isLoading = true
            self.isEnabled = true
            self.borderColor = type?.borderColor
        case .normal:
            self.isEnabled = true
            self.borderColor = type?.borderColor
        default:
            return
        }
    }
    
    //MARK: - Action
    
    public func action(_ closure: @escaping Action) {
        if actionOnTouch == nil {
            addTarget(self, action: #selector(DNABaseButton.actionOnTouchUpInside), for: .touchUpInside)
        }
        self.actionOnTouch = closure
    }
    
    @objc internal func actionOnTouchUpInside() {
        actionOnTouch?(self)
    }
    
}


extension DNABaseButton {
     open func showLoader() {
        
        loadingIndicatorView = UIActivityIndicatorView()
        addSubview(loadingIndicatorView!)
        loadingIndicatorView?.anchor(top: titleLabel?.topAnchor, leading: titleLabel?.leadingAnchor, bottom: titleLabel?.bottomAnchor, trailing: nil, padding: .init(top: 0, left: -30, bottom: 0, right: 0))
       
        loadingIndicatorView?.startAnimating()
        loadingIndicatorView?.color = type?.tintColor
    }
    
    func hideLoader() {
        loadingIndicatorView?.removeFromSuperview()
    }

}

