//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 19/12/2022.
//

import Foundation
import EssentialFeed
import UIKit

public final class FeedUIComposer {
    
    private init() {}
    
    public static func feedComposed(withFeedLoader feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presenter = FeedPresenter(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(presenter: presenter)
        let feedController = FeedViewController(refreshController: refreshController)

        presenter.loadingView = refreshController
        presenter.feedView = FeedViewAdapter(controller: feedController, imageLoader: imageLoader)
        
        return feedController
    }
    
    private static func adaptFeedToCellController(forwardingTo controller: FeedViewController, loader: FeedImageDataLoader) -> (([FeedImage]) -> Void) {
        return { [weak controller] feed in
            controller?.tableModel = feed.map { model in
                return FeedImageCellController(viewModel:  FeedImageViewModel(model: model, imageLoader: loader, imageTransformation: UIImage.init))
            }
        }
    }
    
}


private final class FeedViewAdapter: FeedView {
    
    private weak var controller: FeedViewController?
    private var imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(feed: [FeedImage]) {
        controller?.tableModel = feed.map { model in
            return FeedImageCellController(viewModel:  FeedImageViewModel(model: model, imageLoader: imageLoader, imageTransformation: UIImage.init))
        }
    }
    
}
