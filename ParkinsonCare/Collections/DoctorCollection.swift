//
//  DoctorCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class DoctorCollection{
    
    // MARK: - Properties
    private var doctors : [Doctor] = [Doctor]()
    
    // MARK: - Methods
    
    func push(_newDoctor doctor : Doctor) -> Void{
        self.doctors.append(doctor)
    }
    
    func remove(_ Doctor : doctor) -> Void {
        guard let index : Int =  self.doctors.index(of: doctor) else{
            return
        }
        self.doctors.remove(at: index)
    }
    
    func find(_byName name : String) -> Doctor?{
        var i : Int = 0
        var found : Bool = false
        while (i < self.doctors.count && !found ){
            found = self.doctors[i].name == name
            i += 1
        }
        if found{
            return self.doctors[i-1]
        }
        else{
            return nil
        }
    }
}
