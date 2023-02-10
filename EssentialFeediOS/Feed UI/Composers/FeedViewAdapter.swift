//
//  FeedViewAdapter.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 05/01/2023.
//

import UIKit
import EssentialFeed
import EssentialFeediOS

internal final class FeedViewAdapter: FeedView {
    
    private weak var controller: FeedViewController?
    private var imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.display(viewModel.feed.map { model in
            let adapter = FeedImageDataLoaderPresentationAdapter<WeakRefVirtualProxy<FeedImageCellController>, UIImage>(model: model, imageLoader: imageLoader)
            let view = FeedImageCellController(delegate: adapter)
            
            adapter.presenter = FeedImagePresenter(
                view: WeakRefVirtualProxy(view),
                imageTransformer: UIImage.init
            )
            
            return view
        })
    }
    
}
