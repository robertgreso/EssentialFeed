//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 01/11/2022.
//

import Foundation

final class FeedCachePolicy {
    
    private static let calendar = Calendar(identifier: .gregorian)

    private static var maxCacheAgeInDays: Int {
        return 7
    }
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        
        return date < maxCacheAge
    }
    
}
