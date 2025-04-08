//
//  UserInfoModel.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation

class CaloriesCalculator {
    func getCurrentCcal(_ age: Int, _ height: Double, _ weight: Double, _ sex: SelectedSex, _ goal: SelectGoal) -> Int {
        let param1 = 10 * weight
        let param2 = 6.25 * height
        let param3 = 5 * age
        let value = param1 + param2 - Double(param3)
        switch sex {
        case .man:
            switch goal {
            case .up:
                return Int((value + 5) * 1.55 * 1.15)
            case .down:
                return Int((value + 5) * 1.55 * 0.85)
            case .regular:
                return Int((value + 5) * 1.55)
            }
        case .women:
            switch goal {
            case .up:
                return Int((value - 161) * 1.55 * 1.15)
            case .down:
                return Int((value - 161) * 1.55 * 0.85)
            case .regular:
                return Int((value - 161) * 1.55)
            }
        case .none:
            return 0
        }
    }
}
