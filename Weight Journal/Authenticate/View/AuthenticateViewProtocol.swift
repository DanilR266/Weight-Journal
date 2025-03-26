//
//  AuthenticateViewProtocol.swift
//  Weight Journal
//
//  Created by Данила on 25.03.2025.
//

import Foundation
import UIKit

protocol AuthenticateViewProtocol: AnyObject, LoaderProtocol {
    
    /// update view
    func buttonsAnimation(_ alphaFirst: CGFloat, _ alphaSecond: CGFloat)
    func changeConstraint(_ constant: CGFloat, _ begin: Bool)
    
    /// navigation
    func pushViewController(vc: UIViewController)
}
