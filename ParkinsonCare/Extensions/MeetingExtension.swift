//
//  MeetingExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Meeting {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, doctor : Doctor, date : NSDate, delay : Int){
        self.init(context : context)
        self.doctor = doctor
        self.date = date
        self.delay = Int16(delay)
    }
    
    // MARK: - Properties -
    
    var e_doctor : Doctor {
        return self.doctor!
    }
    
    var e_date : NSDate {
        get{
            return self.date!
        }
    }
    
    var e_delay : Int {
        get{
            return Int(self.delay)
        }
    }
}
