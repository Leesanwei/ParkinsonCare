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
            var activities = ActivityCollection()
            try activities.setActivities(activities: self.context.fetch(request))
            return activities
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(act: Activity) -> Bool {
        return true
    }
    
    func add(act: Activity) -> Bool {
        return true
    }
    
}
