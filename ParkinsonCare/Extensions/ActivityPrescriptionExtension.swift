//
//  ActivityPrescriptionExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension ActivityPrescription{
    
    convenience init(activity : Activity, duration : Int, frequency : Int){
        self.init()
        self.activity = activity
        self.duration = Int16(duration)
        self.frequency = Int16(frequency)
    }
    
    func getActivity() -> Activity {
        return self.activity!
    }
    
    func getDuration() -> Int {
        return Int(self.duration)
    }
    
    func getFrequency() -> Int {
        return Int(self.frequency)
    }
}
