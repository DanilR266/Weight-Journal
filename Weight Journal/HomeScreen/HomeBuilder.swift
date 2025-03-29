//
//  HomeBuilder.swift
//  Weight Journal
//
//  Created by Данила on 29.03.2025.
//

import Foundation
import UIKit

final class HomeBuilder {
    static func build() -> UIViewController {
        let view = HomeController()
        let presenter = HomePresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
}
