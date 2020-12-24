//
//  RoundedButton.swift
//  BornakTestTask
//
//  Created by shayan amindaneshpour on 3/2/20.
//  Copyright © 2020 Shayan. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = 10
    }
    

}
