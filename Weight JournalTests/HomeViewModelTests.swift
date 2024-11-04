//
//  HomeViewModelTests.swift
//  Weight JournalTests
//
//  Created by Данила on 23.10.2024.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Weight_Journal

final class HomeViewModelTests: XCTestCase {

    
    var viewModel: HomeViewModel!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = HomeViewModel.shared
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }

    func testSignOutComplete() {
        viewModel.signOut()
        
        XCTAssertFalse(UserDefaults.standard.bool(forKey: "SignIn"))
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
