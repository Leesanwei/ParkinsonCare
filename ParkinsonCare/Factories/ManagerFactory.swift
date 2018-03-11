//
//  ManagerFactory.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class ManagerFactory {
    
    // MARK : Singleton implementation
    private static let sharedManagerFactory : ManagerFactory = ManagerFactory()
    private init(){}
    
    static func getInstance() -> ManagerFactory {
            return sharedManagerFactory
    }
}
