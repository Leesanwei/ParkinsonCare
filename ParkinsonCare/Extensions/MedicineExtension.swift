//
//  MedicineExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Medicine {
    
    convenience init(name : String, amount : Int, comment : String){
        self.init()
        self.name = name
        self.amount = Int16(amount)
        self.comment = comment
    }
    
    func getFullDescription() -> String{
        return "\(self.getName()) \(self.getAmount())"
    }
    
    func getName() -> String {
        return self.name!
    }
    
    func getAmount() -> Int {
        return Int(self.amount)
    }
}
