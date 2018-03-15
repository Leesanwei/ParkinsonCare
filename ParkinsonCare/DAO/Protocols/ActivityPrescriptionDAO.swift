//
//  ActivityPrescriptionDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol ActivityPrescriptionDAO {
    
    func findAll() throws -> ActivityPrescriptionCollection
    func add(ap : ActivityPrescription) -> Bool
    func remove(ap : ActivityPrescription) -> Bool
}
