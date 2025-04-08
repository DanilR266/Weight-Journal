//
//  WeightViewProtocol.swift
//  Weight Journal
//
//  Created by Данила on 31.03.2025.
//

import Foundation

protocol WeightViewProtocol: AnyObject, LoaderProtocol {
    /// update views
    func updateDataAfterFetch(weightNow: String, weightGoal: String)
    func updateTableViewAndGraph(dataX: [String], dataY: [CGFloat])
    func updateFieldWeight(text: String)
    
    /// buttons actions
    func moveToPreviousView()
}
