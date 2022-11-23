//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 01/08/2022.
//

import Foundation


public protocol FeedLoader {
    
    typealias Result = Swift.Result<[FeedImage], Error>

    func load(completion: @escaping (Result) -> Void)
    
}

