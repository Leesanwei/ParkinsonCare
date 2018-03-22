//
//  ReportingCollection.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 11/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

class ReportingCollection{
    
    // MARK: - Properties
    private var reportings : [Reporting] = [Reporting]()
    
    // MARK: - Methods
    
    func setReportings(reportings : [Reporting]){
        self.reportings = reportings
    }
    
    func count() -> Int {
        return self.reportings.count
    }
    
    func push(_newReporting reporting : Reporting) -> Void{
        self.reportings.append(reporting)
    }
    
    func remove(atIndex index : Int) -> Void {
        self.reportings.remove(at: index)
    }
    
    func find(_byIndex index : Int) -> Reporting{
        return self.reportings[index]
    }

}
