//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 23/08/2022.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    
    convenience init(client: HTTPClient, url: URL) {
        self.init(client: client, url: url, mapper: FeedItemsMapper.map)
    }
    
}
