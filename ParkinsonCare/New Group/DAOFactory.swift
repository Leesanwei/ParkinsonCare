//
//  DAOFacade.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DAOFactory {
    // MARK: - Singleton implementation
    private static var daoFactory: DAOFactory = DAOFactory()
    
    static func getInstance() -> DAOFactory{
        return daoFactory
    }
    // Empty private intializater.
    private init(){}
    
    // MARK: - Get Application Context
    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - DAO Getters
    func getMedicineDAO() -> MedicineDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataMedicineDAO(context : context)
    }
    
    func getDoctorDAO() -> DoctorDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataDoctorDAO(context : context)
    }
    
    func getActivityDAO() -> ActivityDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataActivityDAO(context : context)
    }
    
    func getMedicinePrescriptionDAO() -> MedicinePrescriptionDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataMedicinePrescriptionDAO(context : context)
    }
    
    func getActivityPrescriptionDAO() -> ActivityPrescriptionDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataActivityPrescriptionDAO(context : context)
    }
    
    func getMeetingDAO() -> MeetingDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataMeetingDAO(context : context)
    }
    
    func getReportingDAO() -> ReportingDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataReportingDAO(context : context)
    }
    
    func getNotificationDAO() -> NotificationDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataNotificationDAO(context : context)
    }
    
    func getSynthesisDAO() -> SynthesisDAO?{
        guard let context : NSManagedObjectContext = self.getContext() else{
            return nil
        }
        return CoreDataSynthesisDAO(context : context)
    }
}
