//
//  MeetingDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol MeetingDAO {
    
    func findAll() throws -> MeetingCollection
    func add(meet : Meeting) -> Bool
    func remove(meet : Meeting) -> Bool
}
