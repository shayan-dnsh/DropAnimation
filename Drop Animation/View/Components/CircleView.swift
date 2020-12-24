//
//  CircleView.swift
//  BornakTestTask
//
//  Created by shayan amindaneshpour on 3/2/20.
//  Copyright © 2020 Shayan. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.layer.masksToBounds = true
        self.clipsToBounds       = true
        self.layer.cornerRadius  = self.layer.bounds.height / 2
    }

}
