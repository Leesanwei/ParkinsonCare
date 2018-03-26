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
    
    // MARK: - Notification Actions
    
    func handleResponse(response : UNNotificationResponse){
        switch response.actionIdentifier{
            // Medicine take actions
        case "POSTPONE": print("Postpone"); break
        case "VALIDATE": print("validate"); break
            //Evaluation actions
        case "ON": print("on"); break
        case "OFF": print("off"); break
        case "DYSKINESIE": print("dys"); break
    
        default: print("Unknown Action")
        }
    }
    
    private func pushNotification(content : UNNotificationContent, trigger : UNTimeIntervalNotificationTrigger, identifier : String){
        
        let request = UNNotificationRequest(identifier: "\(identifier)\(NSUUID().uuidString)", content : content, trigger : trigger)
        UNUserNotificationCenter.current().add(request){ (error) in
            if error != nil {
                print("error \(String(describing: error))")
            }
        }
        
    }
    func programActivityReminder(frequency : Int, activity : String){
        
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Sport!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Il est temps d'effectuer votre activite:" + activity,arguments: nil)
        
        // Configure the trigger for a 7am wakeup.
        var dateInfo = DateComponents()
        dateInfo.hour = 18
        dateInfo.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
    }
 
    func scheduleEvaluations(meetingDate : Date, minHour : Int, maxHour : Int) -> Bool {
        
        //Define notification content
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Evaluation de votre état."
        content.body = "Comment vous sentez-vous ?"
        content.categoryIdentifier = "evaluationCategory"
        content.sound = UNNotificationSound.default()

        if meetingDate.timeIntervalSinceNow <= 5 * 24 * 60 * 60{
            // Case where we can't schedule notification five days before.
            // Meeting is in less than five days
            return false
        }
        // Start the notification five days before the meeting at minHour
        guard let beginDay : Date =  Calendar.current.date(byAdding: .day, value: -5, to: meetingDate) else{
            return false
        }
        guard let beginDate : Date = Calendar.current.date(byAdding: .hour, value: minHour, to: beginDay) else{
            return false
        }
        
        // MARK: - Meeting
        // Schedule notifications related to a meeting (evaluation and reminder)
        
        for i in 0..<5{// schedule notification for the five days
            guard var date : Date = Calendar.current.date(byAdding: .day, value: i, to: beginDate) else{
                return false
            }
            for _ in minHour..<maxHour{// schedule one notification per hour.
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "evalNotification")
                
                guard let d : Date = Calendar.current.date(byAdding: .hour, value: 1, to: date) else{
                    return false
                }
                date = d
            }
        }
        return true
    }
    
    func scheduleMeetingDelayReminder(meetingDate : Date, delay : Int, description : String) -> Bool{
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Il est temps de partir!"
        content.body = "\(description)"
        content.sound = UNNotificationSound.default()

        if meetingDate.timeIntervalSinceNow - Double(60 * delay) <= 0 {
            return false
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (meetingDate.timeIntervalSinceNow - Double(60 * delay)) , repeats:false)

        // Register the notification
        self.pushNotification(content: content, trigger: trigger, identifier: "meetingRemindNotification")
        return true
    }
    
    // MARK: - Medicine
    // Schedule notifications related to a meeting.
    func scheduleMedicineTakeNotifications(beginDate: Date, description :String, endDate : Date, morning : Bool, noon:Bool, evening: Bool){
        // Set the content of the notification
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Prise de médicament."
        content.body = "Il est temps de prendre un \(description)."
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "medicineCategory"
        // Get the end time interval of the prescription.
        let endTimeInterval = endDate.timeIntervalSince1970
        // Start the counter at midnight the first day
        var i = NSCalendar.current.startOfDay(for: beginDate).timeIntervalSince1970
        
        while i <= endTimeInterval{// schedule notification for the five days
            
            // Forward time until 8 AM
            i  = i + 8 * 60 * 60
            if morning{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: i, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "morningTakeNotification")
            }
            // Forward until 1 PM
            i = i + 4 * 60 * 60
            if noon{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: i, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "noonTakeNotification")
            }
            // forward until 8 PM
            i = i + 7 * 60 * 60
            if evening{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: i, repeats:false)
                // Register the current notification
                self.pushNotification(content: content, trigger: trigger, identifier: "eveningTakeNotification")
            }
            // Forward until midnight the day after.
            i = i + 4 * 60 * 60
        }
    }
    
}
