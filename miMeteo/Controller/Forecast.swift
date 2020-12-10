//
//  forcast.swift
//  miMeteo
//
//  Created by Maintenance on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class Forecast {
    
    private var _degrees: Double
    private var _date: String
    private var _icon: String
    private var _description: String
    private var _day: String
    
    var degrees: Double {
        return _degrees
    }
    
    var date: String {
        return _date
    }
    
    var icon: String {
        return _icon
    }
    
    var description: String {
        return _description
    }
    
    var day: String {
        return _day
    }
    
    init(degrees: Double, date: String, icon: String, description: String ) {
        _degrees = degrees
        _date = date
        _icon = icon
        _description = description
        _day = DateHelper.getDateHelper.weekDay(_date) ?? ""
        
    }
}

