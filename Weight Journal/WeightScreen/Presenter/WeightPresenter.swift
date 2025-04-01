//
//  WeightViewModel.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit

class WeightPresenter {

    private let weightModelServer: WeightServerManagerProtocol
    private var weightNow: Double = 0
    private var weightGoal: Double = 0
    private var weightHistory = [String: Double]()
    private var weightHistoryArray = [TableViewHistoryData]()
    
    private weak var view: WeightViewProtocol?
    private let userTarget: SelectGoal
    init(view: WeightViewProtocol, userTarger: SelectGoal, weightModelServer: WeightServerManagerProtocol = WeightServerManager.shared) {
        self.view = view
        self.userTarget = userTarger
        self.weightModelServer = weightModelServer
    }
}

extension WeightPresenter: WeightPresenterProtocol {
    func checkPreviousValue(index: Int) -> (String, UIColor) {
        if index == 0 {
            return ("0.0", .colorProgressYellow)
        }
        else {
            let different = weightHistoryArray[index - 1].weight - weightHistoryArray[index].weight
            switch userTarget {
            case .down:
                if different < 0 {
                    return ("+ \(abs(different).rounded(toDecimalPlaces: 1))", .colorProgressRed)
                }
                else if different > 0 {
                    return ("- \(abs(different).rounded(toDecimalPlaces: 1))", .colorProgressGreen)
                }
                else {
                    return ("0.0", .colorProgressYellow)
                }
            case .up:
                if different > 0 {
                    return ("+ \(abs(different).rounded(toDecimalPlaces: 1))", .colorProgressRed)
                }
                else if different < 0 {
                    return ("- \(abs(different).rounded(toDecimalPlaces: 1))", .colorProgressGreen)
                }
                else {
                    return ("0.0", .colorProgressYellow)
                }
            case .regular:
                if different > 0 {
                    return ("+ \(abs(different).rounded(toDecimalPlaces: 1))", .colorProgressRed)
                }
                else if different < 0 {
                    return ("- \(abs(different).rounded(toDecimalPlaces: 1))", .colorProgressRed)
                }
                else {
                    return ("0.0", .colorProgressGreen)
                }
            }
        }
    }
    
    func tableViewHistoryCount() -> Int {
        return weightHistory.count
    }
    
    func tableViewHistoryData() -> [TableViewHistoryData] {
        return weightHistoryArray
    }
    
    func setWeightData() {
        let weightInfo = WeightInfoToServer(currentWeight: weightNow.rounded(toDecimalPlaces: 1), targetWeight: weightGoal.rounded(toDecimalPlaces: 1), weightHistory: weightHistory)
        Task {
            do {
                try await weightModelServer.setWeightData(weightInfo: weightInfo)
            } catch {
            }
        }
    }
    
    func backButton() {
        view?.moveToPreviousView()
    }
    
    func buttonPlus() {
        weightNow += 0.1
        updateHistoryWeight(weightNow)
        let stringWeight = String(format: "%.1f", weightNow)
        view?.updateFieldWeight(text: stringWeight)
        view?.updateTableViewAndGraph(data: weightHistoryArray)
    }
    
    func buttonMinus() {
        weightNow -= 0.1
        updateHistoryWeight(weightNow)
        let stringWeight = String(format: "%.1f", weightNow)
        view?.updateFieldWeight(text: stringWeight)
        view?.updateTableViewAndGraph(data: weightHistoryArray)
    }
    
    func viewDidLoad() {
        Task {
            do {
                let success = try await weightModelServer.getWeightData()
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    self.view?.updateDataAfterFetch(weightNow: "\(success.weightNow)", weightGoal: "\(success.weightGoal)")
                    self.weightHistory = success.weightHistory
                    self.weightNow = success.weightNow
                    self.weightGoal = success.weightGoal
                    self.weightHistoryArray = convertToSortedArray()
                    self.view?.updateTableViewAndGraph(data: weightHistoryArray)
                }
            } catch {
                print(error)
            }
        }
    }
    func checkValidString(textField: NSString?, range: NSRange,
                          string: String, textFieldText: String?) -> Bool {
        return ValidationTextFieldInput.shared.checkValidString(textField: textField, range: range, string: string, textFieldText: textFieldText)
    }
}

private extension WeightPresenter {
    func updateHistoryWeight(_ weight: Double) {
        let key = DateFormatterHelper.dateFormatter()
        weightHistory[key] = weight.rounded(toDecimalPlaces: 1)
        weightHistoryArray = convertToSortedArray()
    }
    
    func convertToSortedArray() -> [TableViewHistoryData] {
        var weightHistoryArray: [TableViewHistoryData] = []
        for i in weightHistory.sorted(by: { DateFormatterHelper.compareDate(date1: $0.key, date2: $1.key) }) {
            let item = TableViewHistoryData(date: i.key, weight: i.value)
            weightHistoryArray.append(item)
        }
        return weightHistoryArray
    }
}
