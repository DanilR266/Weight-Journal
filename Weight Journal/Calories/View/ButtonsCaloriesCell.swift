//
//  ButtonsCaloriesCell.swift
//  Weight Journal
//
//  Created by Данила on 11.11.2024.
//

import Foundation
import UIKit


class ButtonsCaloriesCell: UITableViewCell {
    
    let size = Size()
    
    lazy var unView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorFhy
        view.layer.cornerRadius = size.scaleHeight(15)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(343)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var arrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowRight")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: size.scaleWidth(24)).isActive = true
        image.heightAnchor.constraint(equalToConstant: size.scaleWidth(24)).isActive = true
        return image
    }()
    
    private func setupView() {
        contentView.addSubview(unView)
        contentView.addSubview(label)
        contentView.addSubview(arrow)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            unView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            unView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            arrow.centerYAnchor.constraint(equalTo: unView.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: unView.trailingAnchor, constant: -size.scaleWidth(20)),
            
            label.centerYAnchor.constraint(equalTo: unView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: unView.leadingAnchor, constant: size.scaleWidth(20)),
            label.trailingAnchor.constraint(equalTo: arrow.leadingAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
