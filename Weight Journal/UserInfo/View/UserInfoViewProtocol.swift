//
//  UserInfoViewProtocol.swift
//  Weight Journal
//
//  Created by Данила on 26.03.2025.
//

import Foundation

protocol UserInfoViewProtocol: AnyObject, LoaderProtocol {
    
    /// updateView
    func updateViewDidload(name: String)
    func setSelectGoal(goal: SelectGoal)
    func setSizeImageManWomen(sex: SelectedSex)
    func setNextPage(page: Int)
}
