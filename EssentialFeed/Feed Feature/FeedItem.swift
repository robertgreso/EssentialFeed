//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 01/08/2022.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
