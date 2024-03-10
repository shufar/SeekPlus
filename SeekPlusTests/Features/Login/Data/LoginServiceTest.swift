//
//  LoginServiceTest.swift
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

final class LoginServiceTest: XCTestCase {
    private var loginService: LoginServiceContract!
    private var mockNetworkProvider: MockNetworkProviderContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginService = nil
        mockNetworkProvider = nil

        mockNetworkProvider = MockNetworkProviderContract()
        loginService = LoginService(networkProvider: mockNetworkProvider)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockNetworkProvider)
        mockNetworkProvider = nil
        loginService = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockNetworkProvider, times(1))
            .perform(mutation: any(AuthUserMutation.self), resultHandler: anyClosure())
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockNetworkProvider)
    }
}

extension LoginServiceTest {
    private func setupStubForSuccess() {
        reset(mockNetworkProvider)
        stub(mockNetworkProvider) { stub in
            when(stub.perform(mutation: any(AuthUserMutation.self),
                              resultHandler: anyClosure()))
            .then { (_, result) in
                if let res = result {
                    let query = MockGraphQLLoginData.authUserMutationModel
                    let queryResult = GraphQLResult<AuthUserMutation.Data>(data:query,
                                                                           extensions: nil,
                                                                           errors: nil,
                                                                           source: .server,
                                                                           dependentKeys: nil)
                    res(.success(queryResult))
                }
                return DefaultValueRegistry.defaultValue(for: (Apollo.Cancellable?).self)
            }
        }
    }

    private func setupStubForFailure() {
        reset(mockNetworkProvider)
        stub(mockNetworkProvider) { stub in
            when(stub.perform(mutation: any(AuthUserMutation.self),
                              resultHandler: anyClosure()))
            .then { (_, result) in
                if let res = result {
                    res(.failure(MockError.others))
                }
                return DefaultValueRegistry.defaultValue(for: (Apollo.Cancellable?).self)
            }
        }
    }
}

extension LoginServiceTest {
    func testAuthUser_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testAuthUser_ReturnsSuccess")

        loginService
            .login(MockData.username,
                   MockData.password)
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
}

extension LoginServiceTest {
    func testAuthUser_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testAuthUser_ReturnsFailure")

        loginService
            .login(MockData.username,
                   MockData.password)
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
