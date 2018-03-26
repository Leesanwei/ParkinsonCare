//
//  PatientAddMedicineController.swift
//  ParkinsonCare
//
//  Created by admin on 25/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class PatientAddMedicineController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

 var medicines : MedicineCollection = MedicineCollection()

    @IBOutlet weak var medicinePicker: UIPickerView!
    @IBOutlet weak var durationPicker: UIPickerView!
    @IBOutlet weak var matinSwitch: UISwitch!
    @IBOutlet weak var midiSwitch: UISwitch!
    @IBOutlet weak var soirSwitch: UISwitch!
    @IBAction func addMedicinePrescription(_ sender: Any) {
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        let row = medicinePicker.selectedRow(inComponent: 0)
        let medicine = self.medicines.find(_byIndex: row)
        let date = Date()
        var dateComponent = DateComponents()
        
        dateComponent.day = durationPicker.selectedRow(inComponent: 0) + 1
        
        let endDate = Calendar.current.date(byAdding: dateComponent, to: date)
        
        if persistanceFacade.addMedicinePrescription(medicine : medicine, beginDate : date, endDate : endDate!,matin : matinSwitch.isOn, midi : midiSwitch.isOn, soir: soirSwitch.isOn){
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        guard  let meds : MedicineCollection = persistanceFacade.getAllMedicines() else{
            fatalError()
        }
        
        self.medicines = meds
        self.medicines.sort()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
if (pickerView.tag == 1){
            return medicines.count()
        }
else{
        return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
if (pickerView.tag == 1){
            return (self.medicines.find(_byIndex: row).name! + " " + self.medicines.find(_byIndex: row).amount!)
        }
else{
    if(row==0){
        return "1 jour"
    }else{
        return "\(row+1) jours"
    }
    
        }
    }
    
    
}
