//
//  DoctorExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Doctor{
    
    convenience init(firstName : String, lastName : String, location : String, phoneNumber : String, speciality : Speciality ){
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.location = location
        self.phoneNumber = phoneNumber
        self.speciality = speciality
    }
    
    func getContact() -> String {
        return "\(String(describing: self.phoneNumber)) \(String(describing: self.location))"
    }
    
    func getFullName() -> String {
        return "\(String(describing: self.firstName)) \(String(describing: self.lastName))"
    }
    
    func getSpeciality() -> Speciality {
        return self.speciality!
    }
    
    func getLocation() -> String {
        return self.location!
    }
    
}
