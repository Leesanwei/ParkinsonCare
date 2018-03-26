//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class PatientMeetingController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var meetings : MeetingCollection = MeetingCollection()
    
    @IBOutlet weak var meetingTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meetings.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.meetingTableView.dequeueReusableCell(withIdentifier: "meetingCell", for: indexPath) as! MeetingTableViewCell
        let meeting : Meeting = self.meetings.find(_byIndex : indexPath.row)
        
        let doctor : Doctor = meeting.e_doctor
        cell.meetingDoctorNameLabel.text = doctor.e_fullName + "\n" + "Le \((meeting.e_date).toString(dateFormat: "dd-MM h:mm a"))" + "\n" + "à  \(doctor.e_location)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.meetingTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.meetingTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.meetingTableView.endUpdates()
        }
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteMeeting(meet : self.meetings.find(_byIndex: index)){
            self.meetings.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let meetings : MeetingCollection = persistanceFacade.getAllMeetings()  else {
            self.alertError(errorMsg : "Cannot reach the meetings", userInfo : "Unknown Error")
            return
        }
        self.meetings = meetings
        self.meetingTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80.0;//Choose your custom row height
    }
}




