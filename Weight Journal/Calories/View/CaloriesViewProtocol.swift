//
//  CaloriesViewProtocol.swift
//  Weight Journal
//
//  Created by Данила on 04.04.2025.
//

import Foundation

protocol CaloriesViewProtocol: AnyObject, LoaderProtocol {
    func updatedView()
    func removeViewController()
}
