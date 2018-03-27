//
//  NotificationManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 25/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class NotificationManager{
   
    // MARK: - Singleton Implementation
    
    private static let notificationManager : NotificationManager = NotificationManager()
    
    private init(){}
    
    static func getInstance() -> NotificationManager{
        return notificationManager
    }
    
    
    /// Register the notification.
    ///
    /// - Parameters:
    ///   - content: Content of the notifiction.
    ///   - trigger: fire moment description.
    ///   - identifier: of the notification.
    private func pushNotification(content : UNNotificationContent, trigger : UNNotificationTrigger, identifier : String){
        
        let request = UNNotificationRequest(identifier: "\(identifier)\(NSUUID().uuidString)", content : content, trigger : trigger)
        UNUserNotificationCenter.current().add(request){ (error) in
            if error != nil {
                print("error \(String(describing: error))")
            }
        }
        
    }
    
    /// Schedule all the reminders of all a newly created activity.
    ///
    /// - Parameter activity: activity newly created.
    func scheduleActivityReminder(activity : Activity){
        
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Avez-vous pratiquez cette activité ?"
        let hour = activity.e_duration / 60
        let minute = activity.e_duration - hour * 60
        content.body = "\(activity.e_name) pendant \(hour) heure(s)  et \(minute) minute(s)"
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "activityCategory"
        
        if activity.isAMondayActivity {
            let monday = DateComponents(hour :18, minute:30, weekday: 2)
            let trigger = UNCalendarNotificationTrigger(dateMatching: monday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "mondayActivityReminderNotification")
        }
        if activity.isATuesdayActivity {
            let tuesday = DateComponents(hour :18, minute:30, weekday: 3)
            let trigger = UNCalendarNotificationTrigger(dateMatching: tuesday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "tuesdayActivityreminderNotification")
        }
        if activity.isAWednesdayActivity {
            let wednesday = DateComponents(hour :18, minute:30, weekday: 4)
            let trigger = UNCalendarNotificationTrigger(dateMatching: wednesday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "wednesdayActivityReminderNotification")
        }
        if activity.isAThursdayActivity {
            let thursday = DateComponents(hour :18, minute:30, weekday: 5)
            let trigger = UNCalendarNotificationTrigger(dateMatching: thursday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "thursdayActivityReminderNotification")
        }
        if activity.isAFridayActivity {
            let friday = DateComponents(hour :18, minute:30, weekday: 6)
            let trigger = UNCalendarNotificationTrigger(dateMatching: friday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "fridayActivityReminderNotification")
        }
        if activity.isASaturdayActivity {
            let saturday = DateComponents(hour :18, minute:30, weekday: 7)
            let trigger = UNCalendarNotificationTrigger(dateMatching: saturday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "saturdayActivityReminderNotification")
        }
        if activity.isASundayActivity {
            let sunday = DateComponents(hour :18, minute:30, weekday: 1)
            let trigger = UNCalendarNotificationTrigger(dateMatching: sunday, repeats: true)
            self.pushNotification(content: content, trigger: trigger, identifier: "sundayActivityReminderNotification")
        }
    }
    
    // MARK: - Meeting
 
    
    /// Schedule all the evaluations during the five previous days of the specified meeting.
    ///
    /// - Parameters:
    ///   - meeting: Meeting needing evaluations.
    ///   - minHour: minimum hour to begin the evaluations.
    ///   - maxHour: maximum hour to make evaluations.
    /// - Returns: Bool true if the evaluations are scheduled.
    func scheduleEvaluations(meeting : Meeting, minHour : Int, maxHour : Int) -> Bool {
        
        //Define notification content
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Evaluation de votre état."
        content.body = "Comment vous sentez-vous ?"
        content.categoryIdentifier = "evaluationCategory"
        content.sound = UNNotificationSound.default()

        let meetingDate = meeting.e_date as Date
        if meetingDate.timeIntervalSinceNow <= 5 * 24 * 60 * 60{
            // Case where we can't schedule notification five days before.
            // Meeting is in less than five days
            return false
        }
        // Start the notification five days before the meeting at minHour
        guard let beginDay : Date =  Calendar.current.date(byAdding: .day, value: -5, to: meetingDate) else{
            print("Cannot remove 5 days")
            return false
        }
        // Get the number of seconds until the first evaluation.
        let beginTimeInterval = NSCalendar.current.startOfDay(for: beginDay).timeIntervalSinceNow
        
        // Schedule notifications related to a meeting (evaluation and reminder)
        for i in 0..<5{// schedule notification for the five days
            
            // timeInterval to the current day we are scheduling the notifications at minHour.
            let timeInterval = beginTimeInterval + Double(i * 24 * 60 * 60 + minHour * 60 * 60)
            
            for j in minHour..<(maxHour + 15){// schedule one notification per hour.

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval + Double(j * 60), repeats:false)
                
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "evalNotification")
            }
        }
        return true
    }
    
    
    /// Schedule a reminder of the specified meeting with its delay.
    ///
    /// - Parameters:
    ///   - meeting: meeting to be reminded.
    ///   - delay: necessary time to be prepared and arrive on time at the meeting.
    ///   - description: description of the meeting.
    /// - Returns: Bool true if the meeting is scheduled.
    func scheduleMeetingDelayReminder(meeting : Meeting, delay : Int, description : String) -> Bool{
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Il est temps de partir!"
        content.body = "\(description)"
        content.sound = UNNotificationSound.default()

        // Check if delay is note before current date.
        if meeting.e_date.timeIntervalSinceNow - Double(60 * delay) <= 0 {
            return false
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (meeting.e_date.timeIntervalSinceNow - Double(60 * delay)) , repeats:false)

        // Register the notification
        self.pushNotification(content: content, trigger: trigger, identifier: "meetingRemindNotification")
        return true
    }
    
    // MARK: - Medicine
    
    
    /// Schedule notifications related to a medicine take.
    ///
    /// - Parameter medicinePrescription: the prescription that we schedule reminders for.
    func scheduleMedicineTakeNotifications(medicinePrescription : MedicinePrescription){
        // Set the content of the notification
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Prise de médicament."
        content.body = "Il est temps de prendre un \(medicinePrescription.e_medicine.fullDescription)."
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "medicineCategory"
        // Get the end time interval of the prescription.
        let endTimeInterval = medicinePrescription.e_endDate.timeIntervalSince1970
        // Start the counter at midnight the first day
        var i = NSCalendar.current.startOfDay(for: medicinePrescription.e_beginDate as Date).timeIntervalSince1970
        
        while i <= endTimeInterval{// schedule notification for the five days
            
            // Forward time until 8 AM
            i  = i + 8 * 60 * 60
            if medicinePrescription.hasMorningTake{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: i, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "morningTakeNotification")
            }
            // Forward until 1 PM
            i = i + 4 * 60 * 60
            if medicinePrescription.hasMiddayTake{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: i, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "noonTakeNotification")
            }
            // forward until 8 PM
            i = i + 7 * 60 * 60
            if medicinePrescription.hasEveningTake{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: i, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "eveningTakeNotification")
            }
            // Forward until midnight the day after.
            i = i + 4 * 60 * 60
        }
    }
    
    // MARK: - Action Methods -
    
    
    /// Handle the logic of all notification actions.
    ///
    /// - Parameter response: Response of the action that has been responded tp.
    func handleResponse(response : UNNotificationResponse){
        switch response.actionIdentifier{
        // Medicine take actions
        case "POSTPONE": self.postponeMedicineTake(response: response); break
        case "VALIDATE": self.validateMedicineTake(); break
        //Evaluation actions
        case "ON": self.addEvaluation(state: "On"); break
        case "OFF": self.addEvaluation(state: "Off"); break
        case "DYSKINESIE": self.addEvaluation(state: "Dyskinesie"); break
        case "DID" : self.activityHasBeenPerformed(); break
        case "DIDNOT" : self.activityHasNotBeenPerformed(); break
        default: print("Unknown Action")
        }
    }
    
    
    /// Postpone the medicine take by shceduling a new notification 5 minutes later.
    ///
    /// - Parameter response: <#response description#>
    private func postponeMedicineTake(response : UNNotificationResponse){
        let content : UNNotificationContent = response.notification.request.content
        let trigger : UNTimeIntervalNotificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval : Double(30 * 5), repeats : false)
        self.pushNotification(content: content, trigger: trigger, identifier: "postponeMedicineTake")
    }
    
    // Handle medicine take
    private func validateMedicineTake(){
        print("Medicine taken.")
    }
    
    
    /// Register the evaluation to its synthesis.
    ///
    /// - Parameter state: <#state description#>
    private func addEvaluation(state : String){
        if PersistenceFacade.getInstance().registerEvaluation(state : state){
            print("Evaluation registered")
        }else{
            print("Unable to register the evaluation")
        }
    }
    
    
    
    /// Congrats the user because he has performed an activity.
    /// congratulations are made by firing a notification.
    private func activityHasBeenPerformed(){
        let congratulations = [
            "Nous sommes fiers de vous! Continuez comme ça! :)",
            "Bravo! Quel courage?! x)",
            "Félicitations! C'est n'était pas facile! :-)",
            "Wahou! Encore un défi relevé haut la main! ^^"
        ]
        
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Felicitations!"
        content.body = congratulations[Int(arc4random_uniform(UInt32(congratulations.count)))]
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats:false)
        self.pushNotification(content: content, trigger: trigger, identifier: "congratNotification")
    }
    
    // Activity has not been performed action.
    private func activityHasNotBeenPerformed(){
        print("Dommage! La prochaine fois peut-être!")
    }
    
}
