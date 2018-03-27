//
//  SynthesisCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class SynthesisCollection {
    
    // MARK: - Properties
    private var synthesisList : [Synthesis] = [Synthesis]()
    
    
    // MARK: - Methods
    
    func setSynthesis(sl : [Synthesis]){
        self.synthesisList = sl
    }
    
    func count() -> Int {
        return self.synthesisList.count
    }
    
    func remove(atIndex index : Int) -> Void {
        self.synthesisList.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Synthesis{
        return self.synthesisList[index]
    }
    
    // Get closer future synthesis in the collection
    func getCloserOne() -> Synthesis?{
        var closerSynIndex : Int = -1
        var closerSynTimeInterval : Double = -1
        for i in 0..<self.count() {
            let syn : Synthesis = self.find(_byIndex: i)
            if syn.e_meeting.e_date.timeIntervalSinceNow > 0 { // It is not an old synthesis
                if syn.e_meeting.e_date.timeIntervalSinceNow < closerSynTimeInterval || closerSynTimeInterval < 0{ // this synthesis is closer or is the first.
                    
                    closerSynTimeInterval = syn.e_meeting.e_date.timeIntervalSinceNow
                    closerSynIndex = i
                }
            }
        }
        if closerSynIndex > -1 { // There is at least one synthesis in the list.
            return self.find(_byIndex: closerSynIndex)
        }else{
            return nil
        }
    }
    
}
