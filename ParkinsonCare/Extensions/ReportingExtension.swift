//
//  ReportingExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Reporting {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, event : Event, date : NSDate){
        self.init(context : context)
        self.event = event
        self.date = date
    }
    
    // MARK: - Properties -
    
    var e_event : Event {
        get{
            return self.event!
        }
    }
    
    var e_date : NSDate {
        get{
            return self.date!
        }
    }
}
