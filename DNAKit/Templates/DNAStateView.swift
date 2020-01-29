//
//  DNAStateView.swift
//  DNAKit
//
//  Created by Shivani on 20/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit
/**
 UIView which supports multiple view states
 Provide a custom view for each states and change `state` variable to switch views
 */
open class DNAStateView: UIView {
    
    public var state: DNAViewState = .empty {
        didSet {
            setup()
            setNeedsLayout()
        }
    }
    
    public var edgeInsets: UIEdgeInsets?
    
    //MARK: - State Views
    
    open var emptyView: UIView?
    
    open var loadingView: UIView?
    
    open var contentView: UIView?
    
    open var errorView: UIView?
    
    //MARK: - Initialize
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup
    
    private func setup() {
        
        //Remove all subviews in the container
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        
        // add the subview based on the view state
        switch state {
            
        case .content:
            guard let contentView = contentView else {
                return
            }
            
            addSubview(contentView)
            contentView.fillSuperview(padding: edgeInsets ?? .allSides(.zero))
            
        case .empty:
            guard let emptyView = emptyView else {
                return
            }
            addSubview(emptyView)
            emptyView.fillSuperview(padding: edgeInsets ?? .allSides(.zero))
            
        case .loading:
            guard let loadingView = loadingView else {
                return
            }
            addSubview(loadingView)
            loadingView.fillSuperview(padding: edgeInsets ?? .allSides(.zero))
            
        case .error:
            guard let errorView = errorView else {
                return
            }
            addSubview(errorView)
            errorView.fillSuperview(padding: edgeInsets ?? .allSides(.zero))
            
        }
    }
    
}
