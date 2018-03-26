//
//  DoctorAddSettingsController.swift
//  ParkinsonCare
//
//  Created by admin on 25/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class DoctorAddSettingsController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var beginTime: UIPickerView!
    
    @IBOutlet weak var endTime: UIPickerView!
    
    @IBAction func setTime(_ sender: Any) {
        
        let begin = beginTime.selectedRow(inComponent: 0)
        let end = endTime.selectedRow(inComponent : 0) + 1
        UserDefaults.standard.set(begin, forKey:"beginHour")
        UserDefaults.standard.set(end, forKey:"endHour")
        print(UserDefaults.standard.integer(forKey: "beginHour"))
        print(UserDefaults.standard.integer(forKey: "endHour"))
         self.navigationController?.popViewController(animated: true)
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
        return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return 24        }
        else{
            return 24
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return "\(row) h"
        }
        else {
            return "\(row+1) h"
        }
    }
}
