//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 27/12/2022.
//

public struct FeedImageViewModel<Image> {
    
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
    
}
