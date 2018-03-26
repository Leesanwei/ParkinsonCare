//
//  ShowSynthesisController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class ShowSynthesisController : UIViewController {
    
    @IBOutlet weak var test : UILabel!
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test.text = currentSynthesis.e_meeting.e_date.toString(dateFormat: "mm-DD")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
