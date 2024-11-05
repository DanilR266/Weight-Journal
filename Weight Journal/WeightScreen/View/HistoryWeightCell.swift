//
//  HistoryWeightCell.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit


class HistoryWeightCell: UITableViewCell {
    
    let size = Size()
    
    lazy var labelDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelWeight: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sepView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.screenWidth()).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleHeight(1)).isActive = true
        return view
    }()
    
    private func setupView() {
        contentView.addSubview(labelDate)
        contentView.addSubview(labelWeight)
        contentView.addSubview(sepView)
        
        NSLayoutConstraint.activate([
            labelWeight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelWeight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.scaleWidth(20)),
            
            labelDate.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.scaleWidth(20)),
            labelDate.trailingAnchor.constraint(equalTo: labelWeight.leadingAnchor),
            
            sepView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            sepView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
