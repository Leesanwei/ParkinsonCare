//
//  MeetingCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class MeetingCollection{
    
    // MARK: - Properties
    private var meetings : [Meeting] = [Meeting]()
    
    // MARK: - Methods
    
    func setMeetings(meetings : [Meeting]){
        self.meetings = meetings
    }
    
    func count() -> Int {
        return self.meetings.count
    }
    
    func push(_newMeeting meeting : Meeting) -> Void{
        self.meetings.append(meeting)
    }
    
    func remove(atIndex index : Int) -> Void {
        self.meetings.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Meeting{
        return self.meetings[index]
    }

}
