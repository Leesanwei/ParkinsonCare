//
//  DoctorDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol DoctorDAO {
    
    func findAll() throws -> DoctorCollection
    func add(firstName : String, lastName : String, speciality : Speciality, phoneNumber : String, location : String) -> Bool
    func remove(doc : Doctor) -> Bool
}
