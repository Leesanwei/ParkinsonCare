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
    
    
    /// Retrieve all the rstored reportings.
    ///
    /// - Returns: A collection of reportings.
    /// - Throws: NSError when cannot fetch the data.
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
    
    
    /// Delete the specified reporting.
    ///
    /// - Parameter rep: the reporting to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func remove(rep: Reporting) -> Bool {
        self.context.delete(rep)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Create and store a new reporting.
    ///
    /// - Parameters:
    ///   - event: the event reported.
    ///   - date: when the event occured.
    /// - Returns: The newly created reporting or nil if something went wrong.
    func add(event : Event, date : Date) -> Reporting? {
        
        let reporting = Reporting(context : self.context, event : event, date : date as NSDate)
        do{
            try context.save()
            return reporting
        }catch {
            return nil
        }
    }
    
    
    /// Store the default events. Called only at first launch.
    ///
    /// - Returns: Bool if successful.
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
    
    
    /// Retrieve all the stored events.
    ///
    /// - Returns: Array of events.
    func findAllEvents() -> [Event]?{
        let request : NSFetchRequest<Event> = Event.fetchRequest()
        do{
            return try self.context.fetch(request)
        
        }catch {
            return nil
        }
}

}

