//
//  AppliedJobsViewModelTest.swift
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

final class AppliedJobsViewModelTest: XCTestCase {
    private var appliedJobsViewModel: (any AppliedJobsViewModelContract)?
    private var mockHomeInteractor: MockHomeInteractorContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        appliedJobsViewModel = nil
        mockHomeInteractor = nil

        mockHomeInteractor = MockHomeInteractorContract()
        appliedJobsViewModel = AppliedJobsViewModel(mockHomeInteractor)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockHomeInteractor)
        mockHomeInteractor = nil
        appliedJobsViewModel = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockHomeInteractor, times(1))
            .getActiveJobList(MockData.size_20, MockData.page)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockHomeInteractor)
    }
}

extension AppliedJobsViewModelTest {
    private func setupStubForSuccess() {
        reset(mockHomeInteractor)
        stub(mockHomeInteractor) { stub in
            when(stub.getActiveJobList(MockData.size_20, MockData.page))
                .thenReturn(Result.success(MockActiveJobsData.activeJobListApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockHomeInteractor)
        stub(mockHomeInteractor) { stub in
            when(stub.getActiveJobList(MockData.size_20, MockData.page))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension AppliedJobsViewModelTest {
    func testLoadData_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testLoadData_ReturnsSuccess")

        appliedJobsViewModel?.loadData()

        appliedJobsViewModel?.appliedJobs
            .publisher.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testLoadData_ReturnsSuccess")
                }
                expectation.fulfill()
            }, receiveValue: { res in
                XCTAssertNotNil(res)
                XCTAssertEqual(res.positionTitle, MockData.positionTitle)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }

    func testLoadData_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testLoadData_ReturnsFailure")

        appliedJobsViewModel?.loadData()
        expectation.fulfill()

        XCTAssert(((appliedJobsViewModel?.appliedJobs.isEmpty) != nil))

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}
