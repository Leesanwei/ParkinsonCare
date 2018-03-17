//
//  ActivityCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class ActivityCollection{
    
    // MARK: - Properties
    private var activities : [Activity] = [Activity]()
    
    // MARK: - Methods
    
    func setActivities(activities : [Activity]){
        self.activities = activities
    }
    
    func count() -> Int {
        return self.activities.count
    }
    
    func push(_newActivity activity : Activity) -> Void{
        self.activities.append(activity)
    }
    
    func remove(_ activity : Activity) -> Void {
        guard let index : Int =  self.activities.index(of: activity) else{
            return
        }
        self.activities.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Activity{
        return self.activities[index]
    }


}
