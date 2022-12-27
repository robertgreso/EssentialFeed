//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 26/12/2022.
//

import Foundation
import EssentialFeed

final class FeedViewModel {
    
    private let feedLoader: FeedLoader

    private(set) var isLoading: Bool = false {
        didSet {
            onChange?(self)
        }
    }
    
    var onChange: ((FeedViewModel) -> Void)?
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    func loadFeed() {
        isLoading = true
        feedLoader.load(completion: { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            
            self?.isLoading = false
        })
    }
    
}
