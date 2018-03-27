//
//  MedecinMedicamentController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//


import UIKit

class DoctorController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Properties
    var doctors : DoctorCollection = DoctorCollection()
    
    @IBOutlet weak var doctorsTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.doctors.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.doctorsTableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! DoctorTableViewCell
        
        cell.doctorNameLabel.text = self.doctors.find(_byIndex : indexPath.row).e_fullName + "\n" + self.doctors.find(_byIndex : indexPath.row).e_speciality + "\n" + self.doctors.find(_byIndex : indexPath.row).e_contact + "\n" + self.doctors.find(_byIndex: indexPath.row).e_location
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.doctorsTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.doctorsTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.doctorsTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    // MARK: - ViewController methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        guard let docs : DoctorCollection = persistanceFacade.getAllDoctors()  else {
            self.alertError(errorMsg : "Cannot reach the doctors", userInfo : "Unknown Error")
            return
        }
        self.doctors = docs
        self.doctorsTableView.reloadData()
    }
    
    // MARK: - Other Methods -
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    
    /// Delete the doctor at the specified index from the storage.
    ///
    /// - Parameter index: index of the doctor to be deleted.
    /// - Returns: Bool true if the doctor has been deleted.
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteDoctor(doc : self.doctors.find(_byIndex: index)){
            self.doctors.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
    
}

