//
//  PersitenceFacade.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class PersistenceFacade {
    
    // MARK: - Singleton Implementation -
    
    private static let persistenceFacade : PersistenceFacade = PersistenceFacade()
    
    
    /// Static func to get the singleton instance
    ///
    /// - Returns: Return the instance of PersistenceFacade.
    static func getInstance() -> PersistenceFacade{
        return persistenceFacade
    }
    
    // MARK: - Properties
    
    private let daoFactory : AbstractDAOFactory = AbstractDAOFactory.getInstance()
    
    // MARK: - Facade Methods
    
    // MARK: - Medicine
    
    /// get all the medicines stored.
    ///
    /// - Returns: A collection of medicines.
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
    
    /// Delete the specified medicine from the storage.
    ///
    /// - Parameter med: the medicine supposed to be deleted
    /// - Returns: Bool true if med has been deleted.
    func deleteMedicine(med : Medicine) -> Bool {
        guard let medicineDAO : MedicineDAO = daoFactory.getMedicineDAO() else{
            return false
        }
        return medicineDAO.remove(med : med)
    }
    
    
    /// Create a new medicine and store it.
    ///
    /// - Parameters:
    ///   - name: Name of the medicine.
    ///   - amount: Amount to be taken.
    /// - Returns: Bool true if the medicine has been added.
    func addMedicine(name : String, amount : String) -> Bool {
        guard let medicineDAO : MedicineDAO = daoFactory.getMedicineDAO() else{
            return false
        }
        return medicineDAO.add(name : name, amount : amount)
    }
    
    
    /// Add all the default medicines (called only at first launch)
    ///
    /// - Returns: Bool true if the medicins have been stored.
    func addMedicines() -> Bool {
        guard let medicineDAO : MedicineDAO = daoFactory.getMedicineDAO() else{
            return false
        }
        return medicineDAO.add()
    }
    
    
    /// Get all the medicinePrescriptions currently stored.
    ///
    /// - Returns: A collection of medicinePrescription.
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
    
    
    /// Delete the specified medicine prescription.
    ///
    /// - Parameter medPres: medicine prescription to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func deleteMedicinePrescription(medPres : MedicinePrescription) -> Bool {
        guard let medicinePrescriptionDAO : MedicinePrescriptionDAO = daoFactory.getMedicinePrescriptionDAO() else{
            return false
        }
        return medicinePrescriptionDAO.remove(mp : medPres)
    }
    
    
    /// Create a new medicine prescription and store it.
    ///
    /// - Parameters:
    ///   - medicine: medicine which who the prescription is related to.
    ///   - beginDate: date where the patient need to start the cure.
    ///   - endDate: date of cure's end.
    ///   - matin: Bool true if there is a morning take of the medicine.
    ///   - midi: Bool true if there is a midday take of the medicine.
    ///   - soir: Bool true if there is an evening take of the medicine.
    /// - Returns: the new medicine prescription if it has been stored or nil.
    func addMedicinePrescription(medicine : Medicine, beginDate : Date, endDate : Date ,matin : Bool, midi : Bool, soir: Bool) -> MedicinePrescription?{
        
        guard let medicinePrescriptionDAO : MedicinePrescriptionDAO = daoFactory.getMedicinePrescriptionDAO() else{
            return nil
        }
        return medicinePrescriptionDAO.add(medicine : medicine, beginDate : beginDate, endDate : endDate,matin : matin, midi : midi, soir: soir)
    }
    
    // MARK: - Activity
    
    
    /// Get all the activities stored.
    ///
    /// - Returns: A collection of activities.
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
    
    
    /// Delete the specified activity.
    ///
    /// - Parameter act: The activity to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func deleteActivity(act : Activity) -> Bool {
        guard let activityDAO : ActivityDAO = daoFactory.getActivityDAO() else{
            return false
        }
        return activityDAO.remove(act : act)
    }
    
    
    /// Create and store a new activity.
    ///
    /// - Parameters:
    ///   - nameSport: name of the activity.
    ///   - duration: how long should it be practiced.
    ///   - days: Bool array representing days where the activity should be practiced.
    /// - Returns: The newly created activity.
    func addActivity(nameSport : String, duration : Int, days : [Bool]) -> Activity?{
        guard let activityDAO : ActivityDAO = daoFactory.getActivityDAO() else{
            return nil
        }
        return activityDAO.add(nameSport : nameSport, duration : duration, days : days)
    }
    
    // MARK: - Doctor
    
    
    /// Get all the doctors stored.
    ///
    /// - Returns: a collection of doctors.
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
    
    
    /// Delete the specified doctor.
    ///
    /// - Parameter doc: doctor to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func deleteDoctor(doc : Doctor) -> Bool {
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return false
        }
        return doctorDAO.remove(doc : doc)
    }
    
    
    /// Create and store a new doctor.
    ///
    /// - Parameters:
    ///   - firstName: first name of the doctor.
    ///   - lastName: last name of the doctor.
    ///   - speciality: speciality of the doctor.
    ///   - phoneNumber: his phone number.
    ///   - location: doctor meetings place.
    /// - Returns: The newly created doctor.
    func addDoctor(firstName: String, lastName : String, speciality : Speciality, phoneNumber: String, location: String) -> Doctor? {
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return nil
        }
        
        return doctorDAO.add(firstName : firstName, lastName : lastName, speciality : speciality, phoneNumber : phoneNumber, location : location)
    }
    
    
    /// Get all the stored specialities.
    ///
    /// - Returns: Array of specialities.
    func getAllSpecialities() -> [Speciality]?{
        //Try to get the doctorDAO
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return nil
        }
        return  doctorDAO.findAllSpecialities()
       
    }
    
    
    /// Store the default specialities (called only at first launch)
    ///
    /// - Returns: Bool true if it has been stored.
    func addSpecialities() -> Bool{
        
        guard let doctorDAO : DoctorDAO = daoFactory.getDoctorDAO() else{
            return false
        }
        return  doctorDAO.addSpecialities()
    }
    
    
    // MARK: - Meeting
    
    
    /// Get all the stored meetings.
    ///
    /// - Returns: a collection of meetings.
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
    
    
    /// Delete the specified meeting.
    ///
    /// - Parameter meet: the meeting to be deleted.
    /// - Returns:  Bool true if the deletion was successful.
    func deleteMeeting(meet : Meeting) -> Bool {
        guard let meetingDAO : MeetingDAO = daoFactory.getMeetingDAO() else{
            return false
        }
        return meetingDAO.remove(meet : meet)
    }
    
    
    /// Create and store a new meeting.
    ///
    /// - Parameters:
    ///   - doctor: doctor with who is the meeting done.
    ///   - date: when is the meeting.
    ///   - delay: necessary time to prepare and arrive on time to the meeting.
    /// - Returns: the newly created meeting or nil if something whent wrong.
    func addMeeting(doctor : Doctor, date : Date, delay : Int) -> Meeting? {
        guard let meetingDAO : MeetingDAO = daoFactory.getMeetingDAO() else{
            return nil
        }
        
        return meetingDAO.add(doctor : doctor, date : date, delay : delay)
    }
    // MARK: - Reporting
    
    
    /// Get all the stored reportings.
    ///
    /// - Returns: collection of reportings.
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
    
    /// Get all the stored behaviours.
    ///
    /// - Returns: collection of behaviours.
    func getAllBehaviours() -> BehaviourCollection?{
        //Try to get the reportingDAO
        guard let behaviourDAO : BehaviourDAO = daoFactory.getBehaviourDAO() else{
            return nil
        }
        do{
            return try behaviourDAO.findAll()
        }catch {
            return nil
        }
    }
    
    
    /// Delete the specified reporting.
    ///
    /// - Parameter rep: reporting to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func deleteReporting(rep : Reporting) -> Bool {
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return false
        }
        return reportingDAO.remove(rep : rep)
    }
    
    
    /// Create and store a new reporting.
    ///
    /// - Parameters:
    ///   - event: event reported.
    ///   - date: when it happened.
    /// - Returns: The newly created reporting or nil if couldn't store the reporting.
    func addReport(event : Event, date : Date)-> Reporting?{
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return nil
        }
        return reportingDAO.add(event : event, date : date)
        
    }
    
    /// Create and store a new behaviour.
    ///
    /// - Parameters:
    ///   - behaviourDescription: the behaviour reported.
    ///   - date: when the behaviour occured.
    /// - Returns: The newly created behaviour or nil if something went wrong.
    func addBehaviour(behaviourDescription : String, date : Date) -> Behaviour?{
        guard let behaviourDAO : BehaviourDAO = daoFactory.getBehaviourDAO() else{
            return nil
        }
        return behaviourDAO.add(behaviourDescription : behaviourDescription, date : date)
        
    }
    
    
    /// Get all the stored events.
    ///
    /// - Returns: An array of events.
    func getAllEvents() -> [Event]?{
        //Try to get the doctorDAO
        guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
            return nil
        }
        return  reportingDAO.findAllEvents()
        
    }
    
    
    /// Store the default events. Called only at first launch.
    ///
    /// - Returns: Bool if storage was successful.
    func addEvent()-> Bool{
    guard let reportingDAO : ReportingDAO = daoFactory.getReportingDAO() else{
    return false
    }
    return reportingDAO.addEvent()
}

    // MARK: - Synthesis
    
    
    /// Get all the synthesis.
    ///
    /// - Returns: A collection of synthesis.
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
    
    
    /// Delete the specified synthesis.
    ///
    /// - Parameter syn: The synthesis to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func deleteSynthesis(syn : Synthesis) -> Bool {
        guard let synthesisDAO : SynthesisDAO = daoFactory.getSynthesisDAO() else{
            return false
        }
        return synthesisDAO.remove(syn : syn)
    }
    
    
    /// Register an evaluation to the current synthesis.
    ///
    /// - Parameter state: On / Off / Dyskinesie
    /// - Returns: Bool true if the registration was successful.
    func registerEvaluation(state : String) -> Bool{
        guard let synthesisDAO : SynthesisDAO = daoFactory.getSynthesisDAO() else{
            return false
        }
        do{
            let synthesis : Synthesis = try synthesisDAO.findUpcommingSynthesis()
            _ = synthesisDAO.addEvaluation(syn: synthesis, state : state, date : Date())
            
        }catch {
            print("Unable to reach the next meeting with a neurologist.")
            fatalError()
        }
        return true
    }
    
    
    
}
