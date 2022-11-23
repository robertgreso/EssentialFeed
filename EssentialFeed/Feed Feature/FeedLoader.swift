//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 01/08/2022.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

