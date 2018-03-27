//
//  DateExtension.swift
//  ParkinsonCare
//
//  Created by Loic Combis on 17/03/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import Foundation

extension NSDate
{
    // MARK: - Methods -
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
    
    func getComponent() -> DateComponents{
        var component  = DateComponents()
        component.year = NSCalendar.current.component(Calendar.Component.year, from: self as Date)
        component.month = NSCalendar.current.component(Calendar.Component.month, from: self as Date)
        component.day = NSCalendar.current.component(Calendar.Component.day, from: self as Date)
        component.hour = NSCalendar.current.component(Calendar.Component.hour, from: self as Date)
        component.minute = NSCalendar.current.component(Calendar.Component.minute, from: self as Date)
        component.second = NSCalendar.current.component(Calendar.Component.second, from: self as Date)

        return component
    }
    
}
