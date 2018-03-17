//
//  NotificationDAO.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

protocol NotificationDAO {
    
    func findAll() throws -> NotificationCollection
    func add(notif : Notification) -> Bool
    func remove(notif : Notification) -> Bool
}
