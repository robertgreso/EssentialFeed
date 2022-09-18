//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 01/08/2022.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

