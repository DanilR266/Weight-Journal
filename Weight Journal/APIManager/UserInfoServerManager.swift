//
//  UserInfoServerManager.swift
//  Weight Journal
//
//  Created by Данила on 26.03.2025.
//

import Foundation

struct UserInfoSuccess: Codable {
    let text: String
}

protocol UserInfoServerManagerProtocol {
    
    func setUserInfo(user: UserInfo) async throws -> UserInfoSuccess
    func getUserInfo() async throws -> UserInfo
    
}

final class UserInfoServerManager: UserInfoServerManagerProtocol {
    
    static let shared = UserInfoServerManager()
    
    func setUserInfo(user: UserInfo) async throws -> UserInfoSuccess {
        guard let token = try TokenStorage.get() else { throw NSError(domain: "Invalid response", code: -1, userInfo: nil) }
        var urlRequest = URLRequest(url: URL(string: ServerConstants.putUserInfo)!)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = try JSONEncoder().encode(user)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        
        let answer = try JSONDecoder().decode(UserInfoSuccess.self, from: data)
        return answer
    }
    
    func getUserInfo() async throws -> UserInfo {
        guard let token = try TokenStorage.get() else { throw NSError(domain: "Invalid response", code: -1, userInfo: nil) }
        print("Token2: ", token)
        print("URL: ", ServerConstants.getUserInfo)
        var urlRequest = URLRequest(url: URL(string: ServerConstants.getUserInfo)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        do {
            let answer = try JSONDecoder().decode(UserInfo.self, from: data)
            return answer
        } catch {
            print("No decode")
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
    }
    
}
