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
    
    @IBOutlet weak var eventPicker: UIPickerView!

    
    /// Button that triggers the add of a new reporting.
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func addReport(_ sender: Any) {
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        let row = eventPicker.selectedRow(inComponent: 0)
        let event = events[row]
        let date = Date()
        
        persistanceFacade.addReport(event : event, date : date)
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
