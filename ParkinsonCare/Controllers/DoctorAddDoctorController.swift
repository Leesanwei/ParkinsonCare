//
//  DoctorAddDoctorController.swift
//  ParkinsonCare
//
//  Created by admin on 19/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class DoctorAddDoctorController: UIViewController{
    
    
    
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var specialityText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var location: UITextField!
    
    @IBAction func addDoctor(_ sender: Any) {
        if lastNameText.hasText && firstNameText.hasText && specialityText.hasText && phoneNumberText.hasText && location.hasText{
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            if persistanceFacade.addDoctor(firstName: self.firstNameText.text!,lastName : self.lastNameText.text!,specialityName: self.specialityText.text!,phoneNumber: self.phoneNumberText.text!, location : self.location.text!){
                self.navigationController?.popViewController(animated: true)
            }
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
    
}
