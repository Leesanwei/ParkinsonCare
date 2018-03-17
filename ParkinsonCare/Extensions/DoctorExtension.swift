//
//  DoctorExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Doctor{
    
    func getContact() -> String {
        return "\(String(describing: self.phoneNumber)) \(String(describing: self.location))"
    }
    func getFullName() -> String {
        return "\(String(describing: self.firstName)) \(String(describing: self.lastName))"
    }
    
}
