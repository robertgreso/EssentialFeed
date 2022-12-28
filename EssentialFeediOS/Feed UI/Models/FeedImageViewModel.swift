//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 27/12/2022.
//

import Foundation
import EssentialFeed
import UIKit

final class FeedImageViewModel {
    
    typealias Observer<T> = (T) -> Void
 
    private var task: FeedImageDataLoaderTask?
    private let model: FeedImage
    private let imageLoader: FeedImageDataLoader
    
    var onImageLoad: Observer<UIImage>?
    var onImageLoadingStateChange: Observer<Bool>?
    var onShouldRetryImageLoadStateChange: Observer<Bool>?
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    var location: String? {
        return model.location
    }
    
    var description: String? {
        return model.description
    }
    
    var hasLocation: Bool {
        return location != nil
    }
    
    func loadImageData() {
        onImageLoadingStateChange?(true)
        onShouldRetryImageLoadStateChange?(false)
        
        self.task = self.imageLoader.loadImageData(from: self.model.url) { [weak self] result in
            self?.handle(result)
        }
    }
    
    func cancelImageDataLoad() {
        task?.cancel()
    }
    
    private func handle(_ result: FeedImageDataLoader.Result) {
        if let image = (try? result.get()).flatMap(UIImage.init) {
            onImageLoad?(image)
        } else {
            onShouldRetryImageLoadStateChange?(true)
        }
        
        onImageLoadingStateChange?(false)
    }
    
    

}
