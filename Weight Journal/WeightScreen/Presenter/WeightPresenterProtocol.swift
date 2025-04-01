//
//  WeightPresenterProtocol.swift
//  Weight Journal
//
//  Created by Данила on 31.03.2025.
//

import Foundation
import UIKit

protocol WeightPresenterProtocol: AnyObject {
    /// fetch data
    func viewDidLoad()
    func setWeightData()
    /// process data
    func checkValidString(textField: NSString?, range: NSRange,
                          string: String, textFieldText: String?) -> Bool
    /// buttons Actions
    func backButton()
    func buttonPlus()
    func buttonMinus()
    
    ///tableView history
    func tableViewHistoryCount() -> Int
    func tableViewHistoryData() -> [TableViewHistoryData]
    func checkPreviousValue(index: Int) -> (String, UIColor)
}
