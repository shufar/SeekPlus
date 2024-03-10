//
//  ApplyJobServiceTest.swift
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

final class ApplyJobServiceTest: XCTestCase {
    private var applyJobService: ApplyJobServiceContract!
    private var mockNetworkProvider: MockNetworkProviderContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        applyJobService = nil
        mockNetworkProvider = nil

        mockNetworkProvider = MockNetworkProviderContract()
        applyJobService = ApplyJobService(networkProvider: mockNetworkProvider)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockNetworkProvider)
        mockNetworkProvider = nil
        applyJobService = nil
        cancellables = Set<AnyCancellable>()

    }

    private func verify() {
        Cuckoo.verify(mockNetworkProvider, times(1))
            .perform(mutation: any(ApplyMutation.self),
                     resultHandler: anyClosure())
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockNetworkProvider)
    }
}

extension ApplyJobServiceTest {
    private func setupStubForSuccess() {
        reset(mockNetworkProvider)
        stub(mockNetworkProvider) { stub in
            when(stub.perform(mutation: any(ApplyMutation.self),
                              resultHandler: anyClosure()))
            .then { (_, result) in
                if let res = result {
                    let query = MockGraphQLApplyJobData.applyJobMutationModel
                    let queryResult = GraphQLResult<ApplyMutation.Data>(data:query,
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
            when(stub.perform(mutation: any(ApplyMutation.self),
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

extension ApplyJobServiceTest {
    func testApplyForJob_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testApplyForJob_ReturnsSuccess")

        applyJobService
            .applyForJob(MockData.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testApplyForJob_ReturnsSuccess")
                }
                expectation.fulfill()
            }, receiveValue: { res in
                XCTAssertNotNil(res)
                XCTAssertTrue(res.apply)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}

extension ApplyJobServiceTest {
    func testApplyForJob_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testApplyForJob_ReturnsFailure")

        applyJobService
            .applyForJob(MockData.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("testApplyForJob_ReturnsFailure")
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
