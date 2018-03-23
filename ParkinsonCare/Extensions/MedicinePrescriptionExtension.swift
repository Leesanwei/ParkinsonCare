//
//  MedicinePrescriptionExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension MedicinePrescription {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, medicine : Medicine, morning : Bool, midday : Bool, evening : Bool, frequency : Int, beginDate : NSDate, endDate : NSDate){
        self.init(context : context)
        self.medicine = medicine
        self.morning = morning
        self.midday = midday
        self.evening = evening
        self.beginDate = beginDate
        self.endDate = endDate
        self.frequency = Int16(frequency)
    }
    
    // MARK: - Properties -
    
    var e_medicine : Medicine {
        get{
            return self.medicine!
        }
    }
    
    var fullName : String {
        get{
            return "\(self.e_medicine.e_name) \(self.e_medicine.e_amount)"
        }
    }
    
    var e_frequency : Int {
        get{
            return Int(self.frequency)
        }
    }
    
    var e_beginDate : NSDate {
        get{
            return self.beginDate!
        }
    }

    var e_endDate : NSDate {
        get{
            return self.endDate!
        }
    }
    
    var hasMorningTake : Bool {
        get{
            return self.morning
        }
    }
    
    var hasMiddayTake : Bool {
        get{
            return self.midday
        }
    }
    
    var hasEveningTake : Bool {
        get{
            return self.evening
        }
    }
    
}
