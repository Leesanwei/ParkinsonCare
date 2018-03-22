//
//  PatientAddSportcontroller.swift
//  ParkinsonCare
//
//  Created by San-Wei LEE on 21/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class PatientAddSportController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let days = [1,2,3,4,5,6,7]
    
    
    
    @IBOutlet weak var sportName: UITextField!
   
    
    @IBOutlet weak var DurationPicker: UIPickerView!
    @IBOutlet weak var frequencePicker: UIPickerView!
    
    @IBAction func addSport(_ sender: Any) {
    }
    /*
    @IBAction func addMedicine(_ sender: Any) {
       if addMedicineText.hasText && medicineAmount.hasText && medicineComment.hasText {
              let amount : Int = Int(medicineAmount.text!)!
            let comment : String = medicineComment.text!
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            if persistanceFacade.addMedicine(name: name, amount: amount, comment: comment){
                self.addMedicineText.text = ""
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
 */
    
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
            return days.count
        }
        
        
        
    }
   
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerView.tag == 1){
            switch component {
            case 0:
                return "\(row) Hour"
            case 1:
                return "\(row) Minute"
            default:
                return ""
            }}
        else{
            return "\(row)"
        }
        
    }
    
    
}
