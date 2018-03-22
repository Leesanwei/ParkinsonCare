//
//  ReportingExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Reporting {
    
    // MARK: - Initializater
    convenience init(event : Event, date : Date){
        self.init()
        self.event = event
        self.date = date
    }
    
    // MARK: - Properties -
    
    var e_event : Event {
        get{
            return self.event!
        }
    }
    
    var e_date : Date {
        get{
            return self.date!
        }
    }
}
