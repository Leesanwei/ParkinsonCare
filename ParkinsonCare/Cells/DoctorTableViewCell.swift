//
//  ActivityTableViewCell.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var doctorSpecialityLabel: UILabel!
    
    @IBOutlet weak var doctorNameLabel: UILabel!
    
    @IBOutlet weak var doctorContactLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func suppressDoctor(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

