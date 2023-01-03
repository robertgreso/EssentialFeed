//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 17/12/2022.
//

import UIKit

protocol FeedRefreshViewControllerDelegate {
    
    func didRequestFeedRefresh()
    
}

public final class FeedRefreshViewController: NSObject, FeedLoadingView {
    
    @IBOutlet var view: UIRefreshControl?
        
    var delegate: FeedRefreshViewControllerDelegate?
    
    @IBAction func refresh() {
        delegate?.didRequestFeedRefresh()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        } else {
            view?.endRefreshing()
        }
    }
    
}
