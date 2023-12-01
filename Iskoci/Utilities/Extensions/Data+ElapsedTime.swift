//
//  Data+ElapsedTime.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import Foundation

extension Date {
    var elapsedTimeString: String {
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return ("pre \(year) godine")
        }
        else if let month = interval.month, month > 0 {
            return month == 1 ? ("pre \(month) mesec") : ("pre \(month) meseca")
        }
        else if let day = interval.day, day > 0 {
            return day == 1 ? ("pre \(day) dan") : ("pre \(day) dana")
        }
        else if let hours = interval.hour, hours > 0 {
            return hours == 1 ? ("pre \(hours) sati") : ("pre \(hours) sata")
        }
        else if let minutes = interval.minute, minutes > 0 {
            return minutes == 1 ? ("pre \(minutes) minut") : ("pre \(minutes) minuta")
        }
        return "malopre"
    }
}
