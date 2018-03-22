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
            let doctors = DoctorCollection()
            try doctors.setDoctors(doctors: self.context.fetch(request))
            return doctors
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(doc: Doctor) -> Bool {
        self.context.delete(doc)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    func add(firstName : String, lastName : String, speciality : Speciality, phoneNumber : String, location: String) -> Bool {
        
         let doctor = Doctor(context : self.context, firstName : firstName, lastName : lastName, location : location, phoneNumber : phoneNumber, speciality : speciality)

        do{
            try self.context.save()
            return true
        }catch {
            return false
        }
    }
    
    func findAllSpecialities() -> [Speciality]? {
        let request : NSFetchRequest<Speciality> = Speciality.fetchRequest()
        do{
            return try self.context.fetch(request)
            
        }catch {
            return nil
        }
    }

}
