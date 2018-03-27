//
//  PatientAddReportController.swift
//  ParkinsonCare
//
//  Created by San-Wei LEE on 23/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit
import CoreData

class PatientAddReportController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var events = [Event]()
    var behaviourDescription: String = ""
   
    
    @IBOutlet weak var eventPicker: UIPickerView!

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var first: UISwitch!
    @IBOutlet weak var second: UISwitch!
    @IBOutlet weak var third: UISwitch!
    @IBOutlet weak var fourth: UISwitch!
    @IBOutlet weak var fifth: UISwitch!
    @IBAction func firstSwitch(_ sender: Any) {
        second.setOn(false, animated: true)
        third.setOn(false, animated: true)
        fourth.setOn(false, animated: true)
        fifth.setOn(false, animated: true)
    }
    
    @IBAction func secondSwitch(_ sender: Any) {
        first.setOn(false, animated: true)
        third.setOn(false, animated: true)
        fourth.setOn(false, animated: true)
        fifth.setOn(false, animated: true)
    }
    
    @IBAction func thirdSwitch(_ sender: Any) {
        first.setOn(false, animated: true)
        second.setOn(false, animated: true)
        fourth.setOn(false, animated: true)
        fifth.setOn(false, animated: true)
    }
    @IBAction func fourthSwitch(_ sender: Any) {
        second.setOn(false, animated: true)
        third.setOn(false, animated: true)
        first.setOn(false, animated: true)
        fifth.setOn(false, animated: true)
    }
    @IBAction func fifthSwitch(_ sender: Any) {
        second.setOn(false, animated: true)
        third.setOn(false, animated: true)
        fourth.setOn(false, animated: true)
        first.setOn(false, animated: true)
    }
    
    /// Button that triggers the add of a new reporting.
    /// Tells whether the patient took the medicine on time
    /// - Parameter sender: <#sender description#>
    @IBAction func addBehaviour(_ sender: Any) {
        if(first.isOn){
            self.behaviourDescription = "Toutes les prises"
        }
        if(second.isOn){
            self.behaviourDescription = "La plupart des prises"
        }
        if(third.isOn){
            self.behaviourDescription = "Quelques prises"
        }
        if(fourth.isOn){
            self.behaviourDescription = "Aucune des prises"
        }
        if(fifth.isOn){
            if(text.hasText){
            self.behaviourDescription = "J'ai oublié " + text.text! + " prises"
            }
        }
        
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        let date = Date()
        
        _ = persistanceFacade.addBehaviour(behaviourDescription : self.behaviourDescription, date : date)
        self.navigationController?.popViewController(animated: true)
    }
    
    /// Button that triggers the add of a new reporting.
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func addReport(_ sender: Any) {
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        let row = eventPicker.selectedRow(inComponent: 0)
        let event = events[row]
        let date = Date()
        
        _ = persistanceFacade.addReport(event : event, date : date)
        self.navigationController?.popViewController(animated: true)
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        guard  let evens : [Event] = persistanceFacade.getAllEvents() else{
            fatalError()
        }
        
        self.events = evens
        
        self.events = self.events.sorted {
            $0.name! < $1.name!
        }
        first.setOn(false, animated: true)
        second.setOn(false, animated: true)
        third.setOn(false, animated: true)
        
        fourth.setOn(false, animated: true)
        fifth.setOn(false, animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return events.count}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return events[row].name
    }
}
