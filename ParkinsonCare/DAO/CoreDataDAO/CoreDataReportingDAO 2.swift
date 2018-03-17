//
//  CoreDataReportingDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataReportingDAO : ReportingDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> ReportingCollection{
        let request : NSFetchRequest<Reporting> = Reporting.fetchRequest()
        do{
            var reportings = ReportingCollection()
            try reportings.setReportings(reportings: self.context.fetch(request))
            return reportings
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(rep: Reporting) -> Bool {
        return true
    }
    
    func add(rep: Reporting) -> Bool {
        return true
    }
    
}

