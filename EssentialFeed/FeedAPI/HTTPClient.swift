//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 12/09/2022.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}
