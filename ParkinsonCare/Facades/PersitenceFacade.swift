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
    private let daoFactory : AbstractDAOFactory = AbstractDAOFactory.getInstance()
    
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
    
    func deleteMedicine(med : Medicine) -> Bool {
        guard let medicineDAO : MedicineDAO = daoFactory.getMedicineDAO() else{
            return false
        }
        return medicineDAO.remove(med : med)
    }
    
    func addMedicine(name : String, amount : String) -> Bool {
        guard let medicineDAO : MedicineDAO = daoFactory.getMedicineDAO() else{
            return false
        }
        return medicineDAO.add(name : name, amount : amount)
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
    
    func deleteMedicinePrescription(medPres : MedicinePrescription) -> Bool {
        guard let medicinePrescriptionDAO : MedicinePrescriptionDAO = daoFactory.getMedicinePrescriptionDAO() else{
            return false
        }
        return medicinePrescriptionDAO.remove(mp : medPres)
    }
    
    func addMedicinePrescription(medicine : Medicine, beginDate : Date, endDate : Date ,matin : Bool, midi : Bool, soir: Bool) -> Bool{
        guard let medicinePrescriptionDAO : MedicinePrescriptionDAO = daoFactory.getMedicinePrescriptionDAO() else{
            return false
        }
        return medicinePrescriptionDAO.add(medicine : medicine, beginDate : beginDate, endDate : endDate,matin : matin, midi : midi, soir: soir)
    }
    
    // MARK: - Activity -
    
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
    
    func deleteActivity(act : Activity) -> Bool {
        guard let activityDAO : ActivityDAO = daoFactory.getActivityDAO() else{
            return false
        }
        return activityDAO.remove(act : act)
    }
    
    func addSport(nameSport : String, duration : Int, frequence : Int) -> Bool {
        guard let activityDAO : ActivityDAO = daoFactory.getActivityDAO() else{
            return false
        }
        return activityDAO.add(nameSport : nameSport, duration : duration, frequency : frequence)
    }
    
    // MARK: - Doctor -
    
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
    
    func deleteDoctor(doc : Doctor) -> Bool {
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return false
        }
        return doctorDAO.remove(doc : doc)
    }
    
    func addDoctor(firstName: String, lastName : String, speciality : Speciality, phoneNumber: String, location: String) -> Bool {
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return false
        }
        
        return doctorDAO.add(firstName : firstName, lastName : lastName, speciality : speciality, phoneNumber : phoneNumber, location : location)
    }
    
    func getAllSpecialities() -> [Speciality]?{
        //Try to get the doctorDAO
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return nil
        }
        return  doctorDAO.findAllSpecialities()
       
    }
    
    func addSpecialities() -> Bool{
        
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return false
        }
        return  doctorDAO.addSpecialities()
    }
    
    
    // MARK: - Meeting -
    
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
    
    func deleteMeeting(meet : Meeting) -> Bool {
        guard let meetingDAO : MeetingDAO = daoFactory.getMeetingDAO() else{
            return false
        }
        return meetingDAO.remove(meet : meet)
    }
    
    func addMeeting(doctor : Doctor, date : Date, delay : Int) -> Bool {
        guard let meetingDAO : MeetingDAO = daoFactory.getMeetingDAO() else{
            return false
        }
        
        return meetingDAO.add(doctor : doctor, date : date, delay : delay)
    }
    // MARK: - Reporting -
    
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
    
    func deleteReporting(rep : Reporting) -> Bool {
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return false
        }
        return reportingDAO.remove(rep : rep)
    }
    
    func addReport(event : Event, date : Date)-> Bool{
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return false
        }
        return reportingDAO.add(event : event, date : date)
        
    }
    
    func getAllEvents() -> [Event]?{
        //Try to get the doctorDAO
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return nil
        }
        return  reportingDAO.findAllEvents()
        
    }
    
    func addEvent()-> Bool{
    guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
    return false
    }
    return reportingDAO.addEvent()
}

    // MARK: - Synthesis -
    
    func getAllSynthesis() -> SynthesisCollection?{
        
        guard let synthesisDAO : SynthesisDAO = daoFactory.getSynthesisDAO() else{
            return nil
        }
        do{
            return try synthesisDAO.findAll()
        }catch {
            return nil
        }
    }
    
    func deleteSynthesis(syn : Synthesis) -> Bool {
        guard let synthesisDAO : SynthesisDAO = daoFactory.getSynthesisDAO() else{
            return false
        }
        return synthesisDAO.remove(syn : syn)
    }
    
    
    
}
