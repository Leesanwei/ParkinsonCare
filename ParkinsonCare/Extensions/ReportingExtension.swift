//
//  ReportingExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Reporting {
    
    convenience init(event : Event, date : NSDate){
        self.init()
        self.event = event
        self.date = date
    }
    
    func getEvent() -> Event {
        return self.event!
    }
    
    func getDate() -> NSDate {
        return self.date!
    }
}
