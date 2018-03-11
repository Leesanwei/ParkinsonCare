//
//  MedicineCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class MedicineCollection{
    
    // MARK: - Properties
    private var medicines : [Medicine] = [Medicine]()
    
    // MARK: - Methods
    
    func push(_newMedicine medicine : Medicine) -> Void{
         self.medicines.append(medicine)
    }
    
    func remove(_ medicine : Medicine) -> Void {
        guard let index : Int =  self.medicines.index(of: medicine) else{
            return
        }
        self.medicines.remove(at: index)
    }
    
    func find(_byName name : String) -> Medicine?{
        var i : Int = 0
        var found : Bool = false
        while (i < self.medicines.count && !found ){
            found = self.medicines[i].name == name
            i += 1
        }
        if found{
            return self.medicines[i-1]
        }
        else{
            return nil
        }
    }
}
