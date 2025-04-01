//
//  WeightBuilder.swift
//  Weight Journal
//
//  Created by Данила on 31.03.2025.
//

import Foundation
import UIKit

final class WeightBuilder {
    static func build(userTarget: SelectGoal) -> UIViewController {
        let view = WeightController()
        let presenter = WeightPresenter(view: view, userTarger: userTarget)
        
        view.presenter = presenter
        
        return view
    }
}
