//
//  ActivityManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class ActivityManager{
    
    // MARK: Singleton implemention
    private static let sharedActivityManager : ActivityManager = ActivityManager()
    private init(){}
    
    static func getInstance() -> ActivityManager{
        return sharedActivityManager
    }
}
