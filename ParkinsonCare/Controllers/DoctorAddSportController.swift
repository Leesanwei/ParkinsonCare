//
//  DoctorAddSportController.swift
//  ParkinsonCare
//
//  Created by admin on 19/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class DoctorAddSportController: UIViewController{
    

   
    @IBOutlet weak var addSportText: UITextField!
    
   
    @IBAction func addSport(_ sender: Any) {
        
        if addSportText.hasText{
            let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
            if persistanceFacade.addSport(nameSport: self.addSportText.text!){
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


