//
//  CoreDataDoctorDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDoctorDAO : DoctorDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> DoctorCollection{
        let request : NSFetchRequest<Doctor> = Doctor.fetchRequest()
        do{
            var doctors = DoctorCollection()
            try doctors.setDoctors(doctors: self.context.fetch(request))
            return doctors
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(doc: Doctor) -> Bool {
        return true
    }
    
    func add(doc: Doctor) -> Bool {
        return true
    }
    
}
