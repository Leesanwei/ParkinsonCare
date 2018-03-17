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
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.doctors.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.doctorsTableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! DoctorTableViewCell
        cell.doctorNameLabel.text = self.doctors.find(_byIndex : indexPath.row).getFullName()
        cell.doctorContactLabel.text = self.doctors.find(_byIndex : indexPath.row).getContact()

        guard let speciality  = (self.doctors.find(_byIndex : indexPath.row).speciality as! Speciality).name else{
            cell.doctorSpecialityLabel.text = "Specialité inconnue."
            return cell
        }
        cell.doctorSpecialityLabel.text = speciality
        return cell
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let docs : DoctorCollection = persistanceFacade.getAllDoctors()  else {
            self.alertError(errorMsg : "Cannot reach the doctors", userInfo : "Unknown Error")
            return
        }
        self.doctors = docs
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
}

