//
//  extention.swift
//  miMeteo
//
//  Created by Maintenance on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import Foundation


extension Double{
    
    func convertIntToString()-> String{
        let tempAVirgule = Int(self)
        return String(tempAVirgule) + "°C"
    }
}
