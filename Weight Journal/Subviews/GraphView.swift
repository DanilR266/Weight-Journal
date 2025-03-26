//
//  GraphView.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit


class GraphView: UIView {
    var dataPoints: [(key: String, value: Double)] = []

    override func draw(_ rect: CGRect) {
        guard !dataPoints.isEmpty else { return }

        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.colorBlack1.cgColor)
        context.setLineWidth(3.0)

        let sortedDataPoints = dataPoints.sorted { $0.key < $1.key }
        let maxValue = sortedDataPoints.map { $0.value }.max() ?? 0
        let minValue = sortedDataPoints.map { $0.value }.min() ?? 0

        let margin: CGFloat = 20
        let graphWidth = rect.width - 2 * margin
        let graphHeight = rect.height - 2 * margin

        let xSpacing = graphWidth / CGFloat(sortedDataPoints.count - 1)

        context.move(to: CGPoint(x: margin, y: graphHeight - CGFloat((sortedDataPoints[0].value - minValue) / (maxValue - minValue)) * graphHeight + margin))

        for (index, point) in sortedDataPoints.enumerated() {
            let x = margin + CGFloat(index) * xSpacing
            let y = graphHeight - CGFloat((point.value - minValue) / (maxValue - minValue)) * graphHeight + margin
            context.addLine(to: CGPoint(x: x, y: y))
        }

        context.strokePath()

        for (index, point) in sortedDataPoints.enumerated() {
            let x = margin + CGFloat(index) * xSpacing
            let y = graphHeight - CGFloat((point.value - minValue) / (maxValue - minValue)) * graphHeight + margin
            let pointSize: CGFloat = 8
            let pointRect = CGRect(x: x - pointSize / 2, y: y - pointSize / 2, width: pointSize, height: pointSize)

            context.setStrokeColor(UIColor.customYellow.cgColor)
            context.setLineWidth(2.0)
            context.strokeEllipse(in: pointRect)

            context.setFillColor(UIColor.colorBlack1.cgColor)
            context.fillEllipse(in: pointRect)
        }
    }
}
