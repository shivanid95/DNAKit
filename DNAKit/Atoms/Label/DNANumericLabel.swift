//
//  DNANumericLabel.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public class DNANumericLabel: DNALabel {
    
    //MARK: - Variables
    
    public var value: Double? {
        didSet {
            setupText()
        }
    }
    
    public var numberType: DNANumberType! {
        didSet {
            setupText()
        }
    }
    
    //MARK: - Initialize
    
    public init(withNumberType numType: DNANumberType) {
        self.numberType = numType
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Setup
    
    func setupText() {
        
        guard let value = value else { return }
        
        switch numberType {
            
        case let .amount(color, font, unit):
            var val = "\u{20B9}" + String(format: "%.2f", abs(value))
            if value == .nan {
                val = "-"
            }
            
            if let unit = unit {
               val += " \(unit)"
            }
            customAttributedText = "\(val, .font(font.weight, size: font.size), .color(getColor(ofType: color)))"
            
        case let .percentage(color, font, signed):
           
            var val = getSign(isSigned: signed) + String(format: "%.2g", value)
            if value == .nan {
                      val = "-"
            }
            customAttributedText = "\(val + "%", .font(font.weight, size: font.size), .color(getColor(ofType: color)))"
            
        case let .number(color, font, signed):
            
             let val = getSign(isSigned: signed) + String(format: "%.2f", value)
            customAttributedText = "\(val, .font(font.weight, size: font.size), .color(getColor(ofType: color)))"
            
        case let .change(color, font, signed):
            
             let val = getSign(isSigned: signed) + String(format: "%.2f", value)
            var str: DNAAttributedString = "\(image: getImage()!, size: .init(width: 12, height: 8))"
            str.append("\(val, .font(font.weight, size: font.size), .color(getColor(ofType: color)))")
            customAttributedText = str
   
        case .none:
            return
        }
    }
    
    //MARK: - Utility
    
    private func getColor(ofType type: DNANumberType.Color) -> UIColor{
        guard let value = value else { return Color.fontNormal }
        switch type {
            
        case .colored:
            
            if value == 0 {
                return Color.fontNormal
            }
            else if value > 0 {
                return Color.successGreen
            }
            else {
                return Color.dangerRed
            }
            
        case .uncolored:
            return Color.fontNormal
        }
    }
    
    private func getImage() -> UIImage? {
        guard let value = value else {
            return nil
        }
        return value > 0.0 ? DNAImage.priceUp : DNAImage.priceDown
    }
    
    func getSign(isSigned: Bool) -> String {
        
        guard isSigned, let value = value else { return "" }
        if value > 0.0 {
            return "+"
        }
        else if value < 0.0 {
            return ""
        }
        else {
            return ""
        }
    }
}
