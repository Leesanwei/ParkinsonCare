//
//  DoctorAddDoctorController.swift
//  ParkinsonCare
//
//  Created by admin on 19/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit
import CoreData

class DoctorAddDoctorController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var specialities = [Speciality]()
    
    
    @IBOutlet weak var specialityPicker: UIPickerView!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var location: UITextField!
    
    @IBAction func addDoctor(_ sender: Any) {
        if lastNameText.hasText && firstNameText.hasText && phoneNumberText.hasText && location.hasText{
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            let row = specialityPicker.selectedRow(inComponent: 0)
            let speciality = specialities[row]
            if persistanceFacade.addDoctor(firstName: self.firstNameText.text!,lastName : self.lastNameText.text!,speciality : speciality,phoneNumber: self.phoneNumberText.text!, location : self.location.text!){
                
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context : NSManagedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        let request : NSFetchRequest<Speciality> = Speciality.fetchRequest()
        do{
            self.specialities = try context.fetch(request)
            
           
        }catch let error as NSError{
            print("Unable to reach specialities")
        }
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
}




