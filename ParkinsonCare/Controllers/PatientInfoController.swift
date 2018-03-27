//
//  PatientInfoController.swift
//  ParkinsonCare
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class PatientInfoController : UIViewController{
    
    
    @IBAction func ParkinsonWebsite(_ sender: Any) {
        if let url = NSURL(string: "http://www.franceparkinson.fr"){
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
