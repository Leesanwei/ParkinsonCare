//
//  MedicineTableViewCell.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 14/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var medicineNameLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func suppressMedicine(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
