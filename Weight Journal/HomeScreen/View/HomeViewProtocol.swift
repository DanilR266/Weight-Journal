//
//  HomeViewProtocol.swift
//  Weight Journal
//
//  Created by Данила on 29.03.2025.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    /// update view
    func reloadData(name: String)
    ///moved screen
    func moveToViewController(vc: UIViewController)
    func moveToRootController(vc: UIViewController)
}
