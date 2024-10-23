//
//  Extension+UIView.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit


extension UIView {
    
    func circle(size: Size) -> UIView {
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = size.scaleWidth(150)/2
        self.backgroundColor = .colorBlack1
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: size.scaleWidth(150)).isActive = true
        self.heightAnchor.constraint(equalToConstant: size.scaleWidth(150)).isActive = true
        return self
    }
    
}
