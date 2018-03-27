//
//  StateLabel.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(state : String, content : String){
        self.init()
        
        self.text = content
        self.textAlignment = NSTextAlignment.center
        switch state {
        case "On" : self.backgroundColor = UIColor.green; break
        case "Off" : self.backgroundColor = UIColor.red; break
        case "Dyskinesie" : self.backgroundColor = UIColor.yellow; break
        default : print("Unknown State")
        }
        
    }
}
