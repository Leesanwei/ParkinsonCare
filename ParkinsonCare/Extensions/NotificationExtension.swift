//
//  NotificationExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData
import UserNotifications

extension Notification {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, type : TypeNotification, date : NSDate){
        self.init(context : context)
        self.typeNotification = type
        self.answered = false
    }
    
    // MARK: - Properties -
    var e_typeNotification : TypeNotification {
        get{
            return self.typeNotification!
        }
    }
    
    var hasBeenAnswered : Bool {
        get{
            return self.answered
        }
    }
    
    // MARK: - Methods
    
    func makeAsAnswered() -> Void{
        self.answered = true
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
}
