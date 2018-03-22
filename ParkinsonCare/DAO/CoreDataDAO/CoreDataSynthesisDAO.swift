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
    
    func remove(syn: Synthesis) -> Bool {
        self.context.delete(syn)
        do{
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    func add(syn: Synthesis) -> Bool {
        return true
    }
    
}


