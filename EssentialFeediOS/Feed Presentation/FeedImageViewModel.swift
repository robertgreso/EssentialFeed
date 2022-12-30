//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 27/12/2022.
//

import Foundation
import EssentialFeed

final class FeedImageViewModel<Image> {
    
    typealias Observer<T> = (T) -> Void
 
    private var task: FeedImageDataLoaderTask?
    private let model: FeedImage
    private let imageLoader: FeedImageDataLoader
    private let imageTransformation: (Data) -> Image?
    
    var onImageLoad: Observer<Image>?
    var onImageLoadingStateChange: Observer<Bool>?
    var onShouldRetryImageLoadStateChange: Observer<Bool>?
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader, imageTransformation: @escaping (Data) -> Image?) {
        self.model = model
        self.imageLoader = imageLoader
        self.imageTransformation = imageTransformation
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
        if let image = (try? result.get()).flatMap(imageTransformation) {
            onImageLoad?(image)
        } else {
            onShouldRetryImageLoadStateChange?(true)
        }
        
        onImageLoadingStateChange?(false)
    }
    
    

}
