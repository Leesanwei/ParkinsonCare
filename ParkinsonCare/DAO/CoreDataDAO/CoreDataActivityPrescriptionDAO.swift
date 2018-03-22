//
//  CoreDataActivityPrescriptionDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataActivityPrescriptionDAO : ActivityPrescriptionDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> ActivityPrescriptionCollection{
        let request : NSFetchRequest<ActivityPrescription> = ActivityPrescription.fetchRequest()
        do{
            var activityPrescriptions = ActivityPrescriptionCollection()
            try activityPrescriptions.setActivityPrescriptions(activityPrescriptions: self.context.fetch(request))
            return activityPrescriptions
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(ap : ActivityPrescription) -> Bool {
        self.context.delete(ap)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    func add(ap: ActivityPrescription) -> Bool {
        return true
    }
    
}

