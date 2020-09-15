//
//  UIView+Extension.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 12.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
   
    public func circle() {
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    
    public func cornerRadius(radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    public func border(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    public func blur(alpha: CGFloat = 1, style: UIBlurEffect.Style = .light, insertAt: Int = 0,cornerRadius:CGFloat = 0) {
        var isAddedBefore = false
        
        for view in subviews {
            if view.classForCoder == UIVisualEffectView.classForCoder() {
                isAddedBefore = true
            }
        }
        
        if isAddedBefore { return }
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.frame = bounds
        blurView.alpha = alpha
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.cornerRadius = cornerRadius
        blurView.layer.masksToBounds = true
        insertSubview(blurView, at: insertAt)
    }

}
