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
    var behaviours : BehaviourCollection = BehaviourCollection()
    
    @IBOutlet weak var reportingTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reportings.count() + self.behaviours.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row < self.reportings.count()){
        let cell = self.reportingTableView.dequeueReusableCell(withIdentifier: "reportingCell", for: indexPath) as! ReportingTableViewCell
        let reporting : Reporting = self.reportings.find(_byIndex : indexPath.row)
        
        
        
        let event : Event = reporting.e_event
        let french = DateFormatter()
        french.dateStyle = .medium
        french.timeStyle = .medium
        french.locale = Locale(identifier: "FR-fr")
        french.dateFormat = "dd-MM à HH:mm"
        let date24 = french.string(from: reporting.e_date as Date)
        cell.reportingDescriptionLabel.text = " \(event.e_name) \n Le \(date24)"
        return cell
        }
        else{
            let cell = self.reportingTableView.dequeueReusableCell(withIdentifier: "reportingCell", for: indexPath) as! ReportingTableViewCell
            let behaviour : Behaviour = self.behaviours.find(_byIndex : indexPath.row - self.reportings.count() )
            
            let french = DateFormatter()
            french.dateStyle = .medium
            french.timeStyle = .medium
            french.locale = Locale(identifier: "FR-fr")
            french.dateFormat = "dd-MM à HH:mm"
            let date24 = french.string(from: behaviour.e_date as Date)
            cell.reportingDescriptionLabel.text = "Synthèse : \(behaviour.e_description) \n Le \(date24)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60.0;//Choose your custom row height
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
    
    // MARK: - ViewController methods -
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
        
        guard let behaviours : BehaviourCollection = persistanceFacade.getAllBehaviours()  else {
            self.alertError(errorMsg : "Cannot reach the reportings", userInfo : "Unknown Error")
            return
        }
        self.behaviours = behaviours
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Other Methods -
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    
    /// Delete the reporting at the specified index from the storage.
    ///
    /// - Parameter index: of the reporting to be deleted.
    /// - Returns: Bool true if the deletion was successful.
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





