//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 29/12/2022.
//

import Foundation
import EssentialFeed


protocol FeedView {
    func display(feed: [FeedImage])
}

protocol FeedLoadingView: AnyObject {
    func display(isLoading: Bool)
}

final class FeedPresenter {
    
    typealias Observer<T> = (T) -> Void
    
    private let feedLoader: FeedLoader
    
    var feedView: FeedView?
    weak var loadingView: FeedLoadingView?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    func loadFeed() {
        loadingView?.display(isLoading: true)
        
        feedLoader.load(completion: { [weak self] result in
            if let feed = try? result.get() {
                self?.feedView?.display(feed: feed)
            }
            
            self?.loadingView?.display(isLoading: false)
        })
    }
    
}
