//
//  DNATextButton.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit
/**
 Text Buttons (like link, underlined text etc.)
 */
public class TTTextButton: UIButton {
    
    public enum TextButtonType {
        case link
        case underlineText
        case dashedUnderline
        
        var tintColor: UIColor {
            switch self {
            case .link:
                return Color.link
            case .underlineText:
                return Color.fontNormal
            case .dashedUnderline:
                return Color.fontNormal
            }
        }
        
        var font: DNAFont {
            switch self {
            case .link:
                return DNAFont.medium
            default:
                return DNAFont.regular
            }
        }
        
    }
    
    //MARK: - Variables
    
    public var type: TextButtonType?
    
    public var delegate: DNAButtonDelegate?
    
    public var title: String? {
        get {
            switch type! {
            case .link: return self.titleLabel?.text
            default : return titleLabel?.attributedText?.string
            }
            
        }
        set {
            switch type! {
            case .link: setTitle(newValue, for: .normal)
            case .underlineText:
                let atrStr: DNAAttributedString = "\(newValue ?? "", .underline(color ?? type!.tintColor, .single), .color(color ?? type!.tintColor))"
                self.setAttributedTitle(atrStr.attributedString, for: .normal)
            case .dashedUnderline:
                let atrStr: DNAAttributedString = "\(newValue ?? "", .underline(color ?? type!.tintColor, .patternDot), .color(color ?? type!.tintColor))"
                self.setAttributedTitle(atrStr.attributedString, for: .normal)
            }
    }
    }
    
    public var color: UIColor? {
        didSet {
            self.textColor = color
        }
    }
        
    //MARK: - Initializers
    
    public init(withType type: TextButtonType, size: CGFloat) {
        super.init(frame: .zero)
        self.type = type
        self.titleLabel?.font = type.font.of(size: size)
        setupButton()
        addTarget(self, action: #selector(onClick(sender:)), for: .touchUpInside)
        
    }
    
     public init(withType type: TextButtonType, size: CGFloat, textColor: UIColor) {
        super.init(frame: .zero)
        self.type = type
        self.titleLabel?.font = type.font.of(size: size)
        self.color = textColor
        setupButton()
        addTarget(self, action: #selector(onClick(sender:)), for: .touchUpInside)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = color ?? type?.tintColor
        self.contentEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 4, right: 4)

    }
    
    //MARK: - Actions
    
    @objc func onClick(sender: UIButton) {
        delegate?.onClickHandler(sender)
    }
    
}
