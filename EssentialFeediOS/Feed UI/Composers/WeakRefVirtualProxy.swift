//
//  WeakRefVirtualProxy.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 05/01/2023.
//

import UIKit
import EssentialFeed

internal final class WeakRefVirtualProxy<T: AnyObject> {
    
    private weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
    
}

extension WeakRefVirtualProxy: FeedLoadingView where T: FeedLoadingView {
    
    func display(_ viewModel: FeedLoadingViewModel) {
        object?.display(FeedLoadingViewModel(isLoading: viewModel.isLoading))
    }
    
}

extension WeakRefVirtualProxy: FeedImageView where T: FeedImageView, T.Image == UIImage {
    
    func display(_ model: FeedImageViewModel<UIImage>) {
        object?.display(model)
    }
    
}

extension WeakRefVirtualProxy: FeedErrorView where T: FeedErrorView {
    
    func display(_ viewModel: FeedErrorViewModel) {
        object?.display(viewModel)
    }
    
}

