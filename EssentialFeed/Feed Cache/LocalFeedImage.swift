//
//  LocalFeedItem.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 25/10/2022.
//

import Foundation

public struct LocalFeedImage: Equatable, Codable {
    
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL
    
    public init(id: UUID, description: String?, location: String?, url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
    
}
