//
//  CoreDataMedicinePrescriptionDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataMedicinePrescriptionDAO : MedicinePrescriptionDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> MedicinePrescriptionCollection{
        let request : NSFetchRequest<MedicinePrescription> = MedicinePrescription.fetchRequest()
        do{
            var medicinePrescripitons = MedicinePrescriptionCollection()
            try medicinePrescripitons.setMedicinePrescriptions(medicinePrescriptions: self.context.fetch(request))
            return medicinePrescripitons
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(mp: MedicinePrescription) -> Bool {
        return true
    }
    
    func add(mp: MedicinePrescription) -> Bool {
        return true
    }
    
}

