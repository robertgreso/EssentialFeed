//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 03/02/2023.
//

import Foundation

public protocol FeedCache {
    
    typealias SaveResult = Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void)
    
}
