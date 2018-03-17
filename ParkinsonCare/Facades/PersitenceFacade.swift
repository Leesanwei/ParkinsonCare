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
    
    func getAllMedicinePrescriptions() -> MedicinePrescriptionCollection?{
        //Try to get the medicinePrescriptionDAO
        guard let medicinePrescriptionDAO : MedicinePrescriptionDAO = daoFactory.getMedicinePrescriptionDAO() else{
            return nil
        }
        do{
            return try medicinePrescriptionDAO.findAll()
        }catch {
            return nil
        }
    }
    
    // MARK: - Activity
    
    func getAllActivities() -> ActivityCollection?{
        //Try to get the activityDAO
        guard let activityDAO : ActivityDAO = daoFactory.getActivityDAO() else{
            return nil
        }
        do{
            return try activityDAO.findAll()
        }catch {
            return nil
        }
    }
    
    func getAllActivityPrescriptions() -> ActivityPrescriptionCollection?{
        //Try to get the activityPrescriptionDAO
        guard let activityPrescriptionDAO : ActivityPrescriptionDAO = daoFactory.getActivityPrescriptionDAO() else{
            return nil
        }
        do{
            return try activityPrescriptionDAO.findAll()
        }catch {
            return nil
        }
    }
    
    // MARK: - Doctor
    
    func getAllDoctors() -> DoctorCollection?{
        //Try to get the doctorDAO
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return nil
        }
        do{
            return try doctorDAO.findAll()
        }catch {
            return nil
        }
    }
    
    // MARK: - Meeting
    
    func getAllMeetings() -> MeetingCollection?{
        //Try to get the meetingDAO
        guard let meetingDAO : MeetingDAO = daoFactory.getMeetingDAO() else{
            return nil
        }
        do{
            return try meetingDAO.findAll()
        }catch {
            return nil
        }
    }
    
    // MARK: - Reporting
    
    func getAllReportings() -> ReportingCollection?{
        //Try to get the reportingDAO
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return nil
        }
        do{
            return try reportingDAO.findAll()
        }catch {
            return nil
        }
    }
}
