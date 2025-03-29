//
//  UserInfoBuild.swift
//  Weight Journal
//
//  Created by Данила on 26.03.2025.
//

import Foundation
import UIKit

final class UserInfoBuilder {
    static func build(name: String, email: String, userId: Int) -> UIViewController {
        let view = UserInfoController()
        let presenter = UserInfoPresenter(view: view, name: name, email: email, userId: userId)
        
        view.presenter = presenter
        
        return view
    }
}
