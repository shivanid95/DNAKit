//
//  DNAImage.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit



public enum DNAImage {
    //TODO: - Change Later
    static let bundleName = "com.designSystem.dnakit.DNAKit"
  
    public static let notificationIcon = UIImage(name: "notification", bundle: DNAImage.bundleName)
    
    public static let chevronDown = UIImage(name: "chevron-up", bundle: DNAImage.bundleName)
    
    public static let searchIcon = UIImage(name: "search", bundle: DNAImage.bundleName )

    public static let queryIcon = UIImage(name: "details", bundle: DNAImage.bundleName)
    
    public static let infoIcon = UIImage(name: "info", bundle: DNAImage.bundleName)
    
    public static let downloadFileIcon = UIImage(name: "downloadFile", bundle: DNAImage.bundleName)
    
    public static let editIcon = UIImage(name: "edit", bundle: DNAImage.bundleName)
    
    public static let priceUp = UIImage(name: "price-up", bundle: DNAImage.bundleName)
    
    public static let priceDown = UIImage(name: "price-down", bundle: DNAImage.bundleName)
    
    public static let showLess = UIImage(name: "show-less", bundle: DNAImage.bundleName)
    
    public static let showMore = UIImage(name: "show-more", bundle: DNAImage.bundleName)
    
    public enum EmptyState {
        public static let loader = UIImage(name: "empty-loader", bundle: DNAImage.bundleName)
    }
    
    public enum Selection {
        public static let circleTick = UIImage(name: "tick-with-circle", bundle: DNAImage.bundleName)
        
        public static let checkedRadioButton =   UIImage(name: "CheckedRadio", bundle: DNAImage.bundleName)
        
        public static let uncheckedRadioButton = UIImage(name: "UncheckedRadio", bundle: DNAImage.bundleName)
        
        public static let checkboxSelected = UIImage(name: "checkbox-done", bundle: DNAImage.bundleName)
        
        public static let checkboxUnselected = UIImage(name: "checkbox-blank", bundle: DNAImage.bundleName)
        
    }
    
    public enum Direction {
        
        public static let chevronUp = UIImage(name: "chevron-down", bundle: DNAImage.bundleName)
        
        public static let chevronDown = UIImage(name: "chevron-up", bundle: DNAImage.bundleName)
        
        public static let chevronLeft = UIImage(name: "chevron-left", bundle: DNAImage.bundleName)
        
        public static let chevronRight = UIImage(name: "chevron-right", bundle: DNAImage.bundleName)
        
        public static let arrowRightSmall = UIImage(name: "arrow-right-grey", bundle: DNAImage.bundleName)
    }
        
    
}
