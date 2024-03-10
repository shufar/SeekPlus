//
//  LoginInteractorTest.swift
//  SeekPlusTests
//
// Created by Shubham
//

import Apollo
import ApolloTestSupport
import Combine
import Cuckoo
import SeekPlusAPI
import SeekPlusAPITestMocks
import XCTest
@testable import SeekPlus

final class LoginInteractorTest: XCTestCase {
    private var loginInteractor: LoginInteractorContract!
    private var mockLoginService: MockLoginServiceContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginInteractor = nil
        mockLoginService = nil

        mockLoginService = MockLoginServiceContract()
        loginInteractor = LoginInteractor(loginService: mockLoginService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockLoginService)
        mockLoginService = nil
        loginInteractor = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockLoginService, times(1))
            .login(MockData.username, MockData.password)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockLoginService)
    }
}

extension LoginInteractorTest {
    private func setupStubForSuccess() {
        reset(mockLoginService)
        stub(mockLoginService) { stub in
            when(stub.login(MockData.username, MockData.password))
                .thenReturn(Result.success(MockLoginData.authUserApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockLoginService)
        stub(mockLoginService) { stub in
            when(stub.login(MockData.username, MockData.password))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension LoginInteractorTest {
    func testAuthUser_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testAuthUser_ReturnsSuccess")

        loginInteractor
            .login(MockData.username, MockData.password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testAuthUser_ReturnsSuccess")
                }
                expectation.fulfill()
            }, receiveValue: { res in
                XCTAssertNotNil(res)
                XCTAssertEqual(res.auth,
                               MockGraphQLLoginData.authToken)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }

    func testAuthUser_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testAuthUser_ReturnsFailure")

        loginInteractor
            .login(MockData.username, MockData.password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("testAuthUser_ReturnsFailure")
                case .failure:
                    XCTAssertTrue(true)
                }
                expectation.fulfill()
            }, receiveValue: { _ in
                // Nothing here
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}
