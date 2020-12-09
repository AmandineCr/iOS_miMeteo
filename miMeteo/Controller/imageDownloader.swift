//
//  imageDownloader.swift
//  miMeteo
//
//  Created by Maintenance on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class ImageDownLoader {
    
    static let getCurrentWeatherImg = ImageDownLoader()
    
    func currentWeatherImg(_ string: String, imageView: UIImageView){
        let urlOpenWeather = "http://openweathermap.org/img/w/"
        let ext = ".png"
        if let url = URL(string: urlOpenWeather + string + ext){
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
            guard data != nil, let image = UIImage(data: data!) else {return}
            DispatchQueue.main.async {
                imageView.image = image
            }
        })
        task.resume()
    }
}
}

