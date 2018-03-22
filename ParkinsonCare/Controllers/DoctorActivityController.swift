//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class DoctorActivityController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var activities : ActivityCollection = ActivityCollection()
    
    @IBOutlet weak var activityTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.activityTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
        cell.activityNameLabel.text = self.activities.find(_byIndex : indexPath.row).e_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.activityTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.activityTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.activityTableView.endUpdates()
        }
    }
    
    // MARK: - ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let acts : ActivityCollection = persistanceFacade.getAllActivities()  else {
            self.alertError(errorMsg : "Cannot reach the activities", userInfo : "Unknown Error")
            return
        }
        self.activities = acts
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let acts : ActivityCollection = persistanceFacade.getAllActivities()  else {
            self.alertError(errorMsg : "Cannot reach the activities", userInfo : "Unknown Error")
            return
        }
        self.activities = acts
        self.activityTableView.reloadData()
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
}

