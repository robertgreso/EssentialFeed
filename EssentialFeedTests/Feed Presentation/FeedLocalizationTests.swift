//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Róbert Grešo on 03/01/2023.
//

@testable import EssentialFeed
import XCTest

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    
}
