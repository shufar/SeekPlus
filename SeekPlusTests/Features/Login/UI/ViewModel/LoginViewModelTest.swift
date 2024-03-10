//
//  LoginViewModelTest.swift
//  SeekPlusTests
//
//  Created by Shubham
//

import Apollo
import ApolloTestSupport
import Combine
import Cuckoo
import SeekPlusAPI
import SeekPlusAPITestMocks
import XCTest
@testable import SeekPlus

final class LoginViewModelTest: XCTestCase {
    private var loginViewModel: (any LoginViewModelContract)?
    private var mockLoginInteractor: MockLoginInteractorContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginViewModel = nil
        mockLoginInteractor = nil

        mockLoginInteractor = MockLoginInteractorContract()

        loginViewModel = LoginViewModel(loginInteractor: mockLoginInteractor)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockLoginInteractor)
        mockLoginInteractor = nil
        loginViewModel = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockLoginInteractor, times(1))
            .login(MockData.username, MockData.password)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockLoginInteractor)
    }
}

extension LoginViewModelTest {
    private func setupStubForSuccess() {
        reset(mockLoginInteractor)
        stub(mockLoginInteractor) { stub in
            when(stub.login(MockData.username, MockData.password))
                .thenReturn(Result.success(MockLoginData.authUserApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockLoginInteractor)
        stub(mockLoginInteractor) { stub in
            when(stub.login(MockData.username, MockData.password))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension LoginViewModelTest {
    func testLogin_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testLogin_ReturnsSuccess")

        loginViewModel?.login(MockData.username, MockData.password)
        expectation.fulfill()

        wait(for: [expectation], timeout: 2)

        XCTAssertNotNil(loginViewModel?.isTokenSavedSuccessfully)
        XCTAssertEqual(loginViewModel?.isTokenSavedSuccessfully, true)

        self.verify()
        self.verifyNoMoreInteractions()
    }

    func testLogin_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testLogin_ReturnsFailure")

        loginViewModel?.login(MockData.username, MockData.password)
        expectation.fulfill()

        XCTAssertNotNil(loginViewModel?.isTokenSavedSuccessfully)
        XCTAssertEqual(loginViewModel?.isTokenSavedSuccessfully, false)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}
