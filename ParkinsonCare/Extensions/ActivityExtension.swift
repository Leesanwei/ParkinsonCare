//
//  ActivityExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Activity {
    
    func getName() -> String{
        return "\(String(describing: self.name)) \(self.duration)"
    }
}
