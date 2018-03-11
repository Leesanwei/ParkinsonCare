//
//  CollectionFactory.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class CollectionFactory {
    
    // MARK: Singleton implementation
    private static let sharedCollectionFactory : CollectionFactory = CollectionFactory()
    private init(){}
    
    static func getInstance() -> CollectionFactory {
            return sharedCollectionFactory
    }
    
    // MARK: - Methods
    
    // Build the Medicine Collection
    func getMedicineCollection() -> MedicineCollection{
        return MedicineCollection.getInstance()
    }
    
    //Build the Activity Collection
    func getActivityCollection() -> ActivityCollection{
        return ActivityCollection.getInstance()
    }
    
    //Build the Meeting Collection
    func getMeetingCollection() -> MeetingCollection{
        return MeetingCollection.getInstance()
    }
    
    //Build the Activity Collection
    func getStateCollection() -> StateCollection{
        return StateCollection.getInstance()
    }
    
    //Build the Doctor Collection
    func getDoctorCollection() -> DoctorCollection{
        return DoctorCollection.getInstance()
    }
}
