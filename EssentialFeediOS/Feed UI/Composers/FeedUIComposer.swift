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
    
    public static func feedComposedWith(feedLoader: @escaping ()-> AnyPublisher<[FeedImage], Error>, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) -> FeedViewController {
        let presentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>(loader: { feedLoader().dispatchOnMainQueue() })
        let feedController = FeedViewController.makeWith(delegate: presentationAdapter, title: FeedPresenter.title)
        let feedViewAdapter = FeedViewAdapter(controller: feedController, imageLoader: { imageLoader($0).dispatchOnMainQueue() })
        
        let presenter = LoadResourcePresenter(resourceView: feedViewAdapter, loadingView:  WeakRefVirtualProxy(feedController), errorView: WeakRefVirtualProxy(feedController), mapper: FeedPresenter.map)
        presentationAdapter.presenter = presenter
        
        return feedController
    }

}

private extension FeedViewController {
    
    static func makeWith(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        
        return feedController
    }
    
}
