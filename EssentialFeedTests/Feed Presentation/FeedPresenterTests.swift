//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 06/01/2023.
//

import XCTest

final class FeedPresenter {
    
    init(view: Any) {
        
    }
    
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        
        trackForMemoryLeaks(view)
        trackForMemoryLeaks(presenter)
        
        return (sut, view)
    }
    
    private class ViewSpy {
        
        let messages = [Any]()
        
    }
    
}
