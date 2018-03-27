//
//  CoreDataBehaviourDAO.swift
//  ParkinsonCare
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataBehaviourDAO : BehaviourDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
}
    
    /// Retrieve all the rstored behaviours.
    ///
    /// - Returns: A collection of behaviours.
    /// - Throws: NSError when cannot fetch the data.
    func findAll() throws -> BehaviourCollection{
        let request : NSFetchRequest<Behaviour> = Behaviour.fetchRequest()
        do{
            let behaviours = BehaviourCollection()
            try behaviours.setBehaviours(behaviours: self.context.fetch(request))
            return behaviours
        }catch let error as NSError{
            throw error
        }
    }
    
    /// Create and store a new behaviour.
    ///
    /// - Parameters:
    ///   - behaviourDescription: the behaviour reported.
    ///   - date: when the behaviour occured.
    /// - Returns: The newly created behaviour or nil if something went wrong.
    func add(behaviourDescription : String, date : Date) -> Behaviour?{
        let behaviour = Behaviour(context : self.context, description : behaviourDescription, date : date as NSDate)
        do{
            try context.save()
            return behaviour
        }catch {
            return nil
        }
        
    }
    
    /// Delete the specified behaviour.
    ///
    /// - Parameter rep: the behaviour to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func remove(bev: Behaviour) -> Bool {
        self.context.delete(bev)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
}
