//
//  ActivityTableViewCell.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityNameLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func suppressActivity(_ sender: Any){
        //delete the activity
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}