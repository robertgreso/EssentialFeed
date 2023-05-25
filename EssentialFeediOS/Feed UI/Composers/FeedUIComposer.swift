//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 19/12/2022.
//

import Foundation
import EssentialFeed
import EssentialFeediOS
import UIKit
import Combine

public final class FeedUIComposer {
    
    private init() {}
    
    public static func feedComposedWith(
        feedLoader: @escaping ()-> AnyPublisher<Paginated<FeedImage>, Error>,
        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher,
        selection: @escaping (FeedImage) -> Void = { _ in }
    ) -> ListViewController {
        let presentationAdapter = LoadResourcePresentationAdapter<Paginated<FeedImage>, FeedViewAdapter>(loader: { feedLoader().dispatchOnMainQueue() })
        let feedController = ListViewController.makeWith(title: FeedPresenter.title)
        feedController.onRefresh = presentationAdapter.loadResource
        
        let feedViewAdapter = FeedViewAdapter(
            controller: feedController,
            imageLoader: { imageLoader($0).dispatchOnMainQueue() },
            selection: selection
        )
        
        let presenter = LoadResourcePresenter(resourceView: feedViewAdapter, loadingView:  WeakRefVirtualProxy(feedController), errorView: WeakRefVirtualProxy(feedController), mapper: { $0 })
        presentationAdapter.presenter = presenter
        
        return feedController
    }

}

private extension ListViewController {
    
    static func makeWith(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.title = title
        
        return feedController
    }
    
}
