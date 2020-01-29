//
//  DNACapsuleCVCell.swift
//  DNAKit
//
//  Created by Shivani on 22/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit


public class DNACapsuleCVCell: UICollectionViewCell {
    
   public var title: String? {
        get { return titleLabel.text }
        set {
            titleLabel.text = newValue
         }
    }
    
    override public var isSelected: Bool {
        didSet {
            containerView.backgroundColor = isSelected ? .systemBlue : .systemTeal
          //  setNeedsDisplay()
        }
    }
    
    fileprivate let containerView: UIView = {
      let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 5.0
        return view
    }()
    
    fileprivate let titleLabel: DNALabel = {
        let label = DNALabel(withType: Typography.h3(.product), text: "")
        label.textColor = Color.appWhite
        return label
    }()
    
    //MARK: - Initialize
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setup() {
        addSubview(containerView)
        containerView.fillSuperview()
        containerView.addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
    
    
}
