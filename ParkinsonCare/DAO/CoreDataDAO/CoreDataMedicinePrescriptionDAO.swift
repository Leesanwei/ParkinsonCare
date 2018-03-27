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
    
    
    /// Retrieve all the stored prescriptions.
    ///
    /// - Returns: A collection of medicine prescriptions
    /// - Throws: NSError when cannot fetch the data.
    func findAll() throws -> MedicinePrescriptionCollection{
        let request : NSFetchRequest<MedicinePrescription> = MedicinePrescription.fetchRequest()
        do{
            let medicinePrescripitons = MedicinePrescriptionCollection()
            try medicinePrescripitons.setMedicinePrescriptions(medicinePrescriptions: self.context.fetch(request))
            return medicinePrescripitons
        }catch let error as NSError{
            throw error
        }
    }
    
    
    /// Delete the specified prescription.
    ///
    /// - Parameter mp: the prescription to be deleted.
    /// - Returns: Bool if the deletion was successful.
    func remove(mp : MedicinePrescription) -> Bool {
        self.context.delete(mp)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Create and store a new prescription.
    ///
    /// - Parameters:
    ///   - medicine: the medicine which the prescription is related to.
    ///   - beginDate: cure's beginning date.
    ///   - endDate: cure's end date.
    ///   - matin: Bool true if has a morning take
    ///   - midi: Bool true if has a midday take.
    ///   - soir: Bool true if has an evening take.
    /// - Returns: The newly created prescription or nil if something went wrong
    func add(medicine : Medicine, beginDate : Date, endDate : Date ,matin : Bool, midi : Bool, soir: Bool) -> MedicinePrescription? {
        let medicinePrescription = MedicinePrescription(context : self.context, medicine : medicine, morning : matin, midday : midi, evening : soir, beginDate : beginDate as NSDate, endDate : endDate as NSDate)
        do{
            try context.save()
            return medicinePrescription
        }catch{
            return nil
        }
    }
    
}

