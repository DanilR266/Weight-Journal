//
//  Extension+UITextField.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit


extension UITextField {
    
    func authField(size: Size, placeholder: String) -> UITextField {
        self.textColor = .colorBlack1
        self.backgroundColor = .colorFhy
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: size.scaleHeight(50)).isActive = true
        self.placeholder = placeholder
        self.textRect(forBounds: bounds).inset(by: UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 0))
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: size.scaleWidth(13), height: self.frame.size.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always
        return self
    }
    
}
