//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class PatientMedicinePrescriptionController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var medicinePrescriptions : MedicinePrescriptionCollection = MedicinePrescriptionCollection()
    
    @IBOutlet weak var medicinePrescriptionTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicinePrescriptions.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.medicinePrescriptionTableView.dequeueReusableCell(withIdentifier: "medicinePrescriptionCell", for: indexPath) as! MedicinePrescriptionTableViewCell
        let prescription : MedicinePrescription = self.medicinePrescriptions.find(_byIndex : indexPath.row)
        
        cell.medicineNameLabel.numberOfLines = 3
        cell.medicineNameLabel.text = prescription.e_medicine.fullDescription + "Du \(prescription.e_beginDate) au \(prescription.e_endDate)"
            
        if prescription.hasMorningTake {
            cell.medicineNameLabel.text = cell.medicineNameLabel.text! + "Matin "
        }
        if prescription.hasMiddayTake {
            cell.medicineNameLabel.text = cell.medicineNameLabel.text! + "Midi "
        }
        if prescription.hasEveningTake {
            cell.medicineNameLabel.text = cell.medicineNameLabel.text! + "Soir "
        }
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.medicinePrescriptionTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.medicinePrescriptionTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.medicinePrescriptionTableView.endUpdates()
        }
    }
    
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let prescriptions : MedicinePrescriptionCollection = persistanceFacade.getAllMedicinePrescriptions()  else {
            self.alertError(errorMsg : "Cannot reach the doctors", userInfo : "Unknown Error")
            return
        }
        self.medicinePrescriptions = prescriptions
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteMedicinePrescription(medPres : self.medicinePrescriptions.find(_byIndex: index)){
            self.medicinePrescriptions.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
}


