//
//  Loadable.swift
//  DNAKit
//
//  Created by Shivani on 13/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

private struct FileConstants {
    /// an arbitrary tag id for the loading view, so it can be retrieved later without keeping a reference to it
    fileprivate static let loadingViewTag = 1234
}

/// Displays loader (activity indictor) onto the conformed UIview class
public protocol Loadable {
    
}

extension Loadable where Self: UIView {
    
    ///Displays an activity indictor centered in the view conforming to the protocol
    func showLoader() {
        let loader = UIActivityIndicatorView(style: .gray)
        self.addSubview(loader)
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerInSuperview()
        loader.tag = FileConstants.loadingViewTag
        loader.startAnimating()
        
    }
    /// Hides activity indictor (if present)
    func hideLoader() {
        self.subviews.forEach { subview in
            if subview.tag == FileConstants.loadingViewTag {
                subview.removeFromSuperview()
            }
        }
    }
}
