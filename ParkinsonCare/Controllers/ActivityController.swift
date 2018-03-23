//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class ActivityController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var activities : ActivityCollection = ActivityCollection()
    
    @IBOutlet weak var activitiesTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
        let activity : Activity = self.activities.find(_byIndex : indexPath.row)
        
        cell.activityNameLabel.numberOfLines = 2
        cell.activityNameLabel.text = activity.e_name + " : \(activity.e_duration) min tous les \(activity.e_frequency) jours."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.activitiesTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.activitiesTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.activitiesTableView.endUpdates()
        }
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteActivity(act : self.activities.find(_byIndex: index)){
            self.activities.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
    
    // get the persistence facade that hides the storage business logic.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let activities : ActivityCollection = persistanceFacade.getAllActivities()  else {
            self.alertError(errorMsg : "Cannot reach the activity prescriptions", userInfo : "Unknown Error")
            return
        }
        self.activities = activities
        self.activitiesTableView.reloadData()
    }
}



