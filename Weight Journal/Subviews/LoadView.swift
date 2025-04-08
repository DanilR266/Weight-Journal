//
//  LoadView.swift
//  Weight Journal
//
//  Created by Данила on 04.11.2024.
//

import Foundation
import UIKit


class LoadView: RootView {
    
    lazy var unView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.screenWidth()).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.screenHeight()).isActive = true
        return view
    }()
    
    override func setupView() {
        addSubview(unView)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            unView.topAnchor.constraint(equalTo: topAnchor),
            unView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}
