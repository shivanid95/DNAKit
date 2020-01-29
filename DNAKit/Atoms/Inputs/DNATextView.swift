//
//  DNATextView.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public class DNATextView: UITextView {
    
    
    private let LABEL_TAG = 100
    
    //MARK: - Text Validation
    
    public var validationRules: [TextValidationRuleType] = []
    
    public var validationDelegate: DNATextInputDelegate?
    
    public var error: ValidationError?
    
    public var typography: Typography? {
        didSet {
            guard let typography = typography else { return }
            placeholderLabel.type = typography
            self.typingAttributes = typography.stringAttributes
        }
    }
    
    //MARK: - Properties
    
    public var placeholderText: String? {
        get { return placeholderLabel.text }
        set { placeholderLabel.text = newValue }
    }

    lazy var placeholderLabel: DNALabel = {
        let label = DNALabel(withType: Typography.body(.small(.product)), text: "")
        label.font = self.font
        label.tag = LABEL_TAG
        label.textColor = Color.fontLight
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var inputState: DNATextInputState? {
        didSet {
            borderColor = inputState?.borderColor ?? .clear
            textColor = inputState?.textColor
            placeholderLabel.isHidden = (inputState == .focused || text.count > 0)
        }
    }
    
    public var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    

    //MARK:- Initialization
    
    public init(validationRules: [TextValidationRuleType]) {
        super.init(frame: .zero, textContainer: nil)
        self.validationRules = validationRules
        delegate = self
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setup() {
        backgroundColor = Color.appWhite
        borderColor = inputState?.borderColor
        textColor = inputState?.textColor
        
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.addSubview(placeholderLabel)
        placeholderLabel.fillSuperview(padding: .init(top: 12, left: 12, bottom: 8, right: 9))
  
    }
    
}


extension DNATextView: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = text.count > 0
        
        guard validationRules.count > 0 else {
            self.inputState = .focused
            validationDelegate?.didValidateInput(isValid: true, error: nil, input: self.text, inputFeild: textView)
            return
        }
        do {
            let isValid = try validate(validationRules)
            inputState = .focused
            validationDelegate?.didValidateInput(isValid: isValid, error: nil, input: self.text, inputFeild: textView)
            
        } catch let error {
            inputState = .error
            if let err = error as? ValidationError {
                self.error = err
                validationDelegate?.didValidateInput(isValid: false, error: err, input: self.text, inputFeild: textView)
            }
            
        }
        
    }
    
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        inputState = .normal
        resignFirstResponder()
        validationDelegate?.didEndEditing(inputFeild: textView)
    }
    
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        inputState = .focused
        validationDelegate?.didBeginEditing(inputFeild: textView)
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
