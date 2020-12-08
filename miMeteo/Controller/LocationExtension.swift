//
//  LocationExtension.swift
//  miMeteo
//
//  Created by etudiant on 07/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit
import MapKit

extension MeteoController: CLLocationManagerDelegate {
    
    func CLLocationSetup() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.count > 0 else { return }
        locationManager?.stopUpdatingLocation()
        let currentPosition = locations[0]
        let lat = currentPosition.coordinate.latitude
        let long = currentPosition.coordinate.longitude
//        print("La latitudes est de :\(lat) -> la longitude est de :\(long)")
        weatherForecast(lat: lat, long: long)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
