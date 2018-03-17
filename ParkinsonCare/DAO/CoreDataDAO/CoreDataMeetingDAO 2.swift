//
//  CoreDataMeetingDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataMeetingDAO : MeetingDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> MeetingCollection{
        let request : NSFetchRequest<Meeting> = Meeting.fetchRequest()
        do{
            var meetings = MeetingCollection()
            try meetings.setMeetings(meetings: self.context.fetch(request))
            return meetings
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(meet: Meeting) -> Bool {
        return true
    }
    
    func add(meet: Meeting) -> Bool {
        return true
    }
    
}

