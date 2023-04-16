//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 19/01/2023.
//

import Foundation

public final class FeedPresenter {

    public static var title: String {
        return NSLocalizedString(
            "FEED_VIEW_TITLE",
            tableName: "Feed",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Title for the feed view"
        )
    }
    
    public static func map(feed: [FeedImage]) -> FeedViewModel {
        FeedViewModel(feed: feed)
    }
    
}
