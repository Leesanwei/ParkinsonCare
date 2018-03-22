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
}

