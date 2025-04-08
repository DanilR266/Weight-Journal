//
//  Weight_JournalTests.swift
//  Weight JournalTests
//
//  Created by Данила on 22.10.2024.
//

import XCTest
@testable import Weight_Journal

class MockAuthenticateView: AuthenticateViewProtocol {
    var setLoaderCalled = false
    var stopLoaderCalled = false
    var pushViewControllerCalled = false
    var buttonsAnimationValues: (CGFloat, CGFloat)?
    var changeConstraintValues: (CGFloat, Bool)?
    
    func setLoader() { setLoaderCalled = true }
    func stopLoader() { stopLoaderCalled = true }
    func buttonsAnimation(_ alphaFirst: CGFloat, _ alphaSecond: CGFloat) { buttonsAnimationValues = (alphaFirst, alphaSecond) }
    func changeConstraint(_ constant: CGFloat, _ begin: Bool) { changeConstraintValues = (constant, begin) }
    func pushViewController(vc: UIViewController) { pushViewControllerCalled = true }
}

class MockAuthenticateServer: AuthorizationManagerProtocol {
    var loginUserResult: Result<UserLoginSuccess, Error> = .success(UserLoginSuccess(access_token: "mock_token", token_type: "bearer"))
    
    var registrationUserResult: Result<UserRegistrationSuccess, Error> = .success(UserRegistrationSuccess(message: "message", user_id: 0, access_token: "mock_token", name: "Name", email: "Email"))
    
    func registrationUser(user: UserRegistration) async throws -> UserRegistrationSuccess {
        switch registrationUserResult {
        case .success(let success): return success
        case .failure(let error): throw error
        }
    }
    
    func loginUser(user: UserLogin) async throws -> UserLoginSuccess {
        switch loginUserResult {
        case .success(let success): return success
        case .failure(let error): throw error
        }
    }
    
    
}

class AuthenticatePresenterTests: XCTestCase {
    
    var presenter: AuthenticatePresenter!
    var mockView: MockAuthenticateView!
    var mockAuthManager: AuthorizationManagerProtocol!
    
    override func setUp() {
        super.setUp()
        mockView = MockAuthenticateView()
        mockAuthManager = MockAuthenticateServer()
        presenter = AuthenticatePresenter(view: mockView, authenticateModelServer: mockAuthManager)
    }
    
    func testRegisterUserWithValidData() async {
        // Given
        let name = "Valid Name"
        let email = "valid@email.com"
        let password = "ValidPassword123"
        
        // When
        presenter.registerUser(name: name, email: email, password: password)
        
        // Ожидаем завершения асинхронных операций
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // Then
        XCTAssertTrue(mockView.setLoaderCalled)
        XCTAssertTrue(mockView.stopLoaderCalled)
    }
}
