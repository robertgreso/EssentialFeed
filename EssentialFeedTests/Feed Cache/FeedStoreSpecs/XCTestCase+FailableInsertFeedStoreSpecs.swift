//
//  XCTestCase+FailableInsertFeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 13/11/2022.
//

import EssentialFeed
import XCTest

extension FeedStoreSpecs where Self: XCTestCase {
    
    func assertThatInsertDeliversFailureOnInsertionError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        let insertionError = insert(feed: uniqueImageFeed().local, timestamp: Date(), to: sut)
        
        XCTAssertNotNil(insertionError, "Expected cache insertion to fail with an error")
    }
    
    func assertThatInsertHasNoSideEffectsOnInsertionError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        insert(feed: uniqueImageFeed().local, timestamp: Date(), to: sut)
        
        expect(sut, toRetrieve: .empty)
    }
    
}
