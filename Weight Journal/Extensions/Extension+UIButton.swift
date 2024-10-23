//
//  Extension+UIButton.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit


extension UIButton {
    
    func buttonMainScreen(size: Size) -> UIButton {
        self.backgroundColor = .colorFhy
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: size.scaleWidth(165)).isActive = true
        self.heightAnchor.constraint(equalToConstant: size.scaleHeight(200)).isActive = true
        return self
    }
    
    func buttonLogIn(size: Size, text: String) -> UIButton {
        self.backgroundColor = .colorBlack1
        self.layer.cornerRadius = 10
        self.setTitle(text, for: .normal)
        self.setTitleColor(.someTextColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: size.scaleHeight(50)).isActive = true
        self.widthAnchor.constraint(equalToConstant: size.scaleWidth(343)).isActive = true
        return self
    }
    
    func buttonPlusMinus(image: UIImage, size: Size) -> UIButton {
        self.setImage(image, for: .normal)
        self.tintColor = .colorBlack1
        self.imageView?.contentMode = .scaleAspectFit
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        self.imageView?.heightAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        self.heightAnchor.constraint(equalToConstant: size.scaleHeight(30)).isActive = true
        return self
    }
    
}
