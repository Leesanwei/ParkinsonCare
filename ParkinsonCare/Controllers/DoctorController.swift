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
        cell.doctorNameLabel.text = self.doctors.find(_byIndex : indexPath.row).e_fullName
        cell.doctorContactLabel.text = self.doctors.find(_byIndex : indexPath.row).e_contact

      
        cell.doctorSpecialityLabel.text = self.doctors.find(_byIndex : indexPath.row).e_speciality.name
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
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
}

