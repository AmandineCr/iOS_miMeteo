//
//  tableViewExtension.swift
//  miMeteo
//
//  Created by etudiant on 10/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

extension MeteoController: UITableViewDelegate, UITableViewDataSource {
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: forecastCell) as? ForecastCell {
                cell.setup(forecasts: forecasts)
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        }
        return 100
    }
}
