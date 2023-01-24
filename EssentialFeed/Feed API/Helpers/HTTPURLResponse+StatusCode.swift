//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 23/01/2023.
//

import Foundation

extension HTTPURLResponse {
    
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
    
}
