//
//  MedicineExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Medicine {
    
    func getFullDescription() -> String{
        return "\(String(describing: self.name)) \(self.amount)"
    }
}
