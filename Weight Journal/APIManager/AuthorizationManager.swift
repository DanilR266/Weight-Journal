//
//  AuthorizationManager.swift
//  Weight Journal
//
//  Created by Данила on 23.03.2025.
//

import Foundation

struct UserRegistration: Codable {
    let username: String
    let email: String
    let password: String
}

struct UserLogin: Codable {
    let email: String
    let password: String
}

struct UserRegistrationSuccess: Codable {
    let message: String
    let user_id: Int
    let access_token: String
    let name: String
    let email: String
}

struct UserLoginSuccess: Codable {
    let access_token: String
    let token_type: String
}

protocol AuthorizationManagerProtocol {
    func registrationUser(user: UserRegistration) async throws -> UserRegistrationSuccess
    func loginUser(user: UserLogin) async throws -> UserLoginSuccess
}

final class AuthorizationManager: AuthorizationManagerProtocol {
    
    static let shared = AuthorizationManager()
    
    func registrationUser(user: UserRegistration) async throws -> UserRegistrationSuccess {
        var urlRequest = URLRequest(url: URL(string: ServerConstants.postAuthorization)!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = try JSONEncoder().encode(user)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        let answer = try JSONDecoder().decode(UserRegistrationSuccess.self, from: data)
        try TokenStorage.save(token: answer.access_token)
        return answer
    }
    
    func loginUser(user: UserLogin) async throws -> UserLoginSuccess {
        var urlRequest = URLRequest(url: URL(string: ServerConstants.postLogin)!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = try JSONEncoder().encode(user)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        let answer = try JSONDecoder().decode(UserLoginSuccess.self, from: data)
        try TokenStorage.save(token: answer.access_token)
        return answer
    }
}
