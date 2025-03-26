//
//  UserInfoServerManager.swift
//  Weight Journal
//
//  Created by Данила on 26.03.2025.
//

import Foundation

struct UserInfoSuccess: Codable {
    
}

protocol UserInfoServerManagerProtocol {
    
    func setUserInfo(user: UserInfo) async throws -> UserInfoSuccess 
    
}

final class UserInfoServerManager: UserInfoServerManagerProtocol {
    
    static let shared = UserInfoServerManager()
    
    func setUserInfo(user: UserInfo) async throws -> UserInfoSuccess {
        return UserInfoSuccess()
    }
    
}
