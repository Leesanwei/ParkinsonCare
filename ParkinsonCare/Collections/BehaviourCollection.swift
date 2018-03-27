//
//  BehaviourCollection.swift
//  ParkinsonCare
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class BehaviourCollection{
    
    // MARK: - Properties
    private var behaviours : [Behaviour] = [Behaviour]()
    
    // MARK: - Methods
    
    func setBehaviours(behaviours : [Behaviour]){
        self.behaviours = behaviours
    }
    
    func count() -> Int {
        return self.behaviours.count
    }
    
    func push(_newBehaviour behaviour : Behaviour) -> Void{
        self.behaviours.append(behaviour)
    }
    
    func remove(atIndex index : Int) -> Void {
        self.behaviours.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Behaviour{
        return self.behaviours[index]
    }
    
}

