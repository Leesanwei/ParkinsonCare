//
//  MeetingManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class MeetingManager{
    
    // MARK : Singleton implemention
    private static let sharedMeetingManager : MeetingManager = MeetingManager()
    private init(){}
    
    static func getInstance() -> MeetingManager{
        return sharedMeetingManager
    }
}
