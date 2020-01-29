//
//  DNAInfoLabel.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit
/**
 Presents a tooltip with extra information on clicking the label
 */
public class DNAInfoLabel: DNALabel {
    
    /// Shows / Hides the tooltip on toggle
    public var isTooltipVisible = false {
        didSet {
            if toolTip.tapGestureRecogniser == nil {
                toolTip.show(forView: self)
            }
            else {
                toolTip.dismiss()
            }
        }
    }
    
    public override var text: String? {
        get { return self.attributedText?.string }
        set {
            
            let atrStr: DNAAttributedString = "\(newValue ?? "", .typography(self.type ?? .h3(.product)), .underline(Color.fontDark, .patternDot))"
            self.customAttributedText =  "\(wrap: atrStr, .underline(Color.fontDark, .patternDot))"
            
        }
    }
    
    lazy private var toolTip: DNATooltip = {
        let tip = DNATooltip(text: infoText ?? "" )
        return tip
    }()
    
    //MARK:- Initialize
    
    public override init(withType type: Typography, text: String?) {
        super.init(withType: type, text: text)
        self.text = text
        self.action { (label) in
            guard let label = label as? DNAInfoLabel  else {
                return
            }
            
            label.isTooltipVisible = !label.isTooltipVisible
        }
     
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var infoText: String? {
        didSet {
            toolTip = DNATooltip(text: infoText ?? "")
        }
    }
    
   
 
}

extension DNAInfoLabel {
    

    public func onTapHandler(_ sender: UIGestureRecognizer) {
        isTooltipVisible = !isTooltipVisible
    }
    
    
}
