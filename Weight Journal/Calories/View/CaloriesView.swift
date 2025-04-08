//
//  CaloriesView.swift
//  Weight Journal
//
//  Created by Данила on 11.11.2024.
//

import Foundation
import UIKit


class CaloriesView: RootView {
    
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
    
    let roundedView = PercentageBorderView()
    
    lazy var labelFast: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = StringConstantsCalories.fastChange
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var unViewSlider: UIView = {
        let view = UIView()
        view.backgroundColor = .colorFhy
        view.layer.cornerRadius = size.scaleHeight(15)
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(343)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return view
    }()
    
    lazy var slider: CustomSlider = {
        let slider = CustomSlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override func setupView() {
        addSubview(buttonBack)
        addSubview(titleLabel)
        addSubview(labelNow)
        addSubview(labelGoal)
        addSubview(roundedView)
        addSubview(labelFast)
        addSubview(unViewSlider)
        unViewSlider.addSubview(slider)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(62)),
            buttonBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            
            titleLabel.centerYAnchor.constraint(equalTo: buttonBack.centerYAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: buttonBack.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            labelNow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(19)),
            labelNow.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: size.scaleHeight(28)),
            labelNow.trailingAnchor.constraint(equalTo: centerXAnchor),
            
            labelGoal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(19)),
            labelGoal.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: size.scaleHeight(28)),
            labelGoal.leadingAnchor.constraint(equalTo: centerXAnchor),
            
            roundedView.widthAnchor.constraint(equalToConstant: size.scaleWidth(143)),
            roundedView.heightAnchor.constraint(equalToConstant: size.scaleWidth(143)),
            roundedView.centerXAnchor.constraint(equalTo: centerXAnchor),
            roundedView.topAnchor.constraint(equalTo: labelGoal.bottomAnchor, constant: size.scaleHeight(30)),
            
            labelFast.leadingAnchor.constraint(equalTo: labelNow.leadingAnchor),
            labelFast.topAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: size.scaleHeight(37)),
            
            unViewSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            unViewSlider.topAnchor.constraint(equalTo: labelFast.bottomAnchor, constant: size.scaleHeight(10)),
            
            slider.leadingAnchor.constraint(equalTo: unViewSlider.leadingAnchor, constant: size.scaleWidth(20)),
            slider.trailingAnchor.constraint(equalTo: unViewSlider.trailingAnchor, constant: -size.scaleWidth(20)),
            slider.topAnchor.constraint(equalTo: unViewSlider.topAnchor),
            slider.bottomAnchor.constraint(equalTo: unViewSlider.bottomAnchor)
            
        ])
    }
    
}

class CustomSlider: UIView {

    
    let size = Size()
    private let trackLayer = CALayer()
    let thumbView = UIView()
    var sliderValue: Int = 0 {
        didSet {
            updateThumbPosition()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSlider()
    }

    private func setupSlider() {
        trackLayer.backgroundColor = UIColor.gray.cgColor
        trackLayer.cornerRadius = size.scaleHeight(5)
        layer.addSublayer(trackLayer)
        thumbView.backgroundColor = .black
        thumbView.layer.borderColor = UIColor.customYellow.cgColor
        thumbView.layer.borderWidth = 4
        thumbView.layer.cornerRadius = size.scaleHeight(12.5)
        addSubview(thumbView)
        updateThumbPosition()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let trackHeight: CGFloat = size.scaleHeight(10)
        trackLayer.frame = CGRect(x: 0, y: (bounds.height - trackHeight) / 2, width: bounds.width, height: trackHeight)
        thumbView.frame.size = CGSize(width: size.scaleWidth(25), height: size.scaleWidth(25))
        updateThumbPosition()
    }


    func updateThumbPosition() {
        let centerX = bounds.width / 2
        if sliderValue > 150 {
            sliderValue = 150
        }
        if sliderValue < -150 {
            sliderValue = -150
        }
        var thumbX = centerX + CGFloat(sliderValue)
        thumbView.center = CGPoint(x: CGFloat(thumbX), y: bounds.height / 2)
    }
}
