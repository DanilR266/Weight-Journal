//
//  UserModel.swift
//  Weight Journal
//
//  Created by Данила on 25.10.2024.
//

import Foundation


struct UserInfo: Codable {
    var name: String
    var email: String
    var id: Int
    var caloriesGoal: Int
    var age: Int
    var height: Double
    var weightNow: Double
    var weightGoal: Double
    var sex: String
    var caloriesNow: Int
    var max: Double
    var min: Double
    var savedFood: [Food]
    var foodDate: [String: Food]
    var weightDate: [String: String]
    var caloriesDate: [String: String]
}

struct Food: Codable {
    let id: Int
    let name: String
    let calories: Double
    let nutrients: [Double]
}
