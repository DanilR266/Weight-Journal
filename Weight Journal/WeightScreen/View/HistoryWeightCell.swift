//
//  HistoryWeightCell.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit


class HistoryWeightCell: UITableViewCell {
    
    let size = Size.shared
    
    lazy var unView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorFhy
        view.layer.cornerRadius = size.scaleHeight(10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(335)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleHeight(51)).isActive = true
        return view
    }()
    
    lazy var labelDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelProgress: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .colorProgressGreen
        label.textAlignment = .right
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
    
    func setupCell(textDate: String, textValue: String, textProgress: String, colorProgress: UIColor) {
        labelDate.text = textDate
        labelWeight.text = textValue
        labelProgress.text = textProgress
        labelProgress.textColor = colorProgress
    }
    
    private func setupView() {
        contentView.addSubview(unView)
        unView.addSubview(labelDate)
        unView.addSubview(labelWeight)
        unView.addSubview(labelProgress)
        
        NSLayoutConstraint.activate([
            unView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            unView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            labelDate.centerYAnchor.constraint(equalTo: unView.centerYAnchor),
            labelDate.leadingAnchor.constraint(equalTo: unView.leadingAnchor, constant: size.scaleWidth(20)),
            
            labelProgress.centerYAnchor.constraint(equalTo: unView.centerYAnchor),
            labelProgress.trailingAnchor.constraint(equalTo: unView.trailingAnchor, constant: -size.scaleWidth(20)),
            
            labelWeight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelWeight.trailingAnchor.constraint(equalTo: labelProgress.leadingAnchor, constant: -size.scaleWidth(20)),

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
