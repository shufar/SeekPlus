//
//  JobDetailsInteractorTest.swift
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

final class JobDetailsInteractorTest: XCTestCase {
    private var jobDetailsInteractor: JobDetailsInteractorContract!
    private var mockJobDetailsService: MockJobDetailsServiceContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        jobDetailsInteractor = nil
        mockJobDetailsService = nil

        mockJobDetailsService = MockJobDetailsServiceContract()
        jobDetailsInteractor = JobDetailsInteractor(jobDetailsService: mockJobDetailsService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockJobDetailsService)
        mockJobDetailsService = nil
        jobDetailsInteractor = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockJobDetailsService, times(1))
            .getJobDetails(MockData.id)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockJobDetailsService)
    }
}

extension JobDetailsInteractorTest {
    private func setupStubForSuccess() {
        reset(mockJobDetailsService)
        stub(mockJobDetailsService) { stub in
            when(stub.getJobDetails(MockData.id))
                .thenReturn(Result.success(MockActiveJobsData.job)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockJobDetailsService)
        stub(mockJobDetailsService) { stub in
            when(stub.getJobDetails(MockData.id))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension JobDetailsInteractorTest {
    func testGeJobDetails_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testGeJobDetails_ReturnsSuccess")

        jobDetailsInteractor
            .getJobDetails(MockData.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertTrue(true)
                case .failure:
                    XCTFail("testGeJobDetails_ReturnsSuccess")
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

    func testGeJobDetails_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testGeJobDetails_ReturnsFailure")

        jobDetailsInteractor
            .getJobDetails(MockData.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("testGeJobDetails_ReturnsFailure")
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
