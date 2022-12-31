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
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(delegate: presentationAdapter)
        let feedController = FeedViewController(refreshController: refreshController)
        let presenter = FeedPresenter(feedView: FeedViewAdapter(controller: feedController, imageLoader: imageLoader), loadingView:  WeakRefVirtualProxy(refreshController))
        
        presentationAdapter.presenter = presenter
        
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

private final class WeakRefVirtualProxy<T: AnyObject> {
    
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

private final class FeedViewAdapter: FeedView {
    
    private weak var controller: FeedViewController?
    private var imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.tableModel = viewModel.feed.map { model in
            return FeedImageCellController(viewModel:  FeedImageViewModel(model: model, imageLoader: imageLoader, imageTransformation: UIImage.init))
        }
    }
    
}

private final class FeedLoaderPresentationAdapter: FeedRefreshViewControllerDelegate {
    
    private let feedLoader: FeedLoader
    var presenter: FeedPresenter?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        feedLoader.load { [weak self] result in
            switch result {
            case .success(let feed):
                self?.presenter?.didFinishLoading(with: feed)
            case .failure(let error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        }
    }
    
}
