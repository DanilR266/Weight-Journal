//
//  CaloriesInfoServerManager.swift
//  Weight Journal
//
//  Created by Данила on 04.04.2025.
//

import Foundation

protocol CaloriesInfoServerManagerProtocol {
    func getCaloriesInfo() async throws -> CaloriesInfoGet
    func setCaloriesInfo(caloriesInfo: CaloriesInfoToServer) async throws
}

final class CaloriesInfoServerManager: CaloriesInfoServerManagerProtocol {
    
    static let shared = CaloriesInfoServerManager()
    
    func setCaloriesInfo(caloriesInfo: CaloriesInfoToServer) async throws {
        guard let token = try TokenStorage.get() else { throw NSError(domain: "Invalid response", code: -1, userInfo: nil) }
        var urlRequest = URLRequest(url: URL(string: ServerConstants.putCaloriesInfo)!)
        urlRequest.httpMethod = "PUT"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(caloriesInfo)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        
        do {
            let _ = try JSONDecoder().decode(SuccesPutDataInformation.self, from: data)
        } catch {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
    }
    
    func getCaloriesInfo() async throws -> CaloriesInfoGet {
        guard let token = try TokenStorage.get() else { throw NSError(domain: "Invalid response", code: -1, userInfo: nil) }
        var urlRequest = URLRequest(url: URL(string: ServerConstants.getCaloriesInfo)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        do {
            let answer = try JSONDecoder().decode(CaloriesInfoGet.self, from: data)
            return answer
        } catch {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
    }
    
}
