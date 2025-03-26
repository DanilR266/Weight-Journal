//
//  BaseClassView.swift
//  Weight Journal
//
//  Created by Данила on 02.11.2024.
//

import Foundation
import UIKit


class RootView: UIView {
    
    let size = Size()
    
    func setupConstraints() { }
    func setupView() { }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
