//
//  DoctorManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class DoctorManager{
    
    // MARK : Singleton implemention
    private static let sharedDoctorManager : DoctorManager = DoctorManager()
    private init(){}
    
    static func getInstance() -> DoctorManager{
        return sharedDoctorManager
    }
}
