//
//  File.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData

class CoreDataSynthesisDAO : SynthesisDAO{
    
    private let context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    
    /// Retrieve all the stored synthesis.
    ///
    /// - Returns: A collection of synthesis.
    /// - Throws: NSError whan cannot fetch the data.
    func findAll() throws -> SynthesisCollection{
        let request : NSFetchRequest<Synthesis> = Synthesis.fetchRequest()
        do{
            let synthesisList = SynthesisCollection()
            try synthesisList.setSynthesis(sl: self.context.fetch(request))
            return synthesisList
        }catch let error as NSError{
            throw error
        }
    }
    
    
    /// Delete the specified synthesis.
    ///
    /// - Parameter syn: the synthesis to be deleted.
    /// - Returns: Bool if deletion was successful.
    func remove(syn: Synthesis) -> Bool {
        self.context.delete(syn)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    
    /// Store a new synthesis.
    ///
    /// - Parameter syn: the synthesis to be stored.
    /// - Returns: the newly stored synthesis.
    func add(syn: Synthesis) -> Synthesis?{
        return nil
    }
    
    
    /// Retrieve the synthesis related to the next meeting with a neurologist.
    ///
    /// - Returns: Synthesis.
    /// - Throws: NSError if we cannot fetch it.
    func findUpcommingSynthesis() throws -> Synthesis {
        
        let request : NSFetchRequest<Synthesis> = Synthesis.fetchRequest()
        let predicate = NSPredicate(format: "ANY meeting.doctor.speciality.name == %@", "Neurologue")
        request.predicate = predicate
        do{
            let synthesisList = SynthesisCollection()
            try synthesisList.setSynthesis(sl: self.context.fetch(request))
            if let synthesis : Synthesis = synthesisList.getCloserOne() {
                return synthesis
            }else{
                fatalError()
            }
        }catch let error as NSError{
            throw error
        }
        
    }
    
    
    /// Add a new evaluation to the specified synthesis.
    ///
    /// - Parameters:
    ///   - syn: the synthesis to which the evaluation will be added.
    ///   - state: state of the evaluation.
    ///   - date: date of the evaluation.
    /// - Returns: Bool if the evaluation has been added.
    func addEvaluation(syn: Synthesis, state : String, date : Date) -> Bool {
        let eval : Evaluation = Evaluation(context: self.context, state : state, date: date as NSDate)
        syn.addToEvaluations(eval)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
}


