//
//  DoctorAddSettingsController.swift
//  ParkinsonCare
//
//  Created by admin on 25/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class DoctorAddSettingsController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return 24        }
        else if(pickerView.tag == 2){
            return 24
        }
        else{
            return 24
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return "\(row+1) h"
        }
        else if(pickerView.tag == 2){
            return "\(row+1) h"
        }
        else{
           
                return "Toutes les \(row+1) heures"
            
        }
    }
}
