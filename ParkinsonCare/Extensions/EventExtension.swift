//
//  EventExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 20/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension Event {
    
    convenience init(name : String){
        self.init()
        self.name = name
    }
    
    func getName() -> String {
        return self.name!
    }
}
