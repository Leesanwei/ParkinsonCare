//
//  NotificationManager.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 25/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import UserNotifications

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
    
    func scheduleEvaluations(beginDate : DateComponents, minHour : Int, maxHour : Int) -> Bool {
        
        //Define notification content
        let content = UNMutableNotificationContent()
        content.title = "Evaluation"
        content.body = "Comment vous sentez-vous ?"
        content.categoryIdentifier = "evaluationCategory"
        
        var date = beginDate
        date.hour = minHour
        for i in 0..<5{// five days before the meeting
            
            for j in minHour..<maxHour{// number of notifications per day
                
                let trigger = UNCalendarNotificationTrigger(dateMatching : date, repeats : false)

                // Register the j notification of the i day
                let request = UNNotificationRequest(identifier: "evalNotification", content : content, trigger : trigger)
                UNUserNotificationCenter.current().add(request)
                
                date.hour = date.hour! + 1
              
            }
            date.day = date.day! + 1

        }
        
        return true
    }
    
}
