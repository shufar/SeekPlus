//
//  ApplyJobInteractorTest.swift
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

final class ApplyJobInteractorTest: XCTestCase {
    private var applyJobInteractor: ApplyJobInteractorContract!
    private var mockApplyJobService: MockApplyJobServiceContract!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        applyJobInteractor = nil
        mockApplyJobService = nil

        mockApplyJobService = MockApplyJobServiceContract()
        applyJobInteractor = ApplyJobInteractor(applyJobService: mockApplyJobService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(mockApplyJobService)
        mockApplyJobService = nil
        applyJobInteractor = nil
        cancellables = Set<AnyCancellable>()
    }

    private func verify() {
        Cuckoo.verify(mockApplyJobService, times(1))
            .applyForJob(MockData.id)
    }

    private func verifyNoMoreInteractions() {
        Cuckoo.verifyNoMoreInteractions(mockApplyJobService)
    }
}

extension ApplyJobInteractorTest {
    private func setupStubForSuccess() {
        reset(mockApplyJobService)
        stub(mockApplyJobService) { stub in
            when(stub.applyForJob(MockData.id))
                .thenReturn(Result.success(MockApplyJobData.applyJobApiModel)
                    .publisher.eraseToAnyPublisher())
        }
    }

    private func setupStubForFailure() {
        reset(mockApplyJobService)
        stub(mockApplyJobService) { stub in
            when(stub.applyForJob(MockData.id))
                .thenReturn(Result.failure(MockError.others)
                    .publisher.eraseToAnyPublisher())
        }
    }
}

extension ApplyJobInteractorTest {
    func testApplyForJob_ReturnsSuccess() throws {
        self.setupStubForSuccess()

        let expectation = XCTestExpectation(description: "testApplyForJob_ReturnsSuccess")

        applyJobInteractor
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
                XCTAssertEqual(res.apply,
                               MockGraphQLApplyJobData.applyForJob)
            }).store(in: &cancellables)

        wait(for: [expectation], timeout: 2)

        self.verify()
        self.verifyNoMoreInteractions()
    }

    func testApplyForJob_ReturnsFailure() throws {
        self.setupStubForFailure()

        let expectation = XCTestExpectation(description: "testApplyForJob_ReturnsFailure")

        applyJobInteractor
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
