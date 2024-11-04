//
//  Weight_JournalTests.swift
//  Weight JournalTests
//
//  Created by Данила on 22.10.2024.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Weight_Journal

class AuthViewModelTests: XCTestCase {
    var viewModel: AuthViewModel!
    var disposeBag: DisposeBag!
    var testText = UILabel()
    
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = AuthViewModel.shared
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        disposeBag = nil
        try super.tearDownWithError()
    }

    func testSuccessfulRegistration() {
        let expectation = XCTestExpectation(description: "User registration completed")
        
        viewModel.email.onNext("test@test.com")
        viewModel.name.onNext("Name")
        viewModel.password.onNext("Password")
        
        
        XCTAssertEqual("test@test.com", viewModel.currentEmail)
        XCTAssertEqual("Name", viewModel.currentName)
        XCTAssertEqual("Password", viewModel.currentPassword)
    }
    
    func testValidationData() {
        viewModel.email.onNext("test$test.com")
        XCTAssertFalse(viewModel.model.isEmailValid(viewModel.currentEmail), "Email is invalid")
        viewModel.email.onNext("")
        XCTAssertFalse(viewModel.model.isEmailValid(viewModel.currentEmail), "Email is invalid")
        viewModel.email.onNext("a@t.r")
        XCTAssertFalse(viewModel.model.isEmailValid(viewModel.currentEmail), "Email is invalid")
        viewModel.email.onNext("te st@test.com")
        XCTAssertFalse(viewModel.model.isEmailValid(viewModel.currentEmail), "Email is invalid")
    }

    
    func testRegistrationComplete() {
        let expectation = XCTestExpectation(description: "User registration completed")
        
        viewModel.email.onNext("test@new.com")
        viewModel.name.onNext("Name")
        viewModel.password.onNext("Password")
        
//        viewModel.registration()
        
        viewModel.authModel.registrationCompletion = { email, password, name in
            XCTAssertEqual(email, "test@new.com")
            XCTAssertEqual(password, "Password")
            XCTAssertEqual(name, "Name")
            expectation.fulfill() // Сигнализируем о завершении
        }
    }
    
    func testRegistrationFailed() {
        let expectation = XCTestExpectation(description: "User registration completed")
        
        viewModel.email.onNext("testnew.com")
        viewModel.name.onNext("Name")
        viewModel.password.onNext("Password")
        
//        viewModel.registration()
        
        viewModel.authModel.registrationCompletion = { email, password, name in
            XCTAssertNil(email)
            XCTAssertNil(password)
            XCTAssertNil(name)
            expectation.fulfill() // Сигнализируем о завершении
        }
    }
    
    
    func testLogInComplete() {
        let expectation = XCTestExpectation(description: "User sign in completed")
        
        viewModel.email.onNext("test@new.com")
        viewModel.password.onNext("Password")
        
        viewModel.logIn()
        
        let documentID = UserDefaults.standard.string(forKey: "DocumentID")
        
        XCTAssertNotNil(documentID)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        viewModel.email.onNext("test@test.com")
        viewModel.name.onNext("Name")
        viewModel.password.onNext("Password")
        self.measure {
//            viewModel.registration()
        }
    }

}
