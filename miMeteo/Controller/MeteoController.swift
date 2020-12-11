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
    
    let forecastCell = "ForecastCell"
       
    var locationManager: CLLocationManager?
    var forecasts = [Forecast]()
    var daysForecast = [DayForecast]()
    var day = UIColor(red: 0, green: 191 / 255 , blue: 1, alpha: 1)
    var night = UIColor(red: 19 / 255, green: 24 / 255 , blue: 98 / 255, alpha: 1)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        CLLocationSetup()
        tableViewSetup()
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
                                                                self.forecasts.append(newForecast)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            self.currentValueSetup()
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    func currentValueSetup(){
        if forecasts.count > 0 {
            let currentWeather = forecasts[0]
            degreesLabel.text = currentWeather.degrees.convertIntToString()
            currentWeatherDescription.text = currentWeather.description
            ImageDownloader.getCurrentWeatherImg.currentWeatherImg( currentWeather.icon, imageView: currentWeatherIcon)
            if currentWeather.icon.contains("d"){
                view.backgroundColor = day
            } else {
                view.backgroundColor = night
            }
        }
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
        self.tableView.reloadData()
        
    }
}

