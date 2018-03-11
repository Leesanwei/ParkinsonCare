//
//  BusinessLogicFacade.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class BusinessLogicFacade {
    
    // MARK: Singleton implementation
    private static let sharedBusinessLogicFacade : BusinessLogicFacade = BusinessLogicFacade()
    private init(){}
    
    static func getInstance() -> BusinessLogicFacade{
        return sharedBusinessLogicFacade
    }
    
    // MARK: - Properties
}
