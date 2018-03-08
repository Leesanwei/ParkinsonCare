//
//  roundButton.swift
//  ParkinsonCare
//
//  Created by admin on 08/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class roundButton: UIButton {
    
    override func didMoveToWindow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    
}
