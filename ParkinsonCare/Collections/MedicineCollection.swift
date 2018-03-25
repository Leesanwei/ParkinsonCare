//
//  MedicineCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class MedicineCollection{
    
    // MARK: - Properties
    private var medicines : [Medicine] = [Medicine]()
    
    
    // MARK: - Methods
    
    func setMedicines(medicines : [Medicine]){
        self.medicines = medicines
    }
    
    func count() -> Int {
        return self.medicines.count
    }
    
    func push(_newMedicine medicine : Medicine) -> Void{
         self.medicines.append(medicine)
    }
    
    func remove(atIndex index : Int) -> Void {
        self.medicines.remove(at: index)
    }
    func find(_byIndex index : Int) -> Medicine{
        return self.medicines[index]
    }
    
    func sort(){
        self.medicines = self.medicines.sorted{
            $0.name! < $1.name!
        }
    }
}
