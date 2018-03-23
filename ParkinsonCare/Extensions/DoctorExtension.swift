//
//  DoctorExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Doctor{
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, firstName : String, lastName : String, location : String, phoneNumber : String, speciality : Speciality ){
        self.init(context : context)
        self.firstName = firstName
        self.lastName = lastName
        self.location = location
        self.phoneNumber = phoneNumber
        self.speciality = speciality
    }
    
    var e_contact : String {
        get {
            return "\(String(describing: self.phoneNumber)) \(String(describing: self.location))"
        }
    }
    
    var e_fullName : String {
        get {
            return "\(self.firstName!) \(self.lastName!)"
        }
    }
    
    var e_speciality : String {
        get{
            return self.speciality!.name!
        }
    }
    
    
    var e_location : String {
        get{
            return self.location!
        }
    }
    
}
