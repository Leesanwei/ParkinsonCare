//
//  CollectionFactory.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class CollectionFactory{
    
    // MARK: Singleton implementation
    private static let sharedCollectionFactory : CollectionFactory = CollectionFactory()
    private init(){}
    
    static func getInstance() -> CollectionFactory {
        return sharedCollectionFactory
    }
    
    // MARK: - Methods
    
    // Build the Medicine Collection
    func getMedicineCollection() -> MedicineCollection{
        return MedicineCollection()
    }
    
    //Build the Activity Collection
    func getActivityCollection() -> ActivityCollection{
        return ActivityCollection()
    }
    
    //Build the Meeting Collection
    func getMeetingCollection() -> MeetingCollection{
        return MeetingCollection()
    }
    
    //Build the Doctor Collection
    func getDoctorCollection() -> DoctorCollection{
        return DoctorCollection()
    }
}

