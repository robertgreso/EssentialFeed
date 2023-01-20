//
//  FeedViewController+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Róbert Grešo on 03/01/2023.
//

import Foundation
import XCTest
import EssentialFeed

extension FeedUIIntegrationTests {
    
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let bundle = Bundle(for: FeedPresenter.self)
        let table = "Feed"
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        
        if value == key {
            XCTFail("Missing localization for key: \(key) in table: \(table)", file: file, line: line)
        }
        
        return value
    }
    
}
