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
            let reportings = ReportingCollection()
            try reportings.setReportings(reportings: self.context.fetch(request))
            return reportings
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(rep: Reporting) -> Bool {
        self.context.delete(rep)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    func add(event : Event, date : Date) -> Bool {
    let reporting = Reporting(context : self.context, event : event, date : date as NSDate)
    do{
    try context.save()
    return true
    }catch {
    return false
    }
    
    }
    
    func addEvent()->Bool{
        
        let events : [String] = ["Somnolence","Chute","Hallucination","Prise de dispersible","Clic / bolus d’Apokinon"]
        
        
        for eve in events {
            let event = Event(context : self.context)
            event.name = eve
            do{
                try context.save()
                
            }catch {
                return false
            }
            
            
        }
        return true
        
    }
    
    func findAllEvents() -> [Event]?{
    let request : NSFetchRequest<Event> = Event.fetchRequest()
    do{
    return try self.context.fetch(request)
    
    }catch {
    return nil
    }
}

}

