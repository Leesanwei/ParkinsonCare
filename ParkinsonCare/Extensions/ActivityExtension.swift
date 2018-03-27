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
    convenience init(context : NSManagedObjectContext, name : String, duration : Int, days : [Bool]){
        self.init(context : context)
        self.name = name
        self.duration = Int16(duration)
        self.monday = days[0]
        self.tuesday = days[1]
        self.wednesday = days[2]
        self.thursday = days[3]
        self.friday = days[4]
        self.saturday = days[5]
        self.sunday = days[6]

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
    var isAMondayActivity : Bool {
        get{
            return self.monday
        }
    }
    var isATuesdayActivity : Bool {
        get{
            return self.tuesday
        }
    }
    var isAWednesdayActivity : Bool {
        get{
            return self.wednesday
        }
    }
    var isAThursdayActivity : Bool {
        get{
            return self.thursday
        }
    }
    var isAFridayActivity : Bool {
        get{
            return self.friday
        }
    }
    var isASaturdayActivity : Bool {
        get{
            return self.saturday
        }
    }
    var isASundayActivity : Bool {
        get{
            return self.sunday
        }
    }
}
