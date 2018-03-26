//
//  EvaluationCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class EvaluationCollection{
    
    // MARK: - Properties
    private var evaluations : [Evaluation] = [Evaluation]()
    

    // MARK: - Methods
    
    func setEvaluations(evaluations : [Evaluation]){
        self.evaluations = evaluations
    }
    
    func castToNSSet() -> NSSet{
        let set : NSSet = NSSet()
        for eval in self.evaluations {
            set.adding(eval)
        }
        return set
    }
    
    func count() -> Int {
        return self.evaluations.count
    }
    
    func push(_newEvaluation evaluation : Evaluation) -> Void{
        self.evaluations.append(evaluation)
    }
    
    func remove(_ evaluation : Evaluation) -> Void {
        guard let index : Int =  self.evaluations.index(of: evaluation) else{
            return
        }
        self.evaluations.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Evaluation{
        return self.evaluations[index]
    }
}

