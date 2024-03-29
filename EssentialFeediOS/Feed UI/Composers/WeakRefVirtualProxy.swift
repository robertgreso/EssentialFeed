//
//  WeakRefVirtualProxy.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 05/01/2023.
//

import UIKit
import EssentialFeed
import EssentialFeediOS

internal final class WeakRefVirtualProxy<T: AnyObject> {
    
    private weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
    
}

extension WeakRefVirtualProxy: ResourceLoadingView where T: ResourceLoadingView {
    
    func display(_ viewModel: ResourceLoadingViewModel) {
        object?.display(viewModel)
    }
    
}

extension WeakRefVirtualProxy: ResourceView where T: ResourceView, T.ResourceViewModel == UIImage {
    
    func display(_ model: UIImage) {
        object?.display(model)
    }
    
}

extension WeakRefVirtualProxy: ResourceErrorView where T: ResourceErrorView {
    
    func display(_ viewModel: ResourceErrorViewModel) {
        object?.display(viewModel)
    }
    
}

