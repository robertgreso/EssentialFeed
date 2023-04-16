//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 19/01/2023.
//

import Foundation

public struct ResourceErrorViewModel {
    
    public let message: String?
    
    static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
    
}
