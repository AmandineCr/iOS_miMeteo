//
//  DayCell.swift
//  miMeteo
//
//  Created by Maintenance on 11/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

   
    @IBOutlet weak var icone: UIImageView!
    @IBOutlet weak var texte: UILabel!
    
    var day: DayForecast!
    
    func putInPlace(forecast:DayForecast){
        day = forecast
        ImageDownloader.getCurrentWeatherImg.currentWeatherImg(day.icon, imageView: icone)
        let attributed = NSMutableAttributedString(string: day.day + "\n", attributes: [.font:UIFont.boldSystemFont(ofSize: 22), .foregroundColor:UIColor.darkGray])
        let descString = NSAttributedString(string: day.description + "\n", attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor:UIColor.black])
        let temperatures = NSAttributedString(string: "Mini " + day.min.convertIntToString() + " - Max: " + day.max.convertIntToString(), attributes: [.font: UIFont.systemFont(ofSize: 20), .foregroundColor:UIColor.black])
        attributed.append(descString)
        attributed.append(temperatures)
        texte.attributedText = attributed
        
    }
    
    
}
