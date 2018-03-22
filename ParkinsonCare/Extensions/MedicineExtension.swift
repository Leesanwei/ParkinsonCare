//
//  MedicineExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Medicine {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, name : String, amount : Int, comment : String){
        self.init(context : context)
        self.name = name
        self.amount = Int16(amount)
        self.comment = comment
    }
    
    // MARK: - Properties -
    
    var fullDescription : String {
        get{
            return "\(self.e_name) \(self.e_amount)"
        }
    }
    
    var e_name : String {
        get{
            return self.name!
        }
    }
    
    var e_amount : Int {
        get{
            return Int(self.amount)
        }
    }
}
