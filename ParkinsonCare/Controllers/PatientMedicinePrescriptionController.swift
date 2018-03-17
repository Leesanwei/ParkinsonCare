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
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicinePrescriptions.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.medicinePrescriptionTableView.dequeueReusableCell(withIdentifier: "medicinePrescriptionCell", for: indexPath) as! MedicinePrescriptionTableViewCell
        let prescription : MedicinePrescription = self.medicinePrescriptions.find(_byIndex : indexPath.row)
        guard let medicine : Medicine = prescription.medicine as! Medicine else{
            
        }
        cell.medicineNameLabel.text = medicine.getFullDescription()
        cell.prescriptionPeriodLabel.text = "Du \(String(describing: prescription.beginDate)) au \(prescription.endDate)"
        
        cell.prescriptionFrequencyLabel.text = ""
        if prescription.morning { cell.prescriptionFrequencyLabel.text = cell.prescriptionFrequencyLabel.text! + "Matin "}
        if prescription.midday { cell.prescriptionFrequencyLabel.text = cell.prescriptionFrequencyLabel.text! + "Midi "}
        if prescription.evening { cell.prescriptionFrequencyLabel.text = cell.prescriptionFrequencyLabel.text! + "Soir "}
        cell.prescriptionFrequencyLabel.text =  cell.prescriptionFrequencyLabel.text! + "tous les \(prescription.frequency)"
        
        return cell
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
}


