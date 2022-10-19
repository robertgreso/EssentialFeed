//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 19/10/2022.
//

import XCTest

class LocalFeedLoader {
    
    init(store: FeedStore) {}
    
}

class FeedStore {
    
    var deleteCachedFeedCallCount = 0
    
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        let _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
}
