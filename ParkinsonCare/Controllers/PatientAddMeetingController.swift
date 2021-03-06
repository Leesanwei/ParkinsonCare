//
//  PatientAddMeetingController.swift
//  ParkinsonCare
//
//  Created by San-Wei LEE on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class PatientAddMeetingController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var doctors : DoctorCollection = DoctorCollection()
    
    @IBOutlet weak var doctorPicker: UIPickerView!
    
    @IBOutlet weak var delayPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    /// Button that triggers the add of a new meeting.
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func addMeeting(_ sender: Any) {
        
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        let row = doctorPicker.selectedRow(inComponent: 0)
        let doctor = self.doctors.find(_byIndex: row)
        let delay = delayPicker.selectedRow(inComponent: 0) + 1
        
        let meeting : Meeting? = persistanceFacade.addMeeting(doctor : doctor, date : datePicker.date, delay : delay)
        if let meet: Meeting = meeting{
            
            if meet.e_doctor.e_speciality == "Neurologue" { // schedule evaluations before the meeting
        
                // get default stored parameters.
                let minHour = UserDefaults.standard.integer(forKey:"beginHour")
                let maxHour = UserDefaults.standard.integer(forKey: "endHour")
                
                //Schedule evaluations for neurologist.
                if !NotificationManager.getInstance().scheduleEvaluations(meeting : meet, minHour: minHour, maxHour: maxHour){
                    print("Cannot schedule the notifications")
                }
            }
            // Schedule meeting reminder
            if !NotificationManager.getInstance().scheduleMeetingDelayReminder(meeting: meet, delay: delay, description: "Vous avez rendez-vous avec \(doctor.e_fullName) dans \(delay) minutes."){}
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        guard  let docs : DoctorCollection = persistanceFacade.getAllDoctors() else{
            fatalError()
        }
        
        self.doctors = docs
        
        self.doctors.sort()
        
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return doctors.count()
        }
        else{
            return 60
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return (self.doctors.find(_byIndex: row).firstName! + " " + self.doctors.find(_byIndex: row).lastName!)
            }
        else{
            return "\(row + 1) minutes"
        }
    }
    
    
    
    
    
    
    
}
