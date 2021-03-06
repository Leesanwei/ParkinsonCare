//
//  AbstractDAOFactory.swift
//  ParkinsonCare
//
// Define methods that need to be implemented in order to cover all the necessary functionaalities of the app storage.
//
//  Created by Loic Combis on 23/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class AbstractDAOFactory {
    
    static func getInstance() -> AbstractDAOFactory {
        return CoreDataDAOFactory()
    }
    
    func getMedicineDAO() -> MedicineDAO?{
        return nil
    }
    func getMedicinePrescriptionDAO() -> MedicinePrescriptionDAO?{
        return nil
    }
    func getDoctorDAO() -> DoctorDAO?{
        return nil
    }
    func getActivityDAO() -> ActivityDAO?{
        return nil
    }
    func getMeetingDAO() -> MeetingDAO?{
        return nil
    }
    func getReportingDAO() -> ReportingDAO?{
        return nil
    }
    func getSynthesisDAO() -> SynthesisDAO?{
        return nil
    }
    
    func getBehaviourDAO() -> BehaviourDAO?{
        return nil
    }
    
}


