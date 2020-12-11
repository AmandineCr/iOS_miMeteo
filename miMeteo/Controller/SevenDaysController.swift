//
//  SevenDaysController.swift
//  miMeteo
//
//  Created by Maintenance on 11/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//


import UIKit
import MapKit
import Alamofire

class SevenDaysController: UIViewController {
    
    @IBOutlet weak var tableViewSevenDays: UITableView!
    var locationManager: CLLocationManager?
    var forecasts = [Forecast]()
    var daysForecast = [DayForecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    

    func getDaysForecast(){
        var jour = ""
        var icone = ""
        var min = 0.0
        var max = 0.0
        var description = ""
        for prev in forecasts {
            if prev.day != "" {
                if prev.day != jour {
                    if jour != ""{
                        let newDay = DayForecast(days: jour, icons: icone, mins: min, maxs: max, descriptions: description)
                        daysForecast.append(newDay)
                        
                    }
                    jour = prev.day
                    icone = prev.icon
                    min = prev.degrees
                    max = prev.degrees
                    description = prev.description
                }else{
                    if prev.degrees > max {
                        max = prev.degrees
                    }
                    if prev.degrees < min {
                        min = prev.degrees
                    }
                    if prev.date.contains("12:"){
                        icone = prev.icon
                        description = prev.description
                    }
                }
            }
        }
        
        
    }

}
