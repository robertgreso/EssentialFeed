//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Róbert Grešo on 23/08/2022.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public final class RemoteFeedLoader {
    
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        
        // TODO: WHY THE FUCK is this called in the tests only when client.complete which is after load
        client.get(from: url) { result in
            switch result {
            case let .success(data, response):
                do {
                    let items = try FeedItemsMapper.map(data, response)
                    completion(.success(items))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
    
    private class FeedItemsMapper {
        
        private struct Root: Decodable {
            let items: [Item]
        }
        
        private struct Item: Decodable {
            
            let id: UUID
            let description: String?
            let location: String?
            let imageURL: URL
            
            var item: FeedItem {
                return FeedItem(id: id, description: description, location: location, imageURL: imageURL)
            }
            
            private enum CodingKeys: String, CodingKey {
                case id
                case description
                case location
                case imageURL = "image"
            }
            
        }

        static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
            guard response.statusCode == 200 else {
                throw RemoteFeedLoader.Error.invalidData
            }
            
            let root = try JSONDecoder().decode(Root.self, from: data)
            return root.items.map { $0.item }
        }
        
    }
    
}
