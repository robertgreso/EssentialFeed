//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Róbert Grešo on 30/10/2022.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "Any Error", code: 1)
}
