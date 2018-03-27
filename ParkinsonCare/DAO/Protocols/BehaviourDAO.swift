//
//  BehaviourDAO.swift
//  ParkinsonCare
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol BehaviourDAO {
    

    func findAll() throws -> BehaviourCollection
  
    func add(behaviourDescription : String, date : Date) -> Behaviour?
    func remove(bev : Behaviour) -> Bool
}
