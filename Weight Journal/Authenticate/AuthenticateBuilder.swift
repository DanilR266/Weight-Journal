//
//  AuthenticateBuilder.swift
//  Weight Journal
//
//  Created by Данила on 25.03.2025.
//

import Foundation
import UIKit

final class AuthenticateBuilder {
    static func authenticateBuild() -> UIViewController {
        let view = AuthenticateViewController()
        let presenter = AuthenticatePresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
}
