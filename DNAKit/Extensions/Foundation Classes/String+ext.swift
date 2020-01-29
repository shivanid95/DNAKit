//
//  String+ext.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import Foundation


extension String {
    
    /// Drops the given `prefix` from `self`.
    /// - Returns: String without the specified `prefix` or nil if `prefix` doesn't exists.
    public func stripPrefix(_ prefix: String) -> String? {
        guard hasPrefix(prefix) else { return nil }
        return String(dropFirst(prefix.count))
    }
    
    /// returns attributed string by adding properties to a raw html String
    public var htmlToAttributedString: DNAAttributedString? {
        guard let data = data(using: .utf8) else { return DNAAttributedString(stringLiteral: "") }
        do {
           let atrStr = try  NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            return DNAAttributedString(attributedString: atrStr)
        } catch {
            return DNAAttributedString(stringLiteral: "")
        }
    }
    
    ///Returns a new string by prepending a rupee symbol to the string
    public func formattedAmount() -> String {
        if  Double(self) != nil {
             return "\u{20B9}" + self
        }
        
        return self
    }
}

extension String: Evaluatable {
    
    public func evaluate(with condition: String) -> Bool {
        guard let range = range(of: condition, options: .regularExpression, range: nil, locale: nil) else {
            return false
        }
        
        return range.lowerBound == startIndex && range.upperBound == endIndex
    }
 
}
