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
    
    func remove(atIndex index : Int) -> Void {
        self.doctors.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Doctor{
        return self.doctors[index]
    }

    func sort(){
        self.doctors = self.doctors.sorted{
            $0.firstName! < $1.firstName!
        }
    }
}
