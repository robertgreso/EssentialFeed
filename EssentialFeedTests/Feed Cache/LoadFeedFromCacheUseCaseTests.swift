//
//  LoadFeedFromCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 26/10/2022.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_requestCacheRetrieval() {
        let (sut, store) = makeSUT()
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_failsOnRetrievalError() {
        let (sut, store) = makeSUT()
        let retrievalError = anyNSError()
        let expectation = expectation(description: "Wait for load compeltion")

        var receivedError: Error?
        
        sut.load { result in
            switch result {
            case .failure(let error):
                receivedError = error
            default:
                XCTFail("Expected failure, got \(result)")
            }
            
            expectation.fulfill()
        }
        
        store.completeRetrieval(with: retrievalError)

        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(receivedError as NSError?, retrievalError)
    }
    
    func test_load_deliversNoImagesOnEmptyCache() {
        let (sut, store) = makeSUT()

        let expectation = expectation(description: "Wait for load compeltion")

        var receivedImages: [FeedImage]?
        sut.load { result in
            switch result {
            case .success(let images):
                receivedImages = images
            default:
                XCTFail("Expected success got \(result)")
            }
            
            expectation.fulfill()
        }

        store.completeRetrievalWithEmptyCache()

        wait(for: [expectation], timeout: 1.0)

        XCTAssertEqual(receivedImages, [])
    }
    
    // MARK - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (LocalFeedLoader, FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return (sut, store)
    }
    
    private func anyNSError() -> NSError {
        return NSError(domain: "Any Error", code: 1)
    }

}
