//
//  AlertPresentable.swift
//  DNAKit
//
//  Created by Shivani on 21/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit


public protocol AlertPresentable {
    
    var alertStyle: UIAlertController.Style { get set}
}


extension AlertPresentable where Self: UIViewController {
    
    func show(alert type: DNAAlertType) {
        
        switch type {
        case let .message(title, message, actions):
            let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle )
            actions.forEach { (action) in
                alert.addAction(action)
            }
            
            alert.show()
            
        case let .textInput(title, message, input, actions):
            let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        
            actions.forEach { (action) in
                alert.addAction(action)
            }
         alert.show()
            
        }
    }
}


class TextFieldController: UIViewController {
    
    fileprivate var textField: DNATextField?
    
    struct ui {
        static let height: CGFloat = 44
        static let hInset: CGFloat = 12
        static var vInset: CGFloat = 12
    }
    
    
    init(vInset: CGFloat = 12, textfield: DNATextField) {
        self.textField = textfield
        super.init(nibName: nil, bundle: nil)
        view.addSubview(textField!)
        ui.vInset = vInset
        
        /// have to set textField frame width and height to apply cornerRadius
        textField?.withSize( .init(width: ui.height, height: view.frame.size.width))
        
        
        preferredContentSize.height = ui.height + ui.vInset
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textField?.centerXToSuperview()
        textField?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: ui.vInset / 2).isActive = true
        
    }
}
