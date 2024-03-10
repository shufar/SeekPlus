//
//  JobDetailsServiceTest.swift
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

final class JobDetailsServiceTest: XCTestCase {
    private var jobDetialsService: JobDetailsServiceContract!
    private var mockNetworkProvider: MockNetworkProviderContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        jobDetialsService = nil
        mockNetworkProvider = nil

        mockNetworkProvider = MockNetworkProviderContract()
        jobDetialsService = JobDetailsService(networkProvider: mockNetworkProvider)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockNetworkProvider)
        mockNetworkProvider = nil
        jobDetialsService = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockNetworkProvider, times(1))
            .fetch(query: any(JobDetailsQuery.self),
                   resultHandler: anyClosure())
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockNetworkProvider)
    }
}

extension JobDetailsServiceTest {
    private func setupStubForSuccess(withData: Bool = true) {
        reset(mockNetworkProvider)
        stub(mockNetworkProvider) { stub in
            when(stub.fetch(query: any(JobDetailsQuery.self),
                            resultHandler: anyClosure()))
            .then { (_, result) in
                if let res = result {
                    let queryWithdata = MockGraphQLJobDetailsData.jobDetailsQueryModelWithData
                    let queryResult = GraphQLResult<JobDetailsQuery.Data>(data:queryWithdata,
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
            when(stub.fetch(query: any(JobDetailsQuery.self),
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

extension JobDetailsServiceTest {
    func testGetJobDetails_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testGetJobDetails_ReturnsSuccess")

        jobDetialsService
            .getJobDetails(MockData.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testGetJobDetails_ReturnsSuccess")
                }
                expectation.fulfill()
            }, receiveValue: { res in
                XCTAssertNotNil(res)
                XCTAssertEqual(res.id, MockData.id)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}

extension JobDetailsServiceTest {
    func testGetJobDetails_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testGetJobDetails_ReturnsFailure")

        jobDetialsService
            .getJobDetails(MockData.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("testGetJobDetails_ReturnsFailure")
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
