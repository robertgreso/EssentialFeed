//
//  FeedImageCellController.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 18/12/2022.
//

import UIKit

protocol FeedImageCellControllerDelegate {
    
    func didRequestImage()
    func didCancelImageRequest()
    
}

final class FeedImageCellController: FeedImageView {
    
    private let delegate: FeedImageCellControllerDelegate
    private var cell: FeedImageCell?
        
    init(delegate: FeedImageCellControllerDelegate) {
        self.delegate = delegate
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        delegate.didRequestImage()
        return cell!
    }
    
    func preload() {
        delegate.didRequestImage()
    }
    
    func recapture(cell: UITableViewCell) {
        self.cell = cell as? FeedImageCell
        delegate.didRequestImage()
    }
    
    func cancelLoad() {
        releaseCellForReuse()
        delegate.didCancelImageRequest()
    }
    
    private func releaseCellForReuse() {
        cell = nil
    }
    
    func display(_ model: FeedImageViewModel<UIImage>) {
        cell?.locationContainer.isHidden = !model.hasLocation
        cell?.locationLabel.text = model.location
        cell?.descriptionLabel.text = model.description
        cell?.feedImageView.setImageAnimated(model.image)
        cell?.feedImageContainer.isShimmering  = model.isLoading
        cell?.feedImageRetryButton.isHidden = !model.shouldRetry
        cell?.onRetry = delegate.didRequestImage
    }
    
    

}
