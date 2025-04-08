//
//  ServerConstants.swift
//  Weight Journal
//
//  Created by Данила on 23.03.2025.
//

import Foundation

class ServerConstants {
    
    private static let domenAPI = "http://127.0.0.1:8000/"
    
    static let postAuthorization = "\(domenAPI)auth/register/"
    static let postLogin = "\(domenAPI)auth/login/"
    
    static let putUserInfo = "\(domenAPI)users/update_user_profile/"
    static let getUserInfo = "\(domenAPI)users/get_user_profile/"
    
    static let getWeightInfo = "\(domenAPI)weight/get_weight_info/"
    static let putWeightInfo = "\(domenAPI)weight/put_weight_info/"
    
}
