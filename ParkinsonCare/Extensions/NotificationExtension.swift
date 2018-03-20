//
//  NotificationExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Notification {
    
    convenience init(type : TypeNotification, date : NSDate){
        self.init()
        self.typeNotification = type
        self.answered = false
    }
    
    func getTypeNotification() -> TypeNotification {
        return self.typeNotification!
    }
    
    func hasBeenAnswered() -> Bool {
        return self.answered
    }
    
    func makeAsAnswered() -> Void{
        self.answered = true
    }
}
