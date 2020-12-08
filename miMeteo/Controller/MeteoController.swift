//
//  MeteoController.swift
//  miMeteo
//
//  Created by etudiant on 07/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MeteoController: UIViewController {

    var locationManager: CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        CLLocationSetup()
    }
    
    func weatherForecast (lat: Double, long: Double){
        let url_base = "http://api.openweathermap.org/data/2.5/forecast?"
        let lat = "lat=" + String(lat)
        let long = "&lon=" + String(long)
        let options = "&units=metric&lang=fr"
        let API_key = "&APPID=" + API
        let url_toString = url_base + lat + long + options + API_key
        print(url_toString)
        
        guard let url = URL(string: url_toString) else { return }

        AF.request(url).responseJSON { (response) in
            if let resp = response.value as? [ String: AnyObject ] {
                print(resp)
            }
        }
    }

}

