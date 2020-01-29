//
//  DNATextField.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
// Reference: - https://oleb.net/2018/uialertcontroller-textfield/

import UIKit


public protocol DNATextInputDelegate {
    
    func didValidateInput<T>(isValid: Bool, error: ValidationError?, input: String?, inputFeild: T)
}

public extension DNATextInputDelegate {
    
    func didEndEditing<T>(inputFeild: T) { }
    func didBeginEditing<T>(inputFeild: T) {}
}

public class DNATextField: UITextField {
    
    
    //Text validation
    public var validationRules: [TextValidationRuleType] = []
    
    public var validationDelegate: DNATextInputDelegate?
    
    public var error: ValidationError?
    
    /// set typography for text
    public var typography: Typography? {
        didSet {
            guard let typography = typography else {
                return
            }
            defaultTextAttributes = typography.stringAttributes
        }
    }
    
    //Text field properties

    public var borderColor: UIColor? {
        get { return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor) }
        set { self.layer.borderColor = newValue?.cgColor }
    }
    
    public var inputState: DNATextInputState? {
        didSet {
            borderColor = inputState?.borderColor ?? .clear
            textColor = inputState?.textColor
        }
    }
    
    public var padding: UIEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)

    
    //MARK:- Initialization
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(withState inputState: DNATextInputState) {
        super.init(frame: .zero)
        self.inputState = inputState
        delegate = self
        self.addTarget(self, action: #selector(textFieldValueDidChange(_:)), for: .editingChanged)
        setupView()
    }
    
    func setupView() {
        
        backgroundColor = Color.appWhite
        borderColor = inputState?.borderColor ?? .clear
        textColor = inputState?.textColor
        defaultTextAttributes = Typography.body(.small(.product)).stringAttributes
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
    }
    
}
//MARK: - Text Padding
extension DNATextField {
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

//MARK: - TextField Delegate
extension DNATextField: UITextFieldDelegate {

    
    @objc func textFieldValueDidChange(_ textfield: UITextField) {
        
        guard validationRules.count > 0 else {
            self.inputState = .focused
            validationDelegate?.didValidateInput(isValid: true, error: nil, input: self.text, inputFeild: textfield)
            return
        }
        do {
            let isValid = try validate(validationRules)
            self.inputState = .focused
            validationDelegate?.didValidateInput(isValid: isValid, error: nil, input: self.text, inputFeild: textfield)
            
        } catch let error {
            self.inputState = .error
            if let err = error as? ValidationError {
                self.error = err
                validationDelegate?.didValidateInput(isValid: false, error: err, input: self.text, inputFeild: textfield)
            }
            
        }
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
     self.inputState = .focused
    }
    
    

    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        self.inputState = .normal
        validationDelegate?.didEndEditing(inputFeild: textField)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.inputState = .normal
        textField.resignFirstResponder()
        validationDelegate?.didEndEditing( inputFeild: textField)
        return true
    }
}
