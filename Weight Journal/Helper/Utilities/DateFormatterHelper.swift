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
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let today = Date()
        let dateString = dateFormatter.string(from: today)
        return dateString
    }
}
