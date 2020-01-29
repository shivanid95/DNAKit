//
//  DNAImageView.swift
//  DNAKit
//
//  Created by Shivani on 28/01/20.
//  Copyright © 2020 designSystem. All rights reserved.
//

import UIKit

public enum DNAImageViewState: Int, CaseIterable {
    case empty
    case loading
    case normal
    case error
}

public enum DNAImageSource {
    case url(URL)
    case image(UIImage?)
    case urlString(String)
}

public class DNAImageView: UIImageView, Loadable {
 
    //MARK:- Variables
    fileprivate struct StateImages {
        var empty: UIImage?
        var normal: UIImage?
        var error: UIImage?
        var loading: UIImage?
    }
    
    public var state: DNAImageViewState = .loading {
        didSet {
            switch state {
            case .loading: showLoader()
            default:
                hideLoader()
                self.image = image(forState: state)
            }
        }
    }
    
    fileprivate var stateImages = StateImages()
    
    //MARK:- Initialization
    public init(source: DNAImageSource?) {
        super.init(frame: .zero)
        guard let source = source else { return }
        self.setImage(source, forState: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Utility
    public func setImage(_ imageSource: DNAImageSource, forState state: DNAImageViewState) {
        getImage(fromSource: imageSource, state: state) { [weak self] img in
            guard let img = img else { return }
            switch state {
            case .empty: self?.stateImages.empty = img
            case .normal: self?.stateImages.normal = img 
            case .error: self?.stateImages.error = img
            case .loading: self?.stateImages.loading = img
            }
            self?.setNeedsDisplay()
        }
        
    }
    
    func image(forState imgState: DNAImageViewState) -> UIImage? {
        switch imgState {
        case .empty: return stateImages.empty
        case .error: return stateImages.error
        case .loading: return stateImages.loading
        case .normal: return stateImages.normal
        }
    }
    
    func getImage(fromSource imageSource: DNAImageSource, state: DNAImageViewState,  callback: @escaping (UIImage?) -> Void ) {
        switch imageSource {
        case .image(let img): callback(img)
        case .url(let url):
            loadImage(url: url, state: state) { (image, error) in
                callback(image)
            }
            
        case .urlString(let urlString):
            guard let url = URL(string: urlString) else {
                print("Couldn't create URL from \(urlString)")
                return
            }
            loadImage(url: url, state: state) { (image, error) in
                if let err = error {
                    print("Could not load images, failed with error: \(err)")
                    callback(nil)
                }
                else {
                    callback(image)
                }
            }
        }
    }
    
    func loadImage(url: URL, state: DNAImageViewState, completion: @escaping (UIImage?, Error?) -> Void) {
        
        if state == self.state {
            self.state = .loading
        }
        // TODO :- Add code to load an image
        let theTask = URLSession.shared.dataTask(with: url) {
            data, response, error in
        
            if let response = data {
                DispatchQueue.main.async {
                    let image = UIImage(data: response)
                    completion(image, error)
                    self.state = state
            
                }
            }
        }
        theTask.resume()
        
    }
    
}
