//
//  MeetingExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Meeting {
    
    convenience init(doctor : Doctor, date : NSDate, delay : Int, evaluations : EvaluationCollection){
        self.init()
        self.doctor = doctor
        self.date = date
        self.delay = Int16(delay)
        self.evaluations = evaluations.castToNSSet()
    }
    
    func getDoctor() -> Doctor {
        return self.doctor!
    }
    
    func getDate() -> NSDate {
        return self.date!
    }
    
    func getDelay() -> Int {
        return Int(self.delay)
    }
    
    func getEvaluations() -> EvaluationCollection {
        var evals : EvaluationCollection = EvaluationCollection()
        evals.setEvaluations(evaluations: Array(self.evaluations!) as! [Evaluation])
        return evals
    }
}
