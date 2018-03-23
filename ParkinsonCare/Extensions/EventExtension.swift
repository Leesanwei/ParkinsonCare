//
//  EventExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Event {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext, name : String){
        self.init(context : context)
        self.name = name
    }
    
    // MARK: - Properties -
    var e_name : String {
        get{
            return self.name!
        }
    }
}
