//
//  Extension+Double.swift
//  Weight Journal
//
//  Created by Данила on 01.04.2025.
//

import Foundation

extension Double {
    func rounded(toDecimalPlaces places: Int) -> Double {
        let multiplier = pow(10.0, Double(places))
        return (self * multiplier).rounded() / multiplier
    }
}
