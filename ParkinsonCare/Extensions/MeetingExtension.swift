//
//  MeetingExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Meeting {
    
    // MARK: - Initializater
    convenience init(doctor : Doctor, date : Date, delay : Int, evaluations : EvaluationCollection){
        self.init()
        self.doctor = doctor
        self.date = date
        self.delay = Int16(delay)
        self.evaluations = evaluations.castToNSSet()
    }
    
    // MARK: - Properties -
    
    var e_doctor : Doctor {
        return self.doctor!
    }
    
    var e_date : Date {
        get{
            return self.date!
        }
    }
    
    var e_delay : Int {
        get{
            return Int(self.delay)
        }
    }
    
    var e_evaluations : EvaluationCollection {
        get{
            let evals : EvaluationCollection = EvaluationCollection()
            evals.setEvaluations(evaluations: Array(self.evaluations!) as! [Evaluation])
            return evals
        }
    }
}
