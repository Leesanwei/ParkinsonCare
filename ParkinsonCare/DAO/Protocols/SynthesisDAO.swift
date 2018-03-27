//
//  SynthesisDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol SynthesisDAO {
    
    func findAll() throws -> SynthesisCollection
    func add(syn : Synthesis) -> Bool
    func remove(syn: Synthesis) -> Bool
    func findUpcommingSynthesis() throws -> Synthesis
    func addEvaluation(syn : Synthesis, state : String, date : Date) -> Bool
}
