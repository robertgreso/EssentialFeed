//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 27/12/2022.
//

struct FeedImageViewModel<Image> {
    
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
    
}
