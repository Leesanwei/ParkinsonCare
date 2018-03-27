//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class DoctorMedicineController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var medicines : MedicineCollection = MedicineCollection()


  
    @IBOutlet weak var medicineTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicines.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.medicineTableView.dequeueReusableCell(withIdentifier: "medicineCell", for: indexPath) as! MedicineTableViewCell
        cell.medicineNameLabel.text = self.medicines.find(_byIndex : indexPath.row).fullDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.medicineTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.medicineTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.medicineTableView.endUpdates()
        }
    }

    
    // MARK: - UITableViewDelegate methods -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let persistenceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let meds : MedicineCollection = persistenceFacade.getAllMedicines()  else {
            self.alertError(errorMsg : "Cannot reach the medicines", userInfo : "Unknown Error")
            return
        }
        self.medicines = meds
        self.medicines.sort()
        self.medicineTableView.reloadData()
    }
    
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.medicineTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteMedicine(med : self.medicines.find(_byIndex: index)){
            self.medicines.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
}
