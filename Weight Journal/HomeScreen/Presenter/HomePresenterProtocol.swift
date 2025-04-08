//
//  HomePresenterProtocol.swift
//  Weight Journal
//
//  Created by Данила on 29.03.2025.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    /// update view
    func fetchData()
    /// buttonsAction
    func buttonWeightTapped()
    func buttonCaloriesTapped()
}
