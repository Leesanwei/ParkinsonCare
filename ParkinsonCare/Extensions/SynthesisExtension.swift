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
    convenience init(context : NSManagedObjectContext, meeting : Meeting){
        self.init(context: context)
        self.meeting = meeting
    }
    
    // MARK: - Properties -
    
    var e_meeting : Meeting {
        get{
            return self.meeting!
        }
    }
    
    var e_evaluations : EvaluationCollection {
        get{
            let evals : EvaluationCollection = EvaluationCollection()
            evals.setEvaluations(evaluations: Array(self.evaluations!) as! [Evaluation])
            return evals
        }
    }
    
    func addEvaluation(eval : Evaluation){
        self.evaluations?.adding(eval)
    }
}
