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
    var uid: String
    var caloriesGoal: Int
    var age: Int
    var height: Int
    var weightNow: Int
    var weightGoal: Int
    var sex: String
    var caloriesNow: Int
    var max: Int
    var min: Int
    var savedFood: [String]
    var foodDate: [String: String]
    var weightDate: [String: String]
    var caloriesDate: [String: String]
}
