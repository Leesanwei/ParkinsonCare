//
//  FacadeFactory.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class FacadeFactory {
    
    // MARK: Singleton implementation
    static let sharedFacadeFactory : FacadeFactory = FacadeFactory()
    private init(){}
    
    static func getInstance() -> FacadeFactory{
        return sharedFacadeFactory
    }
    
    // MARK: - Properties
    private let businessLogicFacade : BusinessLogicFacade = BusinessLogicFacade.getInstance()

    // MARK: - Methods
    func getBusinessLogicFacadeInstance() -> BusinessLogicFacade{
        return self.businessLogicFacade
    }
}
