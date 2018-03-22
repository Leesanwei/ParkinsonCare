//
//  ActivityExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Activity {
    
    // MARK: - Initializater
    convenience init(name : String){
        self.init()
        self.name = name
    }
    
    // MARK: - Properties -
    
    var e_name : String {
        get{
            return self.name!
        }
    }
}
