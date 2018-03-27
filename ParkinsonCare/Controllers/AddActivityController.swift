//
//  PatientAddSportcontroller.swift
//  ParkinsonCare
//
//  Created by San-Wei LEE on 21/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class AddActivityController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var sportName: UITextField!
    @IBOutlet weak var durationPicker: UIPickerView!

    @IBOutlet weak var lundi: UISwitch!
    
    @IBOutlet weak var mercredi: UISwitch!
    @IBOutlet weak var mardi: UISwitch!
    
    @IBOutlet weak var jeudi: UISwitch!
    
    @IBOutlet weak var vendredi: UISwitch!
    
    @IBOutlet weak var samedi: UISwitch!
    
    @IBOutlet weak var dimanche: UISwitch!
    
    @IBAction func addSport(_ sender: Any) {
        if sportName.hasText{
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            let duration = (durationPicker.selectedRow(inComponent: 0)*60)+durationPicker.selectedRow(inComponent: 1)
      
            let days : [Bool] = [lundi.isOn, mardi.isOn, mercredi.isOn, jeudi.isOn, vendredi.isOn, samedi.isOn, dimanche.isOn]
            let activity : Activity? = persistanceFacade.addActivity(nameSport: self.sportName.text!,duration: duration, days : days)
            
            if let act : Activity = activity {
                NotificationManager.getInstance().scheduleActivityReminder(activity: act)
            }else{
                print("Unable to add the activity.")
            }
            // Program notifications to remind the patient to perform the exercice.
            self.navigationController?.popViewController(animated: true)
            
            
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView.tag == 1){
            return 2}
        else{
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            switch component {
            case 0:
                return 25
            case 1:
                return 60
                
            default:
                return 0
            }}
        else{
            return 7
        }
        
        
        
    }
   
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerView.tag == 1){
            switch component {
            case 0:
                return "\(row) Heure"
            case 1:
                return "\(row) Minute"
            default:
                return ""
            }}
        else{
            return "\(row+1)"
        }
        
    }
    
    
}
