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
        
        cell.meetingDoctorNameLabel.text = doctor.e_fullName
        cell.meetingDescriptionLabel.text = "Le \((meeting.e_date).toString(dateFormat: "dd-MM")) à  \(doctor.e_location)"
        
        return cell
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let meetings : MeetingCollection = persistanceFacade.getAllMeetings()  else {
            self.alertError(errorMsg : "Cannot reach the meetings", userInfo : "Unknown Error")
            return
        }
        self.meetings = meetings
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
}




