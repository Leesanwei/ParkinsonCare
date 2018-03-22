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
    
}
