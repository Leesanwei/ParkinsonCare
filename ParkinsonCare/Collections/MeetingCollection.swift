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
    
    func push(_newMeeting meeting : Meeting) -> Void{
        self.meetings.append(meeting)
    }
    
    func remove(_ meeting : Meeting) -> Void {
        guard let index : Int =  self.meetings.index(of: meeting) else{
            return
        }
        self.meetings.remove(at: index)
    }

}
