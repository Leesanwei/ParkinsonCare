//
//  PersitenceFacade.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class PersistenceFacade {
    
    // MARK: - Singleton Implementation
    private static let persistenceFacade : PersistenceFacade = PersistenceFacade()
    
    static func getInstance() -> PersistenceFacade{
        return persistenceFacade
    }
    
    // MARK: - Properties
    private let daoFactory : DAOFactory = DAOFactory.getInstance()
    
    // MARK: - Facade Methods -
    
    // MARK: Medicine
    
    func getAllMedicines() -> MedicineCollection?{
        
        //Try to get the medicineDAO
        guard let medicineDAO : MedicineDAO = daoFactory.getMedicineDAO() else{
            return nil
        }
        do{
            return try medicineDAO.findAll()
        }catch {
            return nil
        }
    }
}
