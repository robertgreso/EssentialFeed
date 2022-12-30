//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 29/12/2022.
//

import Foundation
import EssentialFeed

struct FeedViewModel {
    var feed: [FeedImage]
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

struct FeedLoadingViewModel {
    var isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

final class FeedPresenter {
    
    typealias Observer<T> = (T) -> Void
    
    private let feedLoader: FeedLoader
    
    var feedView: FeedView?
    var loadingView: FeedLoadingView?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    func loadFeed() {
        loadingView?.display(FeedLoadingViewModel(isLoading: true))
        
        feedLoader.load(completion: { [weak self] result in
            if let feed = try? result.get() {
                self?.feedView?.display(FeedViewModel(feed: feed))
            }
            
            self?.loadingView?.display(FeedLoadingViewModel(isLoading: false))
        })
    }
    
}
