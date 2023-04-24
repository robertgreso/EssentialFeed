//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 16/04/2023.
//

import XCTest
import EssentialFeed

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.description, image.description)
    }

}
