//
//  DateFormatterHelper.swift
//  Weight Journal
//
//  Created by Данила on 29.03.2025.
//

import Foundation

class DateFormatterHelper {
    static func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let today = Date()
        let dateString = dateFormatter.string(from: today)
        return dateString
    }
    
    static func compareDate(date1: String, date2: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date1 = dateFormatter.date(from: date1)
        let date2 = dateFormatter.date(from: date2)
        guard let date1, let date2 else {
            print("date nil")
            return false
        }
        return date1 < date2
    }
}

