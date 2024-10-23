//
//  Extension+UILabel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit

extension UILabel {
    
    func labelTitle(text: String) -> UILabel {
        self.text = text
        self.font = .systemFont(ofSize: 20, weight: .medium)
        self.textColor = .colorBlack1
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func labelOnButton(text: String, size: Size) -> UILabel {
        self.text = text
        self.font = .systemFont(ofSize: 16, weight: .medium)
        self.textColor = .colorBlack1
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: size.scaleWidth(100)).isActive = true
        return self
    }
    
    func labelWeightScreen(text: String, size: Size) -> UILabel {
        self.text = text
        self.font = .systemFont(ofSize: 16, weight: .medium)
        self.textColor = .colorBlack1
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
