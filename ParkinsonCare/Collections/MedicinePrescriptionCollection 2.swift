//
//  ActivityPrescriptionCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 15/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class MedicinePrescriptionCollection{
    
    // MARK: - Properties
    private var medicinePrescriptions : [MedicinePrescription] = [MedicinePrescription]()
    
    
    // MARK: - Methods
    
    func setMedicinePrescriptions(medicinePrescriptions : [MedicinePrescription]){
        self.medicinePrescriptions = medicinePrescriptions
    }
    
    func count() -> Int {
        return self.medicinePrescriptions.count
    }
    
    func push(_newMedicinePrescription medicinePrescription : MedicinePrescription) -> Void{
        self.medicinePrescriptions.append(medicinePrescription)
    }
    
    func remove(_ medicinePrescription : MedicinePrescription) -> Void {
        guard let index : Int =  self.medicinePrescriptions.index(of: medicinePrescription) else{
            return
        }
        self.medicinePrescriptions.remove(at: index)
    }
    func find(_byIndex index : Int) -> MedicinePrescription{
        return self.medicinePrescriptions[index]
    }

}
