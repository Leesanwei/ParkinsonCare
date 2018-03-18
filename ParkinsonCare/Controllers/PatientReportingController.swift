//
//  PatientReportingController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class PatientReportingController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var reportings : ReportingCollection = ReportingCollection()
    
    @IBOutlet weak var reportingTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reportings.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.reportingTableView.dequeueReusableCell(withIdentifier: "reportingCell", for: indexPath) as! ReportingTableViewCell
        let reporting : Reporting = self.reportings.find(_byIndex : indexPath.row)
        
        guard let event : Event = (reporting.value(forKeyPath: "event.reportings") as! Event) else{}
        
        cell.reportingDescriptionLabel.text = " \(String(describing: event.name)) le \((reporting.date as! NSDate).toString(dateFormat: "dd-MM"))"
        
    
        return cell
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let reportings : ReportingCollection = persistanceFacade.getAllReportings()  else {
            self.alertError(errorMsg : "Cannot reach the reportings", userInfo : "Unknown Error")
            return
        }
        self.reportings = reportings
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
}





