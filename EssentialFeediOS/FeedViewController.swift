//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 01/12/2022.
//

import UIKit
import EssentialFeed

final public class FeedViewController: UITableViewController {
    
    var loader: FeedLoader?
    
    public convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
        
        load()
    }
    
    @objc private func load() {
        refreshControl?.beginRefreshing()

        loader?.load(completion: { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        })
    }
    
}
