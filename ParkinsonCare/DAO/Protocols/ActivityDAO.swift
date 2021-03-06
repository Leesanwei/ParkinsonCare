//
//  ActivityDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol ActivityDAO {
    
    func findAll() throws -> ActivityCollection
    func add(nameSport: String, duration : Int, days : [Bool]) -> Activity?
    func remove(act : Activity) -> Bool
}
