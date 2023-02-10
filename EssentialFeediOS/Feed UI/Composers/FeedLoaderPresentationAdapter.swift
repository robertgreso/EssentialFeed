//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 05/01/2023.
//

import Foundation
import EssentialFeed
import EssentialFeediOS

internal final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    
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
