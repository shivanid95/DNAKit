//
//  UIView+utility.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

//MARK: - Tooltip Helpers
extension UIView {
    
    func hasSuperview(_ superview: UIView) -> Bool{
        return viewHasSuperview(self, superview: superview)
    }
    
    fileprivate func viewHasSuperview(_ view: UIView, superview: UIView) -> Bool {
        if let sview = view.superview {
            if sview === superview {
                return true
            }
            else {
                return viewHasSuperview(sview, superview: superview)
            }
        }
        else {
            return false
        }
    }
    
    
    
    /// This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T
    /// https://stackoverflow.com/a/45297466/5321670
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }

}

//MARK: Shadow Helpers

public extension UIView {
    
    func addShadow(ofType type: DNAShadowType) {
        layer.applySketchShadow(color: type.shadowColor, alpha: type.shadowOpacity, x: type.x, y: type.y, blur: type.blur , spread: type.spread)
    }
    
//    func addBorder() {
//        layer.cornerRadius = Constants.CORNER_RADIUS
//        layer.borderWidth = 1
//        layer.borderColor = Color.brandBorderLight.cgColor
//        
//    }
}
