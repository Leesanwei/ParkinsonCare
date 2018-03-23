//
//  NotificationExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

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
}
