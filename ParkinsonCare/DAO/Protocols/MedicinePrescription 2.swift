//
//  MedicinePrescription.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol MedicinePrescriptionDAO {
    
    func findAll() throws -> MedicinePrescriptionCollection
    func add(mp : MedicinePrescription) -> Bool
    func remove(mp : MedicinePrescription) -> Bool
}
