//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 17/12/2022.
//

import UIKit

public final class FeedRefreshViewController: NSObject {
    
    private(set) lazy var view = binded(UIRefreshControl())
    
    private let viewModel: FeedViewModel
        
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onLoadingStateChange = { [weak view] isLoading in
            if isLoading {
                view?.beginRefreshing()
            } else {
                view?.endRefreshing()
            }
        }
        
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return view
    }
    
}
