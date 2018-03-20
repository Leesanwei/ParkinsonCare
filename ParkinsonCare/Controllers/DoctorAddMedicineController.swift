//
//  DoctorAddMedicineController.swift
//  ParkinsonCare
//
//  Created by admin on 18/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class DoctorAddMedicineController: UIViewController{

    @IBOutlet weak var addMedicineText: UITextField!
    
    @IBAction func addMedicine(_ sender: Any) {
        if addMedicineText.hasText && medicineAmount.hasText && medicineComment.hastext {
            let name : String = addMedicineText.text!
            let amount : Int = Int(medicineAmount.text!)
            let comment : String = medicineComment.text!
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            if persistanceFacade.addMedicine(name: name, amount: amount, comment: comment){
                self.addMedicineText.text = ""
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

