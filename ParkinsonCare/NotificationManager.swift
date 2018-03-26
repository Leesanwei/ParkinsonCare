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
        
        for i in 0..<5{// schedule notification for the five days
            guard var date : Date = Calendar.current.date(byAdding: .day, value: i, to: beginDate) else{
                return false
            }
            for _ in minHour..<maxHour{// schedule one notification per hour.
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats:false)
                print(date.timeIntervalSinceNow)
                // Register the current notification
                let request = UNNotificationRequest(identifier: "evalNotification\(NSUUID().uuidString)", content : content, trigger : trigger)
                UNUserNotificationCenter.current().add(request){ (error) in
                    if error != nil {
                        print("error \(String(describing: error))")
                    }
                }
                
                guard let d : Date = Calendar.current.date(byAdding: .hour, value: 1, to: date) else{
                    return false
                }
                date = d
            }
        }
        return true
    }
    
    func scheduleMeetingDelayReminder(meetingDate : Date, delay : Int, description : String){
        let content = UNMutableNotificationContent()
        content.title = "ParkinsonCare"
        content.subtitle = "Il est temps de partir!"
        content.body = "\(description)"
        content.sound = UNNotificationSound.default()

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (meetingDate.timeIntervalSinceNow - Double(60 * delay)) , repeats:false)

        // Register the notification
        let request = UNNotificationRequest(identifier: "evalNotification\(NSUUID().uuidString)", content : content, trigger : trigger)
        UNUserNotificationCenter.current().add(request){ (error) in
            if error != nil {
                print("error \(String(describing: error))")
            }
        }
    }
    
}
