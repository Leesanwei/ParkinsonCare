//
//  CoreDataUserDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataMedicineDAO : MedicineDAO{

    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> MedicineCollection{
        let request : NSFetchRequest<Medicine> = Medicine.fetchRequest()
        do{
            var medicines = MedicineCollection()
            try medicines.setMedicines(medicines: self.context.fetch(request))
            return medicines
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(med: Medicine) -> Bool {
        return true
    }
    
    func add(name: String, amount : Int, comment : String) -> Bool{
        let medicine = Medicine(context : self.context, name : name, amount : amount, comment : comment)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
        
    }
    
}
