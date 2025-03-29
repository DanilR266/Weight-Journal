//
//  ServerConstants.swift
//  Weight Journal
//
//  Created by Данила on 23.03.2025.
//

import Foundation

class ServerConstants {
    
    private static let domenAPI = "http://127.0.0.1:8000/"
    
    static let postAuthorization = "\(domenAPI)register"
    static let postLogin = "\(domenAPI)login"
    
    static let putUserInfo = "\(domenAPI)update_user_profile/"
    static let getUserInfo = "\(domenAPI)get_user_profile/"
    
}
