//
//  WeightInfoModelServer.swift
//  Weight Journal
//
//  Created by Данила on 31.03.2025.
//

import Foundation

struct WeightInfoToServer: Codable {
    let currentWeight, targetWeight: Double
    let weightHistory: [String: Double]

    enum CodingKeys: String, CodingKey {
        case currentWeight = "current_weight"
        case targetWeight = "target_weight"
        case weightHistory = "weight_history"
    }
}

struct WeightInfoGet: Codable {
    let id, userID: Int
    var weightNow, weightGoal: Double
    var weightHistory: [String: Double]

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case weightNow = "weight_now"
        case weightGoal = "weight_goal"
        case weightHistory = "weight_history"
    }
}

struct SuccesPutDataInformation: Codable {
    let message: String
}
