//
//  ActivityExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Activity {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, name : String, duration : Int, frequency : Int){
        self.init()
        self.name = name
        self.duration = Int16(duration)
        self.frequency = Int16(frequency)
    }
    
    // MARK: - Properties -
    
    var e_name : String {
        get{
            return self.name!
        }
    }
    
    var e_duration : Int {
        get{
            return Int(self.duration)
        }
    }
    
    var e_frequency : Int {
        get{
            return Int(self.frequency)
        }
    }
}
