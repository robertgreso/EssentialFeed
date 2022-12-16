//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Róbert Grešo on 16/12/2022.
//

import UIKit

extension UIRefreshControl {
    
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
    
}
