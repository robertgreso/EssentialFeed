//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 13/09/2022.
//

import Foundation

final class FeedItemsMapper {
    
    private struct Root: Decodable {
        
        private let items: [RemoteFeedItem]
        
        private struct RemoteFeedItem: Decodable {
            
            let id: UUID
            let description: String?
            let location: String?
            let imageURL: URL
            
            private enum CodingKeys: String, CodingKey {
                case id
                case description
                case location
                case imageURL = "image"
            }
            
        }
        
        var images: [FeedImage] {
            items.map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.imageURL) }
        }
    }
    

    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedImage] {
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.images
    }
    
}
