//
//  DoctorSynthesisController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

var currentSynthesis = Synthesis()

class DoctorSynthesisController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    private var  synthesisList : SynthesisCollection = SynthesisCollection()
    
    @IBOutlet weak var synthesisTableView: UITableView!
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.synthesisList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.synthesisTableView.dequeueReusableCell(withIdentifier: "synthesisCell", for: indexPath) as! SynthesisTableViewCell
        cell.synthesisDateLabel.text = self.synthesisList.find(_byIndex : indexPath.row).e_meeting.e_date.toString(dateFormat: "dd-MM h:mm a")
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Manage only deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.synthesisTableView.beginUpdates()
            
            if self.delete(atIndex : indexPath.row) { // Try to delete in persistence
                // Delete the row in the tableView
                self.synthesisTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }else{
                self.alertError(errorMsg : "Impossible de supprimer l'élément.", userInfo : "Raison Inconnue")
            }
            self.synthesisTableView.endUpdates()
        }
    }
    
    
    // MARK: - UITableViewDelegate methods -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let persistenceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        
        // try to fetch all the synthesis.
        guard let synts : SynthesisCollection = persistenceFacade.getAllSynthesis()  else {
            self.alertError(errorMsg : "Cannot reach the synthesis", userInfo : "Unknown Error")
            return
        }
        self.synthesisList = synts
        self.synthesisTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSynthesis = self.synthesisList.find(_byIndex : indexPath.row)
        performSegue(withIdentifier: "showSynthesis", sender: self)
    }
    
    // MARK: - ViewController methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the persistence facade that hides the storage business logic.
        let persistenceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        // try to fetch all the synthesis.
        guard let synts : SynthesisCollection = persistenceFacade.getAllSynthesis()  else {
            self.alertError(errorMsg : "Cannot reach the synthesis", userInfo : "Unknown Error")
            return
        }
        self.synthesisList = synts
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Other Methods -
    func alertError(errorMsg msg : String, userInfo info : String){
        
    }
    
    
    /// Delete the synthesis at the specified index.
    ///
    /// - Parameter index: of the synthesis to be deleted.
    /// - Returns: Bool true if the deletion was successful.
    func delete(atIndex index : Int) -> Bool{
        let persistenceFacade  : PersistenceFacade = PersistenceFacade.getInstance()
        if persistenceFacade.deleteSynthesis(syn : self.synthesisList.find(_byIndex: index)){
            self.synthesisList.remove(atIndex : index)
            return true
        }else{
            return false
        }
    }
    
    
    
}
