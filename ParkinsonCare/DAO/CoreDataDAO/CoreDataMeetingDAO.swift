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
            let meetings = MeetingCollection()
            try meetings.setMeetings(meetings: self.context.fetch(request))
            return meetings
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(meet: Meeting) -> Bool {
        self.context.delete(meet)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    func add(doctor : Doctor, date : Date, delay : Int) -> Bool {
        let evaluations = EvaluationCollection()
        
       let meeting = Meeting(context : self.context,doctor : doctor, date : date as NSDate, delay : delay, evaluations: evaluations)
        
        do{
            try context.save()
            print(meeting.date)
           
        }catch {
            print(doctor.firstName)
            return false
    }
         return true
    }
    
}

