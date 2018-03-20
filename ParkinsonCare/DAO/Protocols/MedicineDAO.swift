//
//  UserDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol MedicineDAO {
    
    func findAll() throws -> MedicineCollection
    func add(nameMedicine: String, amountMedicine : Int, commentMedicine : String) -> Bool
    func remove(med: Medicine) -> Bool
}
