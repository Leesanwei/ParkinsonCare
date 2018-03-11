//
//  MedicineManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class MedicineManager {
    
    // MARK : Singleton implemention
    private static let sharedMedicineManager : MedicineManager = MedicineManager()
    private init(){}
    
    static func getInstance() -> MedicineManager{
        return sharedMedicineManager
    }
}
