//
//  LoadMoreCellController.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 16/05/2023.
//

import UIKit
import EssentialFeed

public class LoadMoreCellController: NSObject, UITableViewDataSource {
    
    private let cell = LoadMoreCell()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell
    }
    
}

extension LoadMoreCellController: ResourceLoadingView, ResourceErrorView {
    
    public func display(_ viewModel: EssentialFeed.ResourceLoadingViewModel) {
        cell.isLoading = viewModel.isLoading
    }
    
    public func display(_ viewModel: ResourceErrorViewModel) {
        cell.message = viewModel.message
    }
    
}