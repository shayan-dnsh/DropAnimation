//
//  CircleButton.swift
//  BornakTestTask
//
//  Created by shayan amindaneshpour on 3/2/20.
//  Copyright © 2020 Shayan. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = self.bounds.height / 2
    }
    
}

extension UIButton {
    func rotate90Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = Double.pi / 4
        rotateAnimation.duration = duration

        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
