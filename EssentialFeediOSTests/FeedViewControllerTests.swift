//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Róbert Grešo on 28/11/2022.
//

import XCTest
import UIKit
import EssentialFeed

final class FeedViewController: UIViewController {
    
    var loader: FeedViewControllerTests.LoaderSpy?
    
    convenience init(loader: FeedViewControllerTests.LoaderSpy) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader?.load()
    }
    
}

final class FeedViewControllerTests: XCTestCase {
   
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        let _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    func test_viewDidLoad_loadsFeed() {
        let loader = LoaderSpy()
        let sut = FeedViewController(loader: loader)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loadCallCount, 1)
    }
 
    
    // MARK: Helpers
    
    class LoaderSpy {
        
        private(set) var loadCallCount = 0
        
        func load() {
            loadCallCount += 1
        }
        
    }
    
}
