//
//  ActivityPrescriptionCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class ActivityPrescriptionCollection{
    
    // MARK: - Properties
    private var activityPrescriptions : [ActivityPrescription] = [ActivityPrescription]()
    
    
    // MARK: - Methods
    
    func setActivityPrescriptions(activityPrescriptions : [ActivityPrescription]){
        self.activityPrescriptions = activityPrescriptions
    }
    
    func count() -> Int {
        return self.activityPrescriptions.count
    }
    
    func push(_newActivityPrescription activityPrescription : ActivityPrescription) -> Void{
        self.activityPrescriptions.append(activityPrescription)
    }
    
    func remove(_ activityPrescription : ActivityPrescription) -> Void {
        guard let index : Int =  self.activityPrescriptions.index(of: activityPrescription) else{
            return
        }
        self.activityPrescriptions.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> ActivityPrescription{
        return self.activityPrescriptions[index]
    }
}
