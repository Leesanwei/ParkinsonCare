//
//  Evaluation.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData
extension Evaluation {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, state : String, date : NSDate){
        self.init(context : context)
        self.date = date
        self.state = state
    }
    
    // MARK: - Properties
    
    var e_state : String {
        get {
            return self.state!
        }
    }
    
    var e_date : Date {
        get {
            return self.date! as Date
        }
    }
    
}
