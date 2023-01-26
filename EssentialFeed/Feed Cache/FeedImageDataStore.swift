//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 26/01/2023.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForUrl url: URL, completion: @escaping (Result) -> Void)
}
