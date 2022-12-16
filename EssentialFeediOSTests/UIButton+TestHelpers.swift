//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Róbert Grešo on 16/12/2022.
//

import UIKit

extension UIButton {
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
    
}

