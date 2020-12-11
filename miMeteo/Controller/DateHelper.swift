//
//  DateHelper.swift
//  miMeteo
//
//  Created by etudiant on 10/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class DateHelper {
    
    static let getDateHelper = DateHelper()
    
    func convertStringToDate(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = formatter.date(from: string) {
            return date
        } else {
            return nil
        }
    }
    
    func weekDay(_ string: String) -> String? {
        if let date = convertStringToDate(string) {
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                return " Aujourd'hui"
            } else if calendar.isDateInTomorrow(date) {
                return "Demain"
            } else {
                let day = calendar.component(.weekday,from: date)
                
                switch day {
                case 1: return "Dimanche"
                case 2: return "Lundi"
                case 3: return "Mardi"
                case 4: return "Mercredi"
                case 5: return "Jeudi"
                case 6: return "Vendredi"
                default: return "Samedi"
                }
            }
        }
        return nil
    }
    
    func hour(_ string: String) -> String? {
        if let date = convertStringToDate(string) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return nil
    }
}
