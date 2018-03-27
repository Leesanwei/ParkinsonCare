//
//  CoreDataActivityDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataActivityDAO : ActivityDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    
    /// Retrieve all the stored activities.
    ///
    /// - Returns: A colelction of activities.
    /// - Throws: NSError when cannot fetch the data.
    func findAll() throws -> ActivityCollection{
        let request : NSFetchRequest<Activity> = Activity.fetchRequest()
        do{
            let activities = ActivityCollection()
            try activities.setActivities(activities: self.context.fetch(request))
            return activities
        }catch let error as NSError{
            throw error
        }
    }
    
    
    /// Delete the specified activity.
    ///
    /// - Parameter act: activity to be deleted.
    /// - Returns: Bool if the deletion was successful.
    func remove(act : Activity) -> Bool {
        self.context.delete(act)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Create and store a new activity.
    ///
    /// - Parameters:
    ///   - nameSport: name of the activity.
    ///   - duration: how long it should be practiced.
    ///   - days: array of Bool to define when it should be practiced.
    /// - Returns: The newly created activity or nil if something went wrong.
    func add(nameSport: String, duration : Int, days : [Bool]) -> Activity?{
        let activity = Activity(context : self.context, name : nameSport, duration : duration, days : days)
        do{
            try context.save()
            return activity
        }catch{
            return nil
        }
        
    }
    
}
