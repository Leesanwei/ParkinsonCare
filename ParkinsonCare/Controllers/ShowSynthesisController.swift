//
//  ShowSynthesisController.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 22/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit

class ShowSynthesisController : UIViewController {
    

    @IBOutlet weak var j1: UIStackView!
    
    @IBOutlet weak var j2: UIStackView!
    
    @IBOutlet weak var j3: UIStackView!
    
    @IBOutlet weak var j4: UIStackView!
    
    @IBOutlet weak var j5: UIStackView!
    
    // MARK: - ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = currentSynthesis.e_meeting.e_date.toString(dateFormat: "dd-MM h:mm a")
        
        let stackView : [UIStackView] = [j1,j2,j3,j4,j5]
        var currentIndex : Int = 0
        
        let evaluations : EvaluationCollection = currentSynthesis.e_evaluations
        
        if evaluations.count() == 0{ // No evaluations to display
            return
        }
        
        var currentDayOfEvaluation : Int = NSCalendar.current.component(.day, from : evaluations.find(_byIndex: 0).e_date)
        
        for i in 0..<evaluations.count(){
            
            let eval : Evaluation = evaluations.find(_byIndex: i)
            // check if the current evaluation is related to another date than the previous.
            if currentDayOfEvaluation != NSCalendar.current.component(.day, from : evaluations.find(_byIndex: i).e_date){ //continue with next day
                currentIndex = currentIndex + 1
                currentDayOfEvaluation = NSCalendar.current.component(.day, from : evaluations.find(_byIndex: i).e_date)
            }
            // Add the label to the stack view
            let lab : UILabel = UILabel(state : eval.e_state, content : eval.e_description)
            stackView[currentIndex].addArrangedSubview(lab)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
