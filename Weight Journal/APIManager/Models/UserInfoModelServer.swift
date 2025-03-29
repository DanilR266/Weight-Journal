//
//  UserInfoModelServer.swift
//  Weight Journal
//
//  Created by Данила on 27.03.2025.
//

import Foundation

struct UserInfo: Codable {
    var name: String
    var email: String
    var userID: Int
    var caloriesGoal: Int
    var age: Int
    var height: Double
    var weightNow: Double
    var weightGoal: Double
    var sex: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
        case email, age, sex, height
        case weightNow = "weight_now"
        case weightGoal = "weight_goal"
        case caloriesGoal = "calories_goal"
    }
}

struct Food: Codable {
    let id: Int
    let name: String
    let calories: Double
    let nutrients: [Double]
}
