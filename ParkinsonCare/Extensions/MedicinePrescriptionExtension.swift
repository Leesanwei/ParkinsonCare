//
//  MedicinePrescriptionExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension MedicinePrescription {
    
    convenience init(medicine : Medicine, morning : Bool, midday : Bool, evening : Bool, frequency : Int, beginDate : NSDate, endDate : NSDate){
        self.init()
        self.medicine = medicine
        self.morning = morning
        self.midday = midday
        self.evening = evening
        self.beginDate = beginDate
        self.endDate = endDate
        self.frequency = Int16(frequency)
    }
    
    func getMedicine() -> Medicine {
            return self.medicine!
    }
    
    func getName() -> String {
        return "\(self.getMedicine().getName()) \(self.getMedicine().getAmount())"
    }
    
    func getFrequency() -> Int {
        return Int(self.frequency)
    }
    
    func getBeginDate() -> NSDate {
        return self.beginDate!
    }

    func getEndDate() -> NSDate {
        return self.endDate!
    }
    
    func hasMorningTake() -> Bool {
        return self.morning
    }
    
    func hasMiddayTake() -> Bool {
        return self.midday
    }
    
    func hasEveningTake() -> Bool {
        return self.evening
    }
    
}
