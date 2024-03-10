//
//  MockJobData.swift
//  SeekPlusTests
//
//  Created by Shubham
//

import Apollo
import ApolloTestSupport
import SeekPlusAPI
import SeekPlusAPITestMocks

struct MockGraphQLActiveJobsData {
    private static let salaryRange = Mock<SalaryRange>(max: 10, min: 100)
    static let job = Mock<Job>(_id: MockData.id,
                               description: MockData.description,
                               haveIApplied: MockData.applied,
                               industry: MockData.industry,
                               location: MockData.location,
                               positionTitle: MockData.positionTitle,
                               salaryRange: salaryRange)
    private static let getJobsResponseWithData = Mock<GetJobsResponse>(hasNext: MockData.hasNext,
                                                                       jobs: [job],
                                                                       page: MockData.page,
                                                                       size: MockData.size,
                                                                       total: MockData.total)

    private static let getJobsResponseWithoutData = Mock<GetJobsResponse>(hasNext: MockData.hasNext,
                                                                          jobs: [],
                                                                          page: MockData.page,
                                                                          size: MockData.size,
                                                                          total: MockData.total)

    private static let activeJobsQueryWithData = Mock<Query>(active: getJobsResponseWithData)
    private static let activeJobsQueryWithoutData = Mock<Query>(active: getJobsResponseWithoutData)

    static let activeJobListQueryModelWithData = ActiveJobListQuery.Data.from(activeJobsQueryWithData)
    static let activeJobListQueryModelWithoutData = ActiveJobListQuery.Data.from(activeJobsQueryWithoutData)
}
