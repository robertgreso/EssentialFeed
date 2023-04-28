//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 12/01/2023.
//

import UIKit

extension UIRefreshControl {

    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
    
}
