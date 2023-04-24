//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 27/12/2022.
//

public struct FeedImageViewModel {
    
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
    
}
