//
//  MeteoController.swift
//  miMeteo
//
//  Created by etudiant on 07/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.



import UIKit
import MapKit
import Alamofire

class MeteoController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherDescription: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var locationManager: CLLocationManager?
    var forecast = [Forecast]()
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
                if let cityInfo = resp["city"] as? [String: AnyObject] {
                    if let myCity = cityInfo["name"] as? String {
                        self.cityLabel.text = myCity
                        if let list = resp["list"] as? NSArray {
                            for element in list {
                                if let dictionnary = element as? [ String: AnyObject] {
                                    if let main = dictionnary["main"] as? [String: AnyObject] {
                                        if let degrees = main["temp"] as? Double {
                                            if let weather = dictionnary["weather"] as? NSArray, weather.count > 0 {
                                                if let currentTemp = weather[0] as? [String: AnyObject] {
                                                    if let description = currentTemp["description"] as? String {
                                                        if let icon = currentTemp["icon"] as? String{
                                                            if let date = dictionnary["dt_txt"] as? String {
                                                                let newForecast = Forecast(degrees: degrees, date: date, icon: icon, description: description)
                                                                self.forecast.append(newForecast)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            //
                            self.currentValueSetup()
                        }
                    }
                }
            }
        }
    }
    func currentValueSetup(){
        if forecast.count > 0 {
            let currentWeather = forecast[0]
            degreesLabel.text = currentWeather.degrees.convertIntToString()
            currentWeatherDescription.text = currentWeather.description
            ImageDownLoader.getCurrentWeatherImg.currentWeatherImg( currentWeather.icon, imageView: currentWeatherIcon)
        }
    }
}

