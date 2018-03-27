//
//  DoctorAddDoctorController.swift
//  ParkinsonCare
//
//  Created by admin on 19/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit
import CoreData

class DoctorAddDoctorController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate{
    
    var specialities = [Speciality]()
    
    
    @IBOutlet weak var specialityPicker: UIPickerView!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var location: UITextField!
    
    
    /// Button that triggers the add of a new doctor.
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func addDoctor(_ sender: Any) {
        if lastNameText.hasText && firstNameText.hasText && phoneNumberText.hasText && location.hasText{
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            let row = specialityPicker.selectedRow(inComponent: 0)
            let speciality = specialities[row]
            _ = persistanceFacade.addDoctor(firstName: self.firstNameText.text!,lastName : self.lastNameText.text!,speciality : speciality,phoneNumber: self.phoneNumberText.text!, location : self.location.text!)
                
            self.navigationController?.popViewController(animated: true)
            
        }
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()

        guard  let specs : [Speciality] = persistanceFacade.getAllSpecialities() else{
            fatalError()
        }
        
        self.specialities = specs
        
        self.specialities = self.specialities.sorted {
            $0.name! < $1.name!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return specialities.count}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return specialities[row].name
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
}




