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
        
        
        let event : Event = reporting.e_event
        
        cell.reportingDescriptionLabel.text = " \(event.e_name) le \(reporting.e_date.toString(dateFormat: "dd-MM"))"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.reportingTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.reportingTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.reportingTableView.endUpdates()
        }
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
    
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteReporting(rep : self.reportings.find(_byIndex: index)){
            self.reportings.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
}





