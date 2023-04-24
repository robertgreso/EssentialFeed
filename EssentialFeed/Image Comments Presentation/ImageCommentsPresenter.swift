//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 24/04/2023.
//

import Foundation

public class ImageCommentsPresenter {
    
    public static var title: String {
        return NSLocalizedString(
            "IMAGE_COMMENTS_VIEW_TITLE",
            tableName: "ImageComments",
            bundle: Bundle(for: Self.self),
            comment: "Title for the image comments view"
        )
    }
    
}
