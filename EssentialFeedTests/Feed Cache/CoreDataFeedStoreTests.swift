//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 14/11/2022.
//

import XCTest
import EssentialFeed

class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = makeSUT()
        
        assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()
        
        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }
    
    func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
    
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
    
    }
    
    func test_insert_deliversNoErrorsOnEmptyCache() {
    
    }
    
    func test_insert_deliversNoErrorsOnNonEmptyCache() {
    
    }
    
    func test_insert_overridesPreviouslyInsertedCacheValues() {
    
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() {
    
    }
    
    func test_delete_deliversNoErrorOnNonEmptyCache() {
    
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() {
    
    }
    
    func test_delete_emptiesPreviouslyInsertedCache() {
    
    }
    
    func test_storeSideEffects_runSerially() {
    
    }
    
    private func makeSUT() -> FeedStore {
        let sut = CoreDataFeedStore()
        trackForMemoryLeaks(sut)
        
        return sut
    }
    
}
