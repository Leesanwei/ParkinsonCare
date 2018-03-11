//
//  ManagerFactory.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class ManagerFactory {
    
    // MARK: Singleton implementation
    private static let sharedManagerFactory : ManagerFactory = ManagerFactory()
    private init(){}
    
    static func getInstance() -> ManagerFactory {
            return sharedManagerFactory
    }
    
    // MARK: - Methods
    
    // Build the Medicine Manager
    func getMedicineManager() -> MedicineManager{
        return MedicineManager.getInstance()
    }
    
    //Build the Activity Manager
    func getActivityManager() -> ActivityManager{
        return ActivityManager.getInstance()
    }
    
    //Build the Meeting Manager
    func getMeetingManager() -> MeetingManager{
        return MeetingManager.getInstance()
    }
    
    //Build the Activity Manager
    func getStateManager() -> StateManager{
        return StateManager.getInstance()
    }
    
    //Build the Doctor Manager
    func getDoctorManager() -> DoctorManager{
        return DoctorManager.getInstance()
    }
}
