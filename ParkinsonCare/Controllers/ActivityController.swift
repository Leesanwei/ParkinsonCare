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
    
    // MARK: - UITableViewDataSource methods - 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
        let activity : Activity = self.activities.find(_byIndex : indexPath.row)
        let hour = activity.e_duration/60
        let minute = activity.e_duration - hour*60
        cell.activityNameLabel.text = activity.e_name + " : \(hour) heure \(minute) minutes" + "\n"
        if activity.isAMondayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Lundi -"
        }
        if activity.isATuesdayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Mardi -"
        }
        if activity.isAWednesdayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Mercredi -"
        }
        if activity.isAThursdayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Jeudi -"
        }
        if activity.isAFridayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Vendredi -"
        }
        if activity.isASaturdayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Samedi -"
        }
        if activity.isASundayActivity {
            cell.activityNameLabel.text = cell.activityNameLabel.text! + "Dimanche"
        }
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50.0;//Choose your custom row height
    }
    
    // MARK: - ViewController methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    // MARK: - Other Methods -
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    
    /// Delete the activity at the specified index.
    ///
    /// - Parameter index: index of the activity to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteActivity(act : self.activities.find(_byIndex: index)){
            self.activities.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
    
}



