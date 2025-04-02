//
//  GraphView.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit

class GraphView: UIView {
    
    let size = Size.shared

    var dataX: [String] = [] {
        didSet {
            removeOldLabels()
            setNeedsDisplay()
        }
    }

    var dataY: [CGFloat] = []

    var lineColor: CGColor = UIColor.black.cgColor
    var pointColor: CGColor = UIColor.customYellow.cgColor
    var axisColor: UIColor = .white

    var lineWidth: CGFloat = 2.0
    var pointSize: CGFloat = 5.0

    private var axisLabels: [UILabel] = []
    private var dataPoints: [CGPoint] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setDataXDataY(dataXNew: [String], dataYNew: [CGFloat]) {
        dataX = dataXNew
        dataY = dataYNew
    }

    private func removeOldLabels() {
        for label in axisLabels {
            label.removeFromSuperview()
        }
        axisLabels.removeAll()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext(), !dataX.isEmpty, !dataY.isEmpty else { return }
        context.clear(rect)
        dataPoints.removeAll()
        
        drawAxes(in: context, rect: rect)
        drawGraph(in: context, rect: rect)
    }

    private func drawAxes(in context: CGContext, rect: CGRect) {

        let minY = dataY.min() ?? 0
        let maxY = dataY.max() ?? 0
        let yRange = maxY - minY
        let yStep = yRange == 0 ? 1 : (rect.height - size.scaleHeight(40)) / CGFloat(yRange)
        for (_, value) in dataY.enumerated() {
            let y = rect.maxY - size.scaleHeight(20) - (CGFloat(value) - minY) * yStep
            let label = UILabel()
            label.font = .systemFont(ofSize: 10, weight: .regular)
            label.textColor = .black
            label.text = "\(value)"
            label.sizeToFit()
            label.frame.origin = CGPoint(x: rect.minX + size.scaleWidth(20), y: y - label.frame.height / 2 - size.scaleHeight(5))
            addSubview(label)
            axisLabels.append(label)
            
            context.saveGState()
            context.setStrokeColor(UIColor.white.cgColor)
            context.setLineWidth(1)
            let dashPattern: [CGFloat] = [3, 3]
            context.setLineDash(phase: 0, lengths: dashPattern)
            
            context.move(to: CGPoint(x: rect.minX + size.scaleWidth(60), y: y - size.scaleHeight(5)))
            context.addLine(to: CGPoint(x: rect.maxX, y: y - size.scaleHeight(5)))
            context.strokePath()
            context.restoreGState()
        }

        let xStep = (rect.width - size.scaleWidth(30)) / CGFloat(dataX.count)
        for (index, value) in dataX.enumerated() {
            let x = rect.minX + size.scaleWidth(60) + CGFloat(index) * xStep
            let label = UILabel()
            label.font = .systemFont(ofSize: 10, weight: .regular)
            label.textColor = .black
            label.text = value
            label.sizeToFit()
            label.frame.origin = CGPoint(x: x - label.frame.width / 2, y: rect.maxY - size.scaleHeight(20))
            addSubview(label)
            axisLabels.append(label)
        }
    }

    private func drawGraph(in context: CGContext, rect: CGRect) {
        guard dataX.count >= 1, dataY.count >= 1 else { return }
        context.saveGState()

        let minY = dataY.min() ?? 0
        let maxY = dataY.max() ?? 0
        let yRange = maxY - minY
        let yStep = yRange == 0 ? 1 : (rect.height - size.scaleHeight(40)) / CGFloat(yRange)
        let xStep = (rect.width - size.scaleWidth(30)) / CGFloat(dataX.count)

        for i in 0..<dataX.count - 1 {
            let x1 = rect.minX + size.scaleWidth(60) + CGFloat(i) * xStep
            let y1 = rect.maxY - size.scaleHeight(20) - (CGFloat(dataY[i]) - minY) * yStep
            let x2 = rect.minX + size.scaleWidth(60) + CGFloat(i + 1) * xStep
            let y2 = rect.maxY - size.scaleHeight(20) - (CGFloat(dataY[i + 1]) - minY) * yStep

            context.setStrokeColor(lineColor)
            context.setLineWidth(lineWidth)
            context.setLineCap(.square)
            context.move(to: CGPoint(x: x1, y: y1 - size.scaleHeight(5)))
            context.addLine(to: CGPoint(x: x2, y: y2 - size.scaleHeight(5)))
            context.strokePath()
        }

        for i in 0..<dataX.count {
            let x = rect.minX + size.scaleWidth(60) + CGFloat(i) * xStep
            let y = rect.maxY - size.scaleHeight(20) - (CGFloat(dataY[i]) - minY) * yStep
            dataPoints.append(CGPoint(x: x, y: y))

            let pointSizeToUse = pointSize * 2
            let pointRect = CGRect(x: x - pointSizeToUse / 2, y: y - pointSizeToUse / 2 - size.scaleHeight(5), width: pointSizeToUse, height: pointSizeToUse)

            context.setFillColor(pointColor)
            context.fillEllipse(in: pointRect)

            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(1)
            context.strokeEllipse(in: pointRect)
        }

        context.restoreGState()
    }
}
