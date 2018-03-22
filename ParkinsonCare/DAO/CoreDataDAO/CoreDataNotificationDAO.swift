//
//  CoreDataUserDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataNotificationDAO : NotificationDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func findAll() throws -> NotificationCollection{
        let request : NSFetchRequest<Notification> = Notification.fetchRequest()
        do{
            let notifications = NotificationCollection()
            try notifications.setNotifications(notifications: self.context.fetch(request))
            return notifications
        }catch let error as NSError{
            throw error
        }
    }
    
    func remove(notif: Notification) -> Bool {
        return true
    }
    
    func add(notif: Notification) -> Bool {
        return true
    }
    
}

