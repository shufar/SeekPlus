//
//  HomeInteractorTest.swift
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

final class HomeInteractorTest: XCTestCase {
    private var homeInteractor: HomeInteractorContract!
    private var mockHomeService: MockHomeServiceContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        homeInteractor = nil
        mockHomeService = nil

        mockHomeService = MockHomeServiceContract()
        homeInteractor = HomeInteractor(homeService: mockHomeService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockHomeService)
        mockHomeService = nil
        homeInteractor = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockHomeService, times(1))
            .getActiveJobList(MockData.size, MockData.page)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockHomeService)
    }
}

extension HomeInteractorTest {
    private func setupStubForSuccess() {
        reset(mockHomeService)
        stub(mockHomeService) { stub in
            when(stub.getActiveJobList(MockData.size, MockData.page))
                .thenReturn(Result.success(MockActiveJobsData.activeJobListApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockHomeService)
        stub(mockHomeService) { stub in
            when(stub.getActiveJobList(MockData.size, MockData.page))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension HomeInteractorTest {
    func testGeActiveJobList_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testGeActiveJobList_ReturnsSuccess")

        homeInteractor.getActiveJobList(MockData.size, MockData.page)
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
                XCTAssertEqual(res.total, MockData.total)
                XCTAssertTrue(!res.jobs.isEmpty)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }

    func testGeActiveJobList_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testGeActiveJobList_ReturnsFailure")

        homeInteractor.getActiveJobList(MockData.size, MockData.page)
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
