//
//  HomeViewModelTest.swift
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

final class HomeViewModelTest: XCTestCase {
    private var homeViewModel: HomeViewModelContract!
    private var mockHomeInteractor: MockHomeInteractorContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        homeViewModel = nil
        mockHomeInteractor = nil

        mockHomeInteractor = MockHomeInteractorContract()
        homeViewModel = HomeViewModel(mockHomeInteractor)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockHomeInteractor)
        mockHomeInteractor = nil
        homeViewModel = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockHomeInteractor, times(1))
            .getActiveJobList(MockData.size_5, MockData.page)
    }

    private func verifyForPagination() {
        Cuckoo.verify(mockHomeInteractor, times(1))
            .getActiveJobList(MockData.size_5, MockData.page_2)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockHomeInteractor)
    }
}

extension HomeViewModelTest {
    private func setupStubForSuccess() {
        reset(mockHomeInteractor)
        stub(mockHomeInteractor) { stub in
            when(stub.getActiveJobList(MockData.size_5, MockData.page))
                .thenReturn(Result.success(MockActiveJobsData.activeJobListApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockHomeInteractor)
        stub(mockHomeInteractor) { stub in
            when(stub.getActiveJobList(MockData.size_5, MockData.page))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForPaginationForSuccess() {
        reset(mockHomeInteractor)
        stub(mockHomeInteractor) { stub in
            when(stub.getActiveJobList(MockData.size_5, MockData.page_2))
                .thenReturn(Result.success(MockActiveJobsData.activeJobListApiModelForPagination)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension HomeViewModelTest {
    func testLoadData_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testLoadData_ReturnsSuccess")

        homeViewModel.loadData()

        homeViewModel.jobs
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

        homeViewModel.loadData()
        expectation.fulfill()

        XCTAssert(homeViewModel.jobs.isEmpty)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }
}

extension HomeViewModelTest {
    func testLoadMoreData_ReturnsSuccess() throws {
        var jobs: [JobApiModel] = []

        // Setup for `loadData` call as a pre-requisite for pagination call
        self.setupStubForSuccess()

        homeViewModel.loadData()
        let job = try awaitPublisher(homeViewModel.jobs.publisher, timeout: 2.0)

        jobs.append(job)
        XCTAssertNotNil(jobs)

        // Setup for `loadMoreData` call
        self.setupStubForPaginationForSuccess()

        homeViewModel.loadMoreData(currentItem: MockActiveJobsData.job)
        let paginatedJobs = try awaitPublisher(homeViewModel.jobs.publisher, timeout: 2.0)

        jobs.append(paginatedJobs)

        XCTAssertNotNil(jobs)
        XCTAssertFalse(jobs.isEmpty)
        XCTAssertEqual(jobs[1].id, MockActiveJobsData.jobPagination.id)

        self.verifyForPagination()
        self.verifyNoMoreInteractions()
    }
}
