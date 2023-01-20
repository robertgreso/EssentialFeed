//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 19/01/2023.
//

import Foundation

public struct FeedErrorViewModel {
    
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
    
}
