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
    
    func push(_newActivity activity : Activity) -> Void{
        self.activities.append(activity)
    }
    
    func remove(_ activity : Activity) -> Void {
        guard let index : Int =  self.activities.index(of: activity) else{
            return
        }
        self.activities.remove(at: index)
    }
    
    func find(_byName name : String) -> Activity?{
        var i : Int = 0
        var found : Bool = false
        while (i < self.activities.count && !found ){
            found = self.activities[i].name == name
            i += 1
        }
        if found{
            return self.activities[i-1]
        }
        else{
            return nil
        }
    }
}
