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
    
    
    /// Retrieve all the stored meetings.
    ///
    /// - Returns: A collection of meetings.
    /// - Throws: NSError when cannot fetch the data.
    func findAll() throws -> MeetingCollection{
        let request : NSFetchRequest<Meeting> = Meeting.fetchRequest()
        do{
            let meetings = MeetingCollection()
            try meetings.setMeetings(meetings: self.context.fetch(request))
            return meetings
        }catch let error as NSError{
            throw error
        }
    }
    
    
    /// Delete the specified meeting.
    ///
    /// - Parameter meet: meeting to be deleted
    /// - Returns: Bool true if the deletion was successful.
    func remove(meet: Meeting) -> Bool {
        self.context.delete(meet)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Create and store a new meeting.
    ///
    /// - Parameters:
    ///   - doctor: with who the meeting is.
    ///   - date: date of the meeting.
    ///   - delay: necessary time to prepare and arrive on time at the meeting.
    /// - Returns: The newly created meeting or nil if something went wrong.
    func add(doctor : Doctor, date : Date, delay : Int) -> Meeting? {
       let meeting = Meeting(context : self.context,doctor : doctor, date : date as NSDate, delay : delay)
        _ = Synthesis(context : self.context, meeting : meeting)
        
        do{
            try context.save()
            return meeting
        }catch {
            return nil
        }
    }
    
}

