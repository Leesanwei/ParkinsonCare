//
//  NotificationCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class NotificationCollection{
    
    // MARK: - Properties
    private var notifications : [Notification] = [Notification]()
    
    // MARK: - Methods
    
    func push(_newNotification notification : Notification) -> Void{
        self.notifications.append(notification)
    }
    
    func remove(_ notification : Notification) -> Void {
        guard let index : Int =  self.notifications.index(of: notification) else{
            return
        }
        self.notifications.remove(at: index)
    }
}
