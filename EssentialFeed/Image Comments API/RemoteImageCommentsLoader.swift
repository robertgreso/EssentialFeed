//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 19/03/2023.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    
    convenience init(client: HTTPClient, url: URL) {
        self.init(client: client, url: url, mapper: ImageCommentsMapper.map)
    }
    
}
