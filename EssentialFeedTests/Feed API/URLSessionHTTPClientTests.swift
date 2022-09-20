//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 19/09/2022.
//

import XCTest
import EssentialFeed

class URLSessionHTTPClient: HTTPClient {
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { _, _, _ in }.resume()
    }
    
}

class URLSessionHTTPClientTests: XCTestCase {

    func test_getFromURL_createsDataTaskWithURL() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url) { _ in }
        
        XCTAssertEqual(session.receivedURLs, [url])
    }
    
    func test_getFromURL_resumesDataTaskWithURL() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, task: task)

        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url) { _ in }
        
        XCTAssertEqual(task.resumeCallCounts, 1)
    }
    
    // MARK: - Helpers
    
    private class URLSessionSpy: URLSession {
        
        private var stubs = [URL: URLSessionDataTask]()
        var receivedURLs = [URL]()
        
        
        func stub(url: URL, task: URLSessionDataTask) {
            stubs[url] = task
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return stubs[url] ?? FakeURLSessionDataTask()
        }
        
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask {
        override func resume() {}
    }
    
    private class URLSessionDataTaskSpy: URLSessionDataTask {
        
        var resumeCallCounts = 0
        
        override func resume() {
            resumeCallCounts += 1
        }
    }

}
