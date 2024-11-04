//
//  UserInfoViewModelTests.swift
//  Weight JournalTests
//
//  Created by Данила on 04.11.2024.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Weight_Journal

final class UserInfoViewModelTests: XCTestCase {
    
    var viewModel: UserInfoViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = UserInfoViewModel.shared
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }

    func testCurrentInput() throws {
        var value = viewModel.checkValidString(textField: NSString(), range: NSRange(), string: "123", textFieldText: "123")
        XCTAssertTrue(value)
        value = viewModel.checkValidString(textField: NSString(), range: NSRange(), string: "ab3", textFieldText: "ab3")
        XCTAssertFalse(value)
    }
    
    func testCurrentSetCalories() throws {
        var value = Int(viewModel.currentCcal)
        XCTAssertNil(value)
        
        viewModel.ccal.onNext("1000")
        viewModel.getCcal.onNext(2000)
        
        value = Int(viewModel.currentCcal)
        XCTAssertEqual(value, 1000)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
