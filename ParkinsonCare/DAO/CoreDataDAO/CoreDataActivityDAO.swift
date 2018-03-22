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
    
    func remove(act : Activity) -> Bool {
        self.context.delete(act)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    func add(nameSport: String) -> Bool{
        let activity = Activity(context : context)
        activity.name = nameSport
        do{
            try context.save()
            return true
        }catch{
            return false
        }
        
    }
    
}
