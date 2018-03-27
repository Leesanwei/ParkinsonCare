//
//  BehaviourExtension.swift
//  ParkinsonCare
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Behaviour {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, description : String, date : NSDate){
        self.init(context : context)
        self.behaviourDescription = description
        self.date = date
    }
    
    // MARK: - Properties -

    
    var e_description : String {
        get{
            return self.behaviourDescription!
        }
    }
    
    var e_date : NSDate {
        get{
            return self.date!
        }
    }
}

