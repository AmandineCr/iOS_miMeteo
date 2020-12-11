//
//  DayForecast.swift
//  miMeteo
//
//  Created by Maintenance on 11/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class DayForecast {
    
    private var _day: String
    private var _icon: String
    private var _min: Double
    private var _max: Double
    private var _description: String
    
    var day: String {
        return _day
    }
    
    var icon: String {
        return _icon
    }
    
    var min: Double {
        return _min
    }
    
    var max: Double {
        return _max
    }
    
    var description: String {
        return _description
    }
    
    
    init(days: String, icons: String, mins: Double, maxs: Double, descriptions: String){
        _day = days
         _icon = icons
         _min = mins
         _max = maxs
        _description = descriptions
    }
    
}
