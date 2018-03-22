//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class PatientActivityPrescriptionController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var activityPrescriptions : ActivityPrescriptionCollection = ActivityPrescriptionCollection()
    
    @IBOutlet weak var activityPrescriptionTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activityPrescriptions.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.activityPrescriptionTableView.dequeueReusableCell(withIdentifier: "activityPrescriptionCell", for: indexPath) as! ActivityPrescriptionTableViewCell
        let prescription : ActivityPrescription = self.activityPrescriptions.find(_byIndex : indexPath.row)
       
        let  activity : Activity = prescription.e_activity
        
        cell.activityNameLabel.text = activity.e_name
        cell.activityDescriptionLabel.text = "\(prescription.e_duration) min tous les \(prescription.e_frequency)"
        
        return cell
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let prescriptions : ActivityPrescriptionCollection = persistanceFacade.getAllActivityPrescriptions()  else {
            self.alertError(errorMsg : "Cannot reach the activity prescriptions", userInfo : "Unknown Error")
            return
        }
        self.activityPrescriptions = prescriptions
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
}



