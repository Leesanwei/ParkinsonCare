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
        if addMedicineText.hasText{
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            if persistanceFacade.addMedicine(nameMedicine: self.addMedicineText.text!){
                self.addMedicineText.text = ""
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

