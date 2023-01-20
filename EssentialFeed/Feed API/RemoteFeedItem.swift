//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 25/10/2022.
//

import Foundation

struct RemoteFeedItem: Decodable {
    
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
