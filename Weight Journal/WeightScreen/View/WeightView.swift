//
//  WeightView.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit


class WeightView: UIView {
    
    private let size = Size.shared
    private var graphView = GraphView()
    lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonBack"), for: [])
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        button.imageView?.heightAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.scaleWidth(30)).isActive = true
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstantsWeight.title
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var unViewWeight: UIView = {
        let view = UIView()
        view.backgroundColor = .colorFhy
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(343)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleHeight(94)).isActive = true
        return view
    }()
    
    lazy var buttonMinus: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonMinus"), for: [])
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        button.imageView?.heightAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        return button
    }()
    
    lazy var buttonPlus: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonPlus"), for: [])
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        button.imageView?.heightAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.scaleWidth(60)).isActive = true
        return button
    }()
    
    lazy var fieldWeight: UITextField = {
        let field = UITextField()
        field.text = "0"
        field.textColor = .black
        field.font = .systemFont(ofSize: 32, weight: .regular)
        field.textAlignment = .center
        field.translatesAutoresizingMaskIntoConstraints = false
//        field.heightAnchor.constraint(equalToConstant: size.scaleHeight(30)).isActive = true
        return field
    }()
    
    lazy var labelNow: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelGoal: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var unViewGraph: UIView = {
        let view = UIView()
        view.backgroundColor = .colorFhy
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(343)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleHeight(200)).isActive = true
        return view
    }()
    
    lazy var labelHistory: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = StringConstantsWeight.history
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        addSubview(buttonBack)
        addSubview(titleLabel)
        addSubview(unViewWeight)
        addSubview(buttonMinus)
        addSubview(buttonPlus)
        addSubview(fieldWeight)
        addSubview(labelNow)
        addSubview(labelGoal)
        addSubview(unViewGraph)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(62)),
            buttonBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            
            titleLabel.centerYAnchor.constraint(equalTo: buttonBack.centerYAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: buttonBack.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            labelNow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(12)),
            labelNow.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: size.scaleHeight(22)),
            
            labelGoal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(12)),
            labelGoal.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: size.scaleHeight(22)),
            
            unViewWeight.centerXAnchor.constraint(equalTo: centerXAnchor),
            unViewWeight.topAnchor.constraint(equalTo: labelGoal.bottomAnchor, constant: size.scaleHeight(34)),
            
            buttonMinus.centerYAnchor.constraint(equalTo: unViewWeight.centerYAnchor),
            buttonMinus.leadingAnchor.constraint(equalTo: unViewWeight.leadingAnchor, constant: size.scaleWidth(30)),
            
            buttonPlus.centerYAnchor.constraint(equalTo: unViewWeight.centerYAnchor),
            buttonPlus.trailingAnchor.constraint(equalTo: unViewWeight.trailingAnchor, constant: -size.scaleWidth(30)),
            
            fieldWeight.centerYAnchor.constraint(equalTo: unViewWeight.centerYAnchor),
            fieldWeight.leadingAnchor.constraint(equalTo: buttonMinus.trailingAnchor, constant: 3),
            fieldWeight.trailingAnchor.constraint(equalTo: buttonPlus.leadingAnchor, constant: -3),
            
            unViewGraph.centerXAnchor.constraint(equalTo: centerXAnchor),
            unViewGraph.topAnchor.constraint(equalTo: unViewWeight.bottomAnchor, constant: size.scaleHeight(24)),
        ])
    }
    
    private func setupGraph() {
        graphView.translatesAutoresizingMaskIntoConstraints = false
        graphView.backgroundColor = .graphColor
        graphView.layer.cornerRadius = 20
        graphView.layer.masksToBounds = true
        
        unViewGraph.addSubview(graphView)
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: unViewGraph.topAnchor, constant: size.scaleHeight(12)),
            graphView.leadingAnchor.constraint(equalTo: unViewGraph.leadingAnchor, constant: size.scaleWidth(32)),
            graphView.trailingAnchor.constraint(equalTo: unViewGraph.trailingAnchor, constant: -size.scaleWidth(12)),
            graphView.bottomAnchor.constraint(equalTo: unViewGraph.bottomAnchor, constant: -size.scaleHeight(24)),
        ])
    }
    
    func setGraphData(data: [TableViewHistoryData]) {
        graphView.dataPoints = data
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        setupView()
        setupConstraints()
        setupGraph()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
