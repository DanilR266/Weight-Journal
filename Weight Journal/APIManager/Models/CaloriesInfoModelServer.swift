//
//  CaloriesInfoModelServer.swift
//  Weight Journal
//
//  Created by Данила on 04.04.2025.
//

import Foundation

struct CaloriesInfoGet: Codable {
    let caloriesNow: Int
    let caloriesGoal: Int
    let foodDate: [String: [Food]]
    let foodSaved: [Food]
    
    enum CodingKeys: String, CodingKey {
        case caloriesNow = "calories_now"
        case caloriesGoal = "calories_goal"
        case foodDate = "food_date"
        case foodSaved = "food_saved"
    }
}

struct CaloriesInfoToServer: Codable {
    let calories, caloriesGoal: Int
    let foodDate: [String: [Food]]
    let foodSaved: [Food]

    enum CodingKeys: String, CodingKey {
        case calories
        case caloriesGoal = "calories_goal"
        case foodDate = "food_date"
        case foodSaved = "food_saved"
    }
}

struct Food: Codable {
    let id: Int
    let name: String
    let calories: Double
    let nutrients: [Double]
}
