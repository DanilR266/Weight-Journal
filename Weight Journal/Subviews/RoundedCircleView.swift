//
//  RoundedCircleView.swift
//  Weight Journal
//
//  Created by Данила on 11.11.2024.
//

import Foundation
import UIKit


class PercentageBorderView: UIView {
    var borderWidth: CGFloat = 8.0
    var borderPercentage: CGFloat = 0.2 {
        didSet { setNeedsLayout() }
    }

    private let blackBorderLayer = CAShapeLayer()
    private let yellowBorderLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBorders()
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBorders()
    }

    private func setupBorders() {
        layer.addSublayer(blackBorderLayer)
        layer.addSublayer(yellowBorderLayer)

        blackBorderLayer.fillColor = UIColor.clear.cgColor
        blackBorderLayer.strokeColor = UIColor.colorBlack1.cgColor

        yellowBorderLayer.fillColor = UIColor.clear.cgColor
        yellowBorderLayer.strokeColor = UIColor.customYellow.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let radius = (min(bounds.width, bounds.height) - borderWidth) / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let startAngle = -CGFloat.pi / 2

        let blackEndAngle = startAngle + 2 * .pi * borderPercentage
        blackBorderLayer.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: blackEndAngle, clockwise: true).cgPath
        blackBorderLayer.lineWidth = borderWidth

        let yellowStartAngle = blackEndAngle
        let yellowEndAngle = startAngle + 2 * .pi
        yellowBorderLayer.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: yellowStartAngle, endAngle: yellowEndAngle, clockwise: true).cgPath
        yellowBorderLayer.lineWidth = borderWidth
    }
}



