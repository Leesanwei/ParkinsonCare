//
//  ReportingDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol ReportingDAO {
    
    func findAll() throws -> ReportingCollection
   
    func add(event : Event, date : Date) -> Reporting?
    func remove(rep : Reporting) -> Bool
    func addEvent()->Bool
    func findAllEvents() -> [Event]?
}
