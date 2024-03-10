//
//  JobDetailsViewModelTest.swift
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

final class JobDetailsViewModelTest: XCTestCase {
    private var jobDetailsViewModel: (any JobDetailsViewModelContract)?
    private var mockJobDetailsInteractor: MockJobDetailsInteractorContract!
    private var mockApplyJobInteractor: MockApplyJobInteractorContract!

    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        jobDetailsViewModel = nil
        mockJobDetailsInteractor = nil
        mockApplyJobInteractor = nil

        mockJobDetailsInteractor = MockJobDetailsInteractorContract()
        mockApplyJobInteractor = MockApplyJobInteractorContract()

        jobDetailsViewModel = JobDetailsViewModel(mockJobDetailsInteractor,
                                                  mockApplyJobInteractor)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockJobDetailsInteractor)
        mockJobDetailsInteractor = nil

        reset(mockApplyJobInteractor)
        mockApplyJobInteractor = nil

        jobDetailsViewModel = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verifyForJobDetails() {
        Cuckoo.verify(mockJobDetailsInteractor, times(1))
            .getJobDetails(MockData.id)
    }

    private func verifyForApplyJob() {
        Cuckoo.verify(mockApplyJobInteractor, times(1))
            .applyForJob(MockData.id)
    }

    private func verifyNoMoreInteractionsForJobDetails() {
        Cuckoo.verifyNoMoreInteractions(mockJobDetailsInteractor)
    }

    private func verifyNoMoreInteractionsForApplyJob() {
        Cuckoo.verifyNoMoreInteractions(mockApplyJobInteractor)
    }
}

extension JobDetailsViewModelTest {
    private func setupStubForSuccessForJobDetails() {
        reset(mockJobDetailsInteractor)
        stub(mockJobDetailsInteractor) { stub in
            when(stub.getJobDetails(MockData.id))
                .thenReturn(Result.success(MockActiveJobsData.job)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailureForJobDetails() {
        reset(mockJobDetailsInteractor)
        stub(mockJobDetailsInteractor) { stub in
            when(stub.getJobDetails(MockData.id))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForSuccessForApplyJob() {
        reset(mockApplyJobInteractor)
        stub(mockApplyJobInteractor) { stub in
            when(stub.applyForJob(MockData.id))
                .thenReturn(Result.success(MockApplyJobData.applyJobApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailureForApplyJob() {
        reset(mockApplyJobInteractor)
        stub(mockApplyJobInteractor) { stub in
            when(stub.applyForJob(MockData.id))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

// MARK: - Job details related methods
extension JobDetailsViewModelTest {
    func testLoadData_ReturnsSuccess() throws {
        self.setupStubForSuccessForJobDetails()

        let expectation = XCTestExpectation(description: "testLoadData_ReturnsSuccess")

        jobDetailsViewModel?.loadData(MockData.id)
        expectation.fulfill()

        wait(for: [expectation], timeout: 2)

        XCTAssertNotNil(jobDetailsViewModel?.jobDetails)
        XCTAssertEqual(jobDetailsViewModel?.jobDetails.description,
                       MockActiveJobsData.job.description)

        self.verifyForJobDetails()
        self.verifyNoMoreInteractionsForJobDetails()
    }

    func testLoadData_ReturnsFailure() throws {
        self.setupStubForFailureForJobDetails()

        let expectation = XCTestExpectation(description: "testLoadData_ReturnsFailure")

        jobDetailsViewModel?.loadData(MockData.id)
        expectation.fulfill()

        XCTAssertNotNil(jobDetailsViewModel?.jobDetails)

        wait(for: [expectation], timeout: 2)

        self.verifyForJobDetails()
        self.verifyNoMoreInteractionsForJobDetails()
    }
}

// MARK: - Apply Job related methods
extension JobDetailsViewModelTest {
    func testApplyForJob_ReturnsSuccess() throws {
        self.setupStubForSuccessForApplyJob()

        let expectation = XCTestExpectation(description: "testApplyForJob_ReturnsSuccess")

        jobDetailsViewModel?.applyForJob(MockData.id)
        expectation.fulfill()

        wait(for: [expectation], timeout: 2)

        XCTAssertNotNil(jobDetailsViewModel?.isJobAppliedSuccessfully)
        XCTAssertEqual(jobDetailsViewModel?.isJobAppliedSuccessfully, true)

        self.verifyForApplyJob()
        self.verifyNoMoreInteractionsForApplyJob()
    }

    func testApplyForJob_ReturnsFailure() throws {
        self.setupStubForFailureForApplyJob()

        let expectation = XCTestExpectation(description: "testApplyForJob_ReturnsFailure")

        jobDetailsViewModel?.applyForJob(MockData.id)
        expectation.fulfill()

        XCTAssertEqual(jobDetailsViewModel?.isJobAppliedSuccessfully, false)

        wait(for: [expectation], timeout: 2)

        self.verifyForApplyJob()
        self.verifyNoMoreInteractionsForApplyJob()
    }
}
