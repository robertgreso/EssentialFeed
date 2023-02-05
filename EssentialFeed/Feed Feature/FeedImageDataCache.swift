//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 04/02/2023.
//

import Foundation

public protocol FeedImageDataCache {
    
    typealias Result = Swift.Result<Void, Swift.Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
        
}
