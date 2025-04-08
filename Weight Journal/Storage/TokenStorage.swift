//
//  TokenStorage.swift
//  Weight Journal
//
//  Created by Данила on 25.03.2025.
//

import Foundation
import Security

struct TokenStorage {
    private static let service = "com.yourapp.auth"
    private static let account = "access_token"
    
    static func save(token: String) throws {
        guard let data = token.data(using: .utf8) else { return }
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: data
        ]
        
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { throw NSError(domain: "error save", code: -1, userInfo: nil) }
    }
    
    static func get() throws -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess,
              let data = result as? Data,
              let token = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return token
    }
    
    static func delete() throws {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess else { throw NSError(domain: "error delete", code: -1, userInfo: nil) }
    }
}
