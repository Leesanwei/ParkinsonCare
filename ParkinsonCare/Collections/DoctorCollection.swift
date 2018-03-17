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
    
    func setDoctors(doctors : [Doctor]){
        self.doctors = doctors
    }
    
    func count() -> Int {
        return self.doctors.count
    }
    
    func push(_newDoctor doctor : Doctor) -> Void{
        self.doctors.append(doctor)
    }
    
    func remove(_ doctor : Doctor) -> Void {
        guard let index : Int =  self.doctors.index(of: doctor) else{
            return
        }
        self.doctors.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Doctor{
        return self.doctors[index]
    }

}
