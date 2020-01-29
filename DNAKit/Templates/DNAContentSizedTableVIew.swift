//
//  DNAContentSizedTableVIew.swift
//  DNAKit
//
//  Created by Shivani on 23/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public final class DNAContentSizedTableView: UITableView {
    
    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}


public final class TTContentSizedCollectionView: UICollectionView {
    
    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
