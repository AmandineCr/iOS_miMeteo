//
//  singleDateCell.swift
//  miMeteo
//
//  Created by etudiant on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class SingleDataCell: UICollectionViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var degrees: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    
    var forecast: Forecast!
    
    func setup(forecast: Forecast) {
        
        layer.cornerRadius = 30
        self.forecast = forecast
        ImageDownloader.getCurrentWeatherImg.currentWeatherImg(self.forecast.icon, imageView: icon)
        
        degrees.text = self.forecast.degrees.convertIntToString()
        descript.text = self.forecast.day + "   " + (DateHelper.getDateHelper.hour(self.forecast.date) ?? "") + "\n" + self.forecast.description
    }
}
