//
//  FeedImagePresenter.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 30/12/2022.
//

import Foundation

public final class FeedImagePresenter {
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
    
}
