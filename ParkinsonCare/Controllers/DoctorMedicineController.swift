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
        cell.medicineNameLabel.text = self.medicines.find(_byIndex : indexPath.row).getFullDescription()
        return cell
    }
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the medicines.
        guard let meds : MedicineCollection = persistanceFacade.getAllMedicines()  else {
            self.alertError(errorMsg : "Cannot reach the medicines", userInfo : "Unknown Error")
            return
        }
        self.medicines = meds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
}
