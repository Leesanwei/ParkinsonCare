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
    
    /// retrieve all the stored doctors.
    ///
    /// - Returns: doctorCollection.
    /// - Throws: NSError when cannot fetch the data.
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
    
    
    /// Remove the specified doctor of the storage.
    ///
    /// - Parameter doc: doctor to be deleted.
    /// - Returns: Bool if deletion is successful.
    func remove(doc: Doctor) -> Bool {
        self.context.delete(doc)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Add a new doctor to the storage.
    ///
    /// - Parameters:
    ///   - firstName: first name of the new doctor.
    ///   - lastName: last name of the new doctor.
    ///   - speciality: speciality of the new doctor.
    ///   - phoneNumber: his phone number.
    ///   - location: his location for the meetings.
    /// - Returns: The newly created and stored doctor or nil of something went wrong.
    func add(firstName : String, lastName : String, speciality : Speciality, phoneNumber : String, location: String) -> Doctor? {
        
         let doctor = Doctor(context : self.context, firstName : firstName, lastName : lastName, location : location, phoneNumber : phoneNumber, speciality : speciality)

        do{
            try self.context.save()
            return doctor
        }catch {
            return nil
        }
    }
    
    
    /// Retrieve all the stored specialities.
    ///
    /// - Returns: A collection of specialities.
    func findAllSpecialities() -> [Speciality]? {
        let request : NSFetchRequest<Speciality> = Speciality.fetchRequest()
        do{
            return try self.context.fetch(request)
            
        }catch {
            return nil
        }
    }
    
    
    /// Store the default Specialities. Called only at first launch.
    ///
    /// - Returns: bool id success.
    func addSpecialities() -> Bool{
    
        let specialities : [String] = ["Kinésithérapeute","Orthophoniste","Infirmier","Psychologue Clinicien","Neuropsychologue","Ergothérapeute","Psychomotricien","Pédicure-podologue","Diététicien(ne)","Neurologue","Medecin Generaliste","Psychiatre","Neurochirurgien","Médecin de structure antidouleur","Gériatre","Médecin spécialiste en médecine","Orthoptiste","Physique","Gastro-entérologue","Urologue, Gynécologue, Sexologue","Ophtalmologiste","ORL-phoniatre","Rhumatologue","Chirurgien","Orthopédique","Pneumologue","Cardiologue","Médecin du travail","Chirurgien-Dentiste","Assistant de service social","Personnels de transport sanitaire","Personnels de soins infirmiers à domicile","Personnels des services d’aide à domicile","Personnels des services d’aide à la personne","Personnels de coordination gérontologique","Maisons départementales des personnes handicapées", "Educateur médico-sportif","Associations de patients"]
        
        
        
        for speciality in specialities {
            let spec = Speciality(context : self.context)
            spec.name = speciality
            do{
                try context.save()
                
            }catch {
                return false
            }
            
        
        }
        return true
    }
}
