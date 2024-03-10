//
//  HomeServiceTest.swift
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

final class HomeServiceTest: XCTestCase {
    private var homeService: HomeServiceContract!
    private var mockNetworkProvider: MockNetworkProviderContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        homeService = nil
        mockNetworkProvider = nil

        mockNetworkProvider = MockNetworkProviderContract()
        homeService = HomeService(networkProvider: mockNetworkProvider)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockNetworkProvider)
        mockNetworkProvider = nil
        homeService = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockNetworkProvider, times(1))
            .fetch(query: any(ActiveJobListQuery.self),
                   resultHandler: anyClosure())
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockNetworkProvider)
    }
}

extension HomeServiceTest {
    private func setupStubForSuccess(withData: Bool = true) {
        reset(mockNetworkProvider)
        stub(mockNetworkProvider) { stub in
            when(stub.fetch(query: any(ActiveJobListQuery.self),
                            resultHandler: anyClosure()))
            .then { (_, result) in
                if let res = result {
                    let queryWithdata = MockGraphQLActiveJobsData.activeJobListQueryModelWithData
                    let queryWithoutdata = MockGraphQLActiveJobsData.activeJobListQueryModelWithoutData
                    let queryResult = GraphQLResult<ActiveJobListQuery.Data>(data: withData
                                                                             ? queryWithdata
                                                                             : queryWithoutdata,
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
            when(stub.fetch(query: any(ActiveJobListQuery.self),
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

extension HomeServiceTest {
    func testGeActiveJobList_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testGeActiveJobList_ReturnsSuccess")

        homeService.getActiveJobList(MockData.size, MockData.page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testGeActiveJobList_ReturnsSuccess")
                }
                expectation.fulfill()
            }, receiveValue: { res in
                XCTAssertNotNil(res)
                XCTAssertEqual(res.size, MockData.size)
                XCTAssertTrue(!res.jobs.isEmpty)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }

    func testGeActiveJobList_NoData_ReturnsSuccess() throws {
        self.setupStubForSuccess(withData: false)

        let expectation = XCTestExpectation(description: "testGeActiveJobList_NoData_ReturnsSuccess")

        homeService.getActiveJobList(MockData.size, MockData.page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testGeActiveJobList_NoData_ReturnsSuccess")
                }
                expectation.fulfill()
            }, receiveValue: { res in
                XCTAssertNotNil(res)
                XCTAssertEqual(res.size, MockData.size)
                XCTAssertEqual(res.jobs, [])
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}

extension HomeServiceTest {
    func testGeActiveJobList_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testGeActiveJobList_ReturnsFailure")

        homeService.getActiveJobList(MockData.size, MockData.page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("testGeActiveJobList_ReturnsFailure")
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
