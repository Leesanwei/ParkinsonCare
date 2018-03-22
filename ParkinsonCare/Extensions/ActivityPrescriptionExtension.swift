//
//  ActivityPrescriptionExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension ActivityPrescription{
    
    // MARK: - Initializater
    convenience init(activity : Activity, duration : Int, frequency : Int){
        self.init()
        self.activity = activity
        self.duration = Int16(duration)
        self.frequency = Int16(frequency)
    }
    
    // MARK: - Properties -
    
    var e_activity : Activity {
        get{
            return self.activity!
        }
    }
    
    var e_duration : Int {
        get{
            return Int(self.duration)
        }
    }
    
    var e_frequency : Int {
        get{
            return Int(self.frequency)
        }
    }
}
