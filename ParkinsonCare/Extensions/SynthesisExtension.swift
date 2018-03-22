//
//  SynthesisExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

extension Synthesis {
    
    // MARK: - Initializater
    convenience init(context : NSManagedObjectContext){
        self.init(context: context)
    }
    
    // MARK: - Properties -
    
    var e_meeting : Meeting {
        get{
            return self.meeting!
        }
    }
}
