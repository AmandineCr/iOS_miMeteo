//
//  TableViewExtension.swift
//  miMeteo
//
//  Created by Maintenance on 11/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

extension MeteoController: UITableViewDelegate, UITableViewDataSource {
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysForecast.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: forecastCell) as? ForecastCell {
                cell.setup(forecasts: forecasts)
                return cell
            }else{
                let forecast = daysForecast[indexPath.row - 1]
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as? DayCell {
                    cell.putInPlace(forecast: forecast)
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        }
        return 100
    }
}
