//
//  DAOFacade.swift
//  ParkinsonCare
//
// Implements functions of abstractFactory.
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataDAOFactory : AbstractDAOFactory{
    
    // MARK: - Get Application Context
    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - DAO Getters
    override func getMedicineDAO() -> MedicineDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataMedicineDAO(context : context)
    }
    
    override func getDoctorDAO() -> DoctorDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataDoctorDAO(context : context)
    }
    
    override func getActivityDAO() -> ActivityDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataActivityDAO(context : context)
    }
    
    override func getMedicinePrescriptionDAO() -> MedicinePrescriptionDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataMedicinePrescriptionDAO(context : context)
    }
    
    override func getMeetingDAO() -> MeetingDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataMeetingDAO(context : context)
    }
    
    override func getReportingDAO() -> ReportingDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataReportingDAO(context : context)
    }
    
    override func getSynthesisDAO() -> SynthesisDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataSynthesisDAO(context : context)
    }
}
