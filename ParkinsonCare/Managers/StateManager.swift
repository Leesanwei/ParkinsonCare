//
//  StateManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class StateManager{
    
    // MARK: Singleton implemention
    private static let sharedStateManager : StateManager = StateManager()
    private init(){}
    
    static func getInstance() -> StateManager{
        return sharedStateManager
    }
}
