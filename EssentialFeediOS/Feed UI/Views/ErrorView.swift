//
//  ErrorView.swift
//  EssentialFeediOS
//
//  Created by Róbert Grešo on 11/01/2023.
//

import UIKit

public final class ErrorView: UIView {
    
    @IBOutlet private var label: UILabel!
    
    public var message: String? {
        get { return isVisible ? label.text : nil }
        set { setMessageAnimated(newValue) }
    }
    
    private var isVisible: Bool {
        return alpha > 0
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = nil
    }
    
    private func setMessageAnimated(_ message: String?) {
        if let message = message {
            showAnimated(message)
        } else {
            hideAnimated()
        }
    }
    
    private func showAnimated(_ message: String) {
        label.text = message
        
        UIView.animate(withDuration: 0.5) { self.alpha = 1 }
    }
    
    @IBAction private func hideAnimated() {
        UIView.animate(
            withDuration: 0.25,
            animations: { self.alpha = 0 },
            completion: { completed in
                if completed { self.label.text = nil }
            }
        )
    }
    
}

