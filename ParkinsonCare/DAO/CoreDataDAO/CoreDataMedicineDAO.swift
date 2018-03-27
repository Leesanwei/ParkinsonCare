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
    
    
    /// Retrieve all the stored medicines.
    ///
    /// - Returns: A collection of medicines.
    /// - Throws: NSError if couldn't fetch the data.
    func findAll() throws -> MedicineCollection{
        let request : NSFetchRequest<Medicine> = Medicine.fetchRequest()
        do{
            let medicines = MedicineCollection()
            try medicines.setMedicines(medicines: self.context.fetch(request))
            return medicines
        }catch let error as NSError{
            throw error
        }
    }
    
    
    /// Delete the medicine of the storage.
    ///
    /// - Parameter med: medicine to be deleted.
    /// - Returns: Bool true if deletion successful.
    func remove(med: Medicine) -> Bool {
        self.context.delete(med)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Store a new medicine.
    ///
    /// - Parameters:
    ///   - name: name of the new medicine.
    ///   - amount: amount to be taken.
    /// - Returns: Bool true if the storage was successful.
    func add(name: String, amount : String) -> Bool{
        _ = Medicine(context : self.context, name : name, amount : amount)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
        
    }
    
    
    /// Add the default medicines.
    ///
    /// - Returns: Bool if could added the medicines.
    func add() -> Bool{
        let medicines : [[String]] = [["MODOPAR","62,5"],["MODOPAR","125"],["MODOPAR","250"],["MODOPAR LP","125"],["MODOPAR DISPERSIBLE","1255"],["SINEMET","100"],["SINEMET","250"],["SINEMET LP","100"],["SINEMET LP","200"],["STALEVO","50"],["STALEVO","75"],["STALEVO","100"],["STALEVO","125"],["STALEVO","150"],["STALEVO","175"],["STALEVO","200"],["PARLODEL","2,5"],["PARLODEL","5"],["PARLODEL","10"],["TRIVASTAL","20"],["TRIVASTAL LP","50"],["SIFROL","0,18"],["SIFROL","0,7"],["SIFROL LP","0,26"],["SIFROL LP","0,52"],["SIFROL LP","1,05"],["SIFROL LP","2,1"],["REQUIP","0,25"],["REQUIP","0,5"],["REQUIP","1"],["REQUIP","2"],["REQUIP","5"],["REQUIP LP","2"],["REQUIP LP","4"],["REQUIP LP","8"],["NEUPRO (PATCH)","2"],["NEUPRO (PATCH)","4"],["NEUPRO (PATCH)","6"],["NEUPRO (PATCH)","8"],["MANTADIX","100"],["AZILECT","1"],["COMTAN","200"],["ARTANE","2"],["ARTANE","5"],["PARKINANE LP","2"],["PARKINANE LP","5"],["LEPTICUR","10"],["LEPONEX","25"],["LEPONEX","100"],["EXELON","1,5"],["EXELON","3"],["EXELON","4,5"],["EXELON","6"],["EXELON (PATCH)","4,6"],["EXELON (PATCH","9,5"]]
        
        for medicine in medicines {
            let med = Medicine(context : self.context)
            med.name = medicine[0]
            med.amount = medicine[1]
            do{
                try context.save()
                
            }catch {
                return false
            }
            
            
        }
        return true
    }
    
        
    }

