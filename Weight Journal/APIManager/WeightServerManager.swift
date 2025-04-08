//
//  WeightServerManager.swift
//  Weight Journal
//
//  Created by Данила on 31.03.2025.
//

import Foundation

protocol WeightServerManagerProtocol: AnyObject {
    func getWeightData() async throws -> WeightInfoGet
    func setWeightData(weightInfo: WeightInfoToServer) async throws
}

class WeightServerManager: WeightServerManagerProtocol {
    
    static let shared = WeightServerManager()
    
    func getWeightData() async throws -> WeightInfoGet {
        guard let token = try TokenStorage.get() else { throw NSError(domain: "Invalid response", code: -1, userInfo: nil) }
        var urlRequest = URLRequest(url: URL(string: ServerConstants.getWeightInfo)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        do {
            let answer = try JSONDecoder().decode(WeightInfoGet.self, from: data)
            return answer
        } catch {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
    }
    
    func setWeightData(weightInfo: WeightInfoToServer) async throws {
        guard let token = try TokenStorage.get() else { throw NSError(domain: "Invalid response", code: -1, userInfo: nil) }
        var urlRequest = URLRequest(url: URL(string: ServerConstants.putWeightInfo)!)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = try JSONEncoder().encode(weightInfo)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response Weight", code: -1, userInfo: nil)
        }

        do {
            let _ = try JSONDecoder().decode(SuccesPutDataInformation.self, from: data)
            
        } catch {
            throw NSError(domain: "Cannot decode data Weight", code: -1, userInfo: nil)
        }
    }
    
}
